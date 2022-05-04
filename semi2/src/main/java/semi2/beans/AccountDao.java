package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {
	public void insert(AccountDto accountDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into account(order_no, member_id, account_bank, account_no, account_name, account_price) values(?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, accountDto.getOrderNo());
		ps.setString(2, accountDto.getMemberId());
		ps.setString(3, accountDto.getAccountBank());		
		ps.setLong(4, accountDto.getAccountNo());
		ps.setString(5, accountDto.getAccountName());
		ps.setInt(6, accountDto.getAccountPrice());
		
		ps.execute();
		con.close();
	}
	public boolean checked(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update account set account_date=sysdate, account_check='o' where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
		
	}
	public AccountDto selectOne(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from Account where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		AccountDto accountDto = new AccountDto();
		accountDto.setOrderNo(orderNo);
		accountDto.setMemberId(rs.getString("memder_id"));
		accountDto.setAccountBank(rs.getString("account_bank"));
		accountDto.setAccountNo(rs.getLong("account_no"));
		accountDto.setAccountName(rs.getString("account_name"));
		accountDto.setAccountPrice(rs.getInt("account_price"));
		accountDto.setAccountCheck(rs.getString("account_check"));
		
		con.close();
		return accountDto;
	}
	public List<AccountDto> selectNon() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from account where account_check='x'";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		List<AccountDto> list = new ArrayList<>();
		while(rs.next()) {
			AccountDto accountDto = new AccountDto();
			accountDto.setOrderNo(rs.getInt("order_no"));
			accountDto.setMemberId(rs.getString("member_id"));
			accountDto.setAccountNo(rs.getLong("account_no"));
			accountDto.setAccountName(rs.getString("account_name"));
			accountDto.setAccountPrice(rs.getInt("account_price"));
			accountDto.setAccountCheck(rs.getString("account_check"));
			
			list.add(accountDto);
		}
		
		con.close();
		return list;
	}
	public int accountsales(String yearMonth) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select sum(account_price) from account where to_char(account_date, 'yyyy-mm')=? and account_check='o'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int total = rs.getInt("sum(account_price)");
		con.close();
		return total;
	}
	
}
