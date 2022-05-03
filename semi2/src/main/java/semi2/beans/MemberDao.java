package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MemberDao {

	public void join(MemberDto memberDto) throws Exception{
		Connection con= jdbcUtils.getConnection();
		
		String sql = "insert into member("
				+ "member_id, member_pw, member_name, member_nick, member_birth, member_email, "
				+ "member_phone, member_post, member_basic_address, member_detail_address) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberId());
		ps.setString(0, memberDto.getMemberPw());
		ps.setString(0, memberDto.getMemberName());
		ps.setString(0, memberDto.getMemberNick());
		ps.setString(0, memberDto.getMemberBirth());
		ps.setString(0, memberDto.getMemberEmail());
		ps.setString(0, memberDto.getMemberPhone());
		ps.setString(0, memberDto.getMemberPost());
		ps.setString(0, memberDto.getMemberBasicAddress());
		ps.setString(0, memberDto.getMemberDetailAddress());
		ps.execute();
		
		con.close();
		
	}

}
