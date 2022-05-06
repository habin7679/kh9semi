package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BuyDao {
	public void insertAccount(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into buy(buy_no, member_id, order_no, buy_status) values(buy_no_seq.nextval,?,?,'입금전')";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getOrderNo());
		
		ps.execute();
		con.close();
	}
	public void insertCredit(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into buy(buy_no, member_id, order_no, buy_status) values(buy_no_seq.nextval,?,?,'결제완료')";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getOrderNo());
		
		ps.execute();
		con.close();
	}
	public boolean updateStatus(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update buy set buy_status = ? where buy_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, buyDto.getBuyStatus());
		ps.setInt(2, buyDto.getBuyNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public boolean updateInvoice(BuyDto buyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update buy set buy_status = '배송중', buy_invoice=? where buy_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setLong(1, buyDto.getBuyInvoice());
		ps.setInt(2, buyDto.getBuyNo());
		
		int count = ps.executeUpdate();
		con.close();
		
		return count>0;
	}
	public List<BuyDto> selectAll(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from buy where member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		
		ResultSet rs = ps.executeQuery();
		List<BuyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BuyDto bDto = new BuyDto();
			bDto.setBuyNo(rs.getInt("buy_no"));
			bDto.setMemberId(rs.getString("member_id"));
			bDto.setOrderNo(rs.getInt("order_no"));
			bDto.setBuyInvoice(rs.getLong("buy_invoice"));
			bDto.setBuyStatus(rs.getString("buy_status"));
			
			list.add(bDto);
		}
		con.close();
		return list;
	}
}
