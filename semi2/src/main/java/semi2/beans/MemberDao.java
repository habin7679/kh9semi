package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	public void join(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into member("
							+ "member_id, member_pw, member_name, member_nick, member_birth, member_email, "
							+ "member_phone, member_post, member_basic_address, member_detail_address) "
						+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, memberDto.getMemberId());
		ps.setString(2, memberDto.getMemberPw());
		ps.setString(3, memberDto.getMemberName());
		ps.setString(4, memberDto.getMemberNick());
		ps.setString(5, memberDto.getMemberBirth());
		ps.setString(6, memberDto.getMemberEmail());
		ps.setString(7, memberDto.getMemberPhone());
		ps.setString(8, memberDto.getMemberPost());
		ps.setString(9, memberDto.getMemberBasicAddress());
		ps.setString(10, memberDto.getMemberDetailAddress());
		ps.execute();
		
		con.close();
	}

	public MemberDto selectOne(String memberId) throws Exception{
		Connection con= JdbcUtils.getConnection();
		
		String sql="select*from member where member_id=?";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs= ps.executeQuery();
		
		MemberDto memberDto;
		if(rs.next()) {
			memberDto=new MemberDto();
			
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberNick(rs.getString("member_nick"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberEmail(rs.getString("member_email"));
			memberDto.setMemberBirth(rs.getString("member_birth"));
			memberDto.setMemberPost(rs.getString("member_post"));
			memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
			memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
			memberDto.setMemberPoint(rs.getInt("member_point"));
			memberDto.setMemberGrade(rs.getString("member_grade"));
			memberDto.setMemberJoindate(rs.getDate("member_joindate"));
		}
		else {
			memberDto=null;
		}
		con.close();
		return memberDto;
	}
}
