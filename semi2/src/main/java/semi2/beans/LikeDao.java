package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class LikeDao {
	public void insert(LikeDto likeDto) throws Exception{
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into like values(?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, likeDto.getMemberId());
		ps.setInt(2, likeDto.getProductNo());
		
		ps.execute();
		con.close();		
	}
	public boolean delete(String memberId, int productNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete from like where member_id=? and product_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberId);
		ps.setInt(2, productNo);
		
		int count = ps.executeUpdate();
		
		return count>0;
	}
	public List<LikeDto> selectAll(String memberId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from like where member_id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		LikeDto likeDto = null;
		if(rs.next()) {
			mDto
		}
	}
}
