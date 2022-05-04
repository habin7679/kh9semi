package semi2.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CreditDao {
	public void insert(CreditDto creditDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into credit(order_no, member_id, card_name, card_num, card_pw, card_price)"
				+ " values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, creditDto.getOrderNo());
		ps.setString(2, creditDto.getMemberId());
		ps.setString(3, creditDto.getCardName());
		ps.setLong(4, creditDto.getCardNum());
		ps.setString(5, creditDto.getCardPw());
		ps.setInt(6, creditDto.getCardPrice());
		
		ps.execute();
		con.close();
	}
	public List<CreditDto> selectAll() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from credit";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		List<CreditDto> list = new ArrayList<>();
		
		while(rs.next()) {
			CreditDto cDto = new CreditDto();
			cDto.setOrderNo(rs.getInt("order_no"));
			cDto.setMemberId(rs.getString("member_id"));
			cDto.setCardName(rs.getString("card_name"));
			cDto.setCardPrice(rs.getInt("card_price"));
			cDto.setCardDate(rs.getDate("card_date"));
			list.add(cDto);
		}
		
		con.close();
		return list;
	}
	public int cardSales(String yearMonth) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select sum(card_price) from credit where to_char(card_date, 'yyyy-mm')=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, yearMonth);
		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int total = rs.getInt("sum(card_price)");
		con.close();
		return total;
	}
	
	
}
