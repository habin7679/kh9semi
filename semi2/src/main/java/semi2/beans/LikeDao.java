package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LikeDao {
	public void insert(String memberId, int ProductNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into likep values(?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		ps.setInt(2, ProductNo);
		
		ps.execute();
		con.close();
	}
	public boolean delete(String memberId, int productNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from likep where member_id=? and product_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		ps.setInt(2, productNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count>0;
	}
	public List<LikeDto> selectAll(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from likep where member_id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		
		ResultSet rs = ps.executeQuery();
		List<LikeDto> list = new ArrayList<>();
		
		while(rs.next()) {
			LikeDto likeDto = new LikeDto();
			likeDto.setMemberId(rs.getString("member_id"));
			likeDto.setProductNo(rs.getInt("product_no"));
			list.add(likeDto);
		}
		con.close();
		return list;
	}
}
