package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.sql.*;

public class PayingDao {
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select order_no_seq.nextval from dual";

		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		rs.next();	//데이터가 1개니까 이동을 지시

		int no = rs.getInt("nextval");

		con.close();

		return no;
	}
	
	public void insertNo(String memberId, int no) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into paying(order_no, member_id) values(?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.setString(2, memberId);
		
		ps.execute();
		con.close();
	}
	public boolean delete(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete paying where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public int totalPrice(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select sum(order_price) from orderp where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		int totalPrice = 0;
		if(rs.next()) {
			totalPrice = rs.getInt("sum(order_price)");
		}
		
		return totalPrice;
	}
	public boolean insertRest(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update paying set paying_total=?, paying_date=sysdate, paying_name=?, paying_phone=?, "
				+ "paying_post=?, paying_basic_address=?, paying_detail_address=?, paying_delivery_fee=?, paying_delivery_date=to_date(?, 'mm-dd hh24:mi'), "
				+ "paying_delivery_time=?, paying_payway=? where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getPayingTotal());
		ps.setString(2, payingDto.getPayingName());
		ps.setString(3, payingDto.getPayingPhone());
		ps.setInt(4, payingDto.getPayingPost());
		ps.setString(5, payingDto.getPayingBasicAddress());
		ps.setString(6, payingDto.getPayingDetailAddress());
		ps.setInt(7, payingDto.getPayingDeliveryFee());
		ps.setDate(8, payingDto.getPayingDeliveryDate());
		ps.setInt(9, payingDto.getPayingDeliveryTime());
		ps.setString(10, payingDto.getPayingPayway());
		ps.setInt(11, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
	}
	public boolean insertRest2(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update paying set paying_total=?, paying_date=sysdate, paying_name=?, paying_phone=?, "
				+ "paying_post=?, paying_basic_address=?, paying_detail_address=?, paying_delivery_date=to_date(?, 'yyyy-mm-dd'), "
				+ "paying_delivery_time=? where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getPayingTotal());
		ps.setString(2, payingDto.getPayingName());
		ps.setString(3, payingDto.getPayingPhone());
		ps.setInt(4, payingDto.getPayingPost());
		ps.setString(5, payingDto.getPayingBasicAddress());
		ps.setString(6, payingDto.getPayingDetailAddress());
		ps.setDate(7, payingDto.getPayingDeliveryDate());
		ps.setInt(8, payingDto.getPayingDeliveryTime());
		ps.setInt(9, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
	}
	public Date payingDate(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select paying_date from paying where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		Date date = null;
		if(rs.next()) {
			date = rs.getDate("paying_date");
		}
		con.close();
		return date;
	}
	public PayingDto selectOne(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from paying where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		PayingDto pDto = new PayingDto();
		if(rs.next()) {
			pDto.setPayingDate(rs.getString("paying_date"));
			pDto.setPayingName(rs.getString("paying_name"));
			pDto.setPayingPhone(rs.getString("paying_phone"));
			pDto.setPayingPost(rs.getInt("paying_post"));
			pDto.setPayingBasicAddress(rs.getString("paying_basic_address"));
			pDto.setPayingDetailAddress(rs.getString("paying_detail_address"));
			pDto.setPayingDeliveryDate(rs.getDate("paying_delivery_date"));
			pDto.setPayingDeliveryTime(rs.getInt("paying_delivery_time"));
		}
		con.close();
		return pDto;
	}
}














