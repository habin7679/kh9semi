package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
	public void insert(OrderDto orderDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into orderp(order_no, product_no, product_price, order_count, order_price) values(?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderDto.getOrderNo());
		ps.setInt(2, orderDto.getProductNo());
		ps.setInt(3, orderDto.getProductPrice());
		ps.setInt(4, orderDto.getOrderCount());
		ps.setInt(5, orderDto.getOrderPrice());
		
		ps.execute();
		con.close();
	}
	public boolean deleteProduct(int orderNo, int productNo)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete from orderp where order_no=? and product_no=?";
		PreparedStatement ps =con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		ps.setInt(2, productNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public boolean deleteOrder(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete from orderp where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);

		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public List<OrderDto> selectAll(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from orderp where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		List<OrderDto> list = new ArrayList<>();
		
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setProductNo(rs.getInt("product_no"));
			orderDto.setProductPrice(rs.getInt("product_price"));
			orderDto.setOrderCount(rs.getInt("order_count"));
			orderDto.setOrderPrice(rs.getInt("order_price"));
			orderDto.setOrderReview(rs.getString("order_review"));
			list.add(orderDto);
		}
		con.close();
		return list;
	}
	public List<OrderDto> selectAllBuy(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from orderp where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		List<OrderDto> list = new ArrayList<>();
		
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setProductNo(rs.getInt("product_no"));
			orderDto.setOrderCount(rs.getInt("order_count"));
			list.add(orderDto);
		}
		con.close();
		return list;
	}	
	public List<OrderDto> selectAllPaying(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from orderp where order_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		List<OrderDto> list = new ArrayList<>();
		
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setProductNo(rs.getInt("product_no"));
			orderDto.setOrderCount(rs.getInt("order_count"));
			orderDto.setOrderPrice(rs.getInt("order_price"));
			list.add(orderDto);
		}
		con.close();
		return list;
	}
	public boolean writeReview(int orderNo, int productNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update orderp set order_review='o' where order_no=? and product_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		ps.setInt(2, productNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public int ReviewOrderNo(int productNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select order_no from orderp where order_review = 'x' and product_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, productNo);
		
		ResultSet rs = ps.executeQuery();
		
		int count = 0;
		if(rs.next()) {
			count = rs.getInt("order_no");
		}
		con.close();
		return count;
	}
}
