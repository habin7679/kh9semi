package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

	ProductDao pDao = new ProductDao();
	ProductDto pDto;
	
	public void insert(OrderDto orderDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into orderp(order_no, member_id, product_no, product_price, order_count) values(?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		pDto = pDao.selectOne(orderDto.getProductNo());
		
		ps.setInt(1, orderDto.getOrderNo());
		ps.setString(2, orderDto.getMemberId());
		ps.setInt(3, orderDto.getProductNo());
		ps.setInt(4, pDto.getProductPrice());
		ps.setInt(5, orderDto.getOrderCount());
		
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
		String sql = "select * from orderp where order_no=? and member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		ps.setString(2, memberId);
		
		ResultSet rs = ps.executeQuery();
		
		List<OrderDto> list = new ArrayList<>();
		
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setProductNo(rs.getInt("product_no"));
			orderDto.setProductPrice(rs.getInt("product_price"));
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
	public int totalPrice(int orderNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select product_price, order_count from product where order_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, orderNo);
		
		ResultSet rs = ps.executeQuery();
		
		int total = 0;
		while(rs.next()) {
			int price = rs.getInt("product_price");
			int count = rs.getInt("order_count");
			total+=price*count;
		}
		con.close();
		return total;
	}
	
}
