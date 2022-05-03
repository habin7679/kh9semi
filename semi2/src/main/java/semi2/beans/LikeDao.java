package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	public boolean delete(LikeDto likeDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete "
	}
}
