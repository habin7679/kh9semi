package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
	public void insert(OrderDto orderDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into orderp(order_no, member_id, product_no, order_count, order_review) values(?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderDto.getOrderNo());
		ps.setString(2, orderDto.getMemberId());
		ps.setInt(3, orderDto.getProductNo());
		ps.setInt(4, orderDto.getOrderCount());
		ps.setString(5, orderDto.getOrderReview());
		
		ps.execute();
		con.close();
	}
	public boolean delete(int orderNo, int productNo)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete from orderp where order_no=? and product_no=?";
		PreparedStatement ps =con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		ps.setInt(2, productNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public List<OrderDto> selectAll(int orderNo, String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "selete * from orderp where order_no=? and member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		ps.setString(2, memberId);
		
		ResultSet rs = ps.executeQuery();
		
		List<OrderDto> list = new ArrayList<>();
		
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setProductNo(rs.getInt("product_no"));
			orderDto.setOrderCount(rs.getInt("order_count"));
		}
		con.close();
		return list;
	}
	public boolean updateAmount(OrderDto orderDto, int orderCount) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update orderp set order_count=? where member_id=? and product_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, orderCount);
		ps.setString(2, orderDto.getMemberId());
		ps.setInt(3, orderDto.getProductNo());
		
		int count = ps.executeUpdate();
		con.close();
		return count>0;
	}
	
}
