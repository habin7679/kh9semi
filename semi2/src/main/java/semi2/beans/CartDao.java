package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
	public void insert(CartDto cartDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into cart(member_id, product_no) valuse(?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, cartDto.getMemberId());
		ps.setInt(2, cartDto.getProductNo());
		
		ps.execute();
		con.close();
	}
	public CartDto selectOne(CartDto cartDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from cart where member_id=? and product_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, cartDto.getMemberId());
		ps.setInt(2, cartDto.getProductNo());
		
		ResultSet rs = ps.executeQuery();
		CartDto cDto = null;
		if(rs.next()) {
			cDto.setMemberId(rs.getString("member_id"));
			cDto.setProductNo(rs.getInt("product_no"));
			cDto.setCartAmount(rs.getInt("cart_amount"));
			return cDto;
		}else {
			return cDto;
		}
	}
	public boolean amountUpdate(CartDto cartDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update cart set cart_amount=? where member_id=? and product_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, cartDto.getCartAmount());
		ps.setString(2, cartDto.getMemberId());
		ps.setInt(3, cartDto.getProductNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public boolean delete(CartDto cartDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from cart where member_id=? and product_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, cartDto.getMemberId());
		ps.setInt(2, cartDto.getProductNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public List<CartDto> selectAll(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select product_no, cart_amount from cart where member_id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		
		ResultSet rs = ps.executeQuery();
		
		List<CartDto> list = new ArrayList<>();
		while(rs.next()) {
			CartDto cartDto = new CartDto();
			cartDto.setProductNo(rs.getInt("product_no"));
			cartDto.setCartAmount(rs.getInt("cart_amount"));
			list.add(cartDto);
		}
		con.close();
		return list;
		
	}
}
