package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LikeDao {
	public void insert(LikeDto likeDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into likep values(?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, likeDto.getMemberId());
		ps.setInt(2, likeDto.getProductNo());
		
		ps.execute();
		con.close();
	}
	public LikeDto selectOne(LikeDto likeDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from likep where member_id=? and product_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, likeDto.getMemberId());
		ps.setInt(2, likeDto.getProductNo());
		
		ResultSet rs = ps.executeQuery();
		LikeDto lDto= new LikeDto();
		if(rs.next()) {
			lDto.setMemberId(rs.getString("member_id"));
			lDto.setProductNo(rs.getInt("product_no"));
			return lDto;
		}
		con.close();
		return lDto;
	}
	public boolean delete(String memberId, int productNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete likep where member_id=? and product_no=?";
		
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
	public int selectSize(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select product_no from likep where member_id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		
		ResultSet rs = ps.executeQuery();
		
		int a = 0;
		while(rs.next()) {
			a++;
		}
		con.close();
		return a;
	}
}
