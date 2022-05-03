package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PayingDao {
	public void insertNo(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into paying(order_no, member_id) values(order_seq.nextval(), ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		
		ps.execute();
		con.close();
	}
	public boolean delete(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from paying where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public boolean insertRest(PayingDto payingDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update paying set paying_total=?, paying_date=sysdate, paying_name=?, paying_phone=?, "
				+ "paying_post=?, paying_basic_address=?, paying_detail_address=?, paying_delivery_fee=?, paying_delivery_date=?, "
				+ "paying_payway=? where order_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, payingDto.getPayingTotal());
		ps.setString(2, payingDto.getPayingName());
		ps.setString(3, payingDto.getPayingPhone());
		ps.setInt(4, payingDto.getPayingPost());
		ps.setString(5, payingDto.getPayingBasicAddress());
		ps.setString(6, payingDto.getPayingDetailAddress());
		ps.setInt(7, payingDto.getPayingDeliveryFee());
		ps.setDate(8, payingDto.getPayingDeliveryDate());
		ps.setString(9, payingDto.getPayingPayway());
		ps.setInt(10, payingDto.getOrderNo());
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
	}
}














