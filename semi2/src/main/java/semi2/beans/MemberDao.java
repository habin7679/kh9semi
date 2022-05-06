package semi2.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.proxy.annotation.Pre;

public class MemberDao {
		//회원가입
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
	
		//회원정보 수정
		public boolean update(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update member set member_pw = ?, member_name = ?, member_nick = ?, member_birth = ?, "
				+ "member_email = ?, member_phone = ?, member_post = ?, member_basic_address = ?, member_detail_address = ? "
				+ "where member_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberPw());
		ps.setString(2, memberDto.getMemberName());
		ps.setString(3, memberDto.getMemberNick());
		ps.setString(4, memberDto.getMemberBirth());
		ps.setString(5, memberDto.getMemberEmail());
		ps.setString(6, memberDto.getMemberPhone());
		ps.setString(7, memberDto.getMemberPost());
		ps.setString(8, memberDto.getMemberBasicAddress());
		ps.setString(9, memberDto.getMemberDetailAddress());
		ps.setString(10, memberDto.getMemberId());
		
		int count = ps.executeUpdate();
		con.close();
		
		return count > 0;
	}
	
		//관리자 - 회원정보 전체 수정
		public boolean updateAll(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
						
		String sql = "update member set member_pw = ?, member_name = ?, member_nick = ?, member_birth = ?, "
				+ "member_email = ?, member_phone = ?, member_post = ?, member_basic_address = ?, member_detail_address = ?, "
				+ "member_point = ?, member_grade = ?, member_joindate = ? where member_id = ?";
						
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberPw());
		ps.setString(2, memberDto.getMemberName());
		ps.setString(3, memberDto.getMemberNick());
		ps.setString(4, memberDto.getMemberBirth());
		ps.setString(5, memberDto.getMemberEmail());
		ps.setString(6, memberDto.getMemberPhone());
		ps.setString(7, memberDto.getMemberPost());
		ps.setString(8, memberDto.getMemberBasicAddress());
		ps.setString(9, memberDto.getMemberDetailAddress());
		ps.setInt(10, memberDto.getMemberPoint());
		ps.setString(11, memberDto.getMemberGrade());
		ps.setDate(12, memberDto.getMemberJoindate());
		ps.setString(13, memberDto.getMemberId());
						
		int count = ps.executeUpdate();
		con.close();
						
		return count > 0;
		}
		
		//관리자 - 멤버 목록 전체조회
		public List<MemberDto> listAll() throws Exception {
		Connection con= JdbcUtils.getConnection();
			
		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
			
		List<MemberDto> list = new ArrayList<>();
			
		while(rs.next()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberNick(rs.getString("member_nick"));
			memberDto.setMemberBirth(rs.getString("member_birth"));
			memberDto.setMemberEmail(rs.getString("member_email"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberPost(rs.getString("member_post"));
			memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
			memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
			memberDto.setMemberPoint(rs.getInt("member_point"));
			memberDto.setMemberGrade(rs.getString("member_grade"));
			memberDto.setMemberJoindate(rs.getDate("member_joindate"));
			
			list.add(memberDto);
			}
			con.close();
			return list;
		}
		
		//관리자 - 회원 검색
		public List<MemberDto> selectList(String type, String keyword) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from member where instr(#1, ?) > 0 order by member_id asc";
			sql = sql.replace("#1", type);
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ResultSet rs = ps.executeQuery();
			
			List<MemberDto> list = new ArrayList<>();
			
			while(rs.next()) {
				MemberDto memberDto = new MemberDto();
				memberDto.setMemberId(rs.getString("member_id"));
				memberDto.setMemberPw(rs.getString("member_pw"));
				memberDto.setMemberName(rs.getString("member_name"));
				memberDto.setMemberNick(rs.getString("member_nick"));
				memberDto.setMemberBirth(rs.getString("member_birth"));
				memberDto.setMemberEmail(rs.getString("member_email"));
				memberDto.setMemberPhone(rs.getString("member_phone"));
				memberDto.setMemberPost(rs.getString("member_post"));
				memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
				memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
				memberDto.setMemberPoint(rs.getInt("member_point"));
				memberDto.setMemberGrade(rs.getString("member_grade"));
				memberDto.setMemberJoindate(rs.getDate("member_joindate"));
				
				list.add(memberDto);
			}
			con.close();
			
			return list;
		}
		
		//관리자 - 회원 단일조회
		public MemberDto selectOne(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from member where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			MemberDto memberDto;
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setMemberId(rs.getString("member_id"));
				memberDto.setMemberPw(rs.getString("member_pw"));
				memberDto.setMemberName(rs.getString("member_name"));
				memberDto.setMemberNick(rs.getString("member_nick"));
				memberDto.setMemberBirth(rs.getString("member_birth"));
				memberDto.setMemberEmail(rs.getString("member_email"));
				memberDto.setMemberPhone(rs.getString("member_phone"));
				memberDto.setMemberPost(rs.getString("member_post"));
				memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
				memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
				memberDto.setMemberPoint(rs.getInt("member_point"));
				memberDto.setMemberGrade(rs.getString("member_grade"));
				memberDto.setMemberJoindate(rs.getDate("member_joindate"));	
			}
			else {
				memberDto = null;
			}
			con.close();
			return memberDto;
		}
		
		//관리자 - 회원 삭제                                                                                                                       
		public boolean delete(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();

			String sql = "delete score where memberId = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			int count = ps.executeUpdate();

			con.close();

			return count > 0;
		}
		//관리자 - 회원 추가
		public void add(MemberDto memberDto) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "insert into member("
								+ "member_id, member_pw, member_name, member_nick, member_birth, member_email, "
								+ "member_phone, member_post, member_basic_address, member_detail_address, "
								+ "member_point, member_grade, member_joindate)"
							+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, to_date(?,'YYYY-MM-DD'))";
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
			ps.setInt(11, memberDto.getMemberPoint());
			ps.setString(12, memberDto.getMemberGrade());
			ps.setDate(13, memberDto.getMemberJoindate());
			
			ps.execute();
			
			con.close();
			
		}
				
		//아이디 찾기
		public String findId(MemberDto memberDto) throws Exception{
			Connection con= JdbcUtils.getConnection();
			
			String sql= "select member_id from member where member_name=? and member_birth=? and member_phone=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, memberDto.getMemberName());
			ps.setString(2, memberDto.getMemberBirth());
			ps.setString(3, memberDto.getMemberPhone());
			ResultSet rs= ps.executeQuery();
			
			String memberId;
			if(rs.next()) {
				memberId= rs.getString("member_id");
			}
			else {
				memberId=null;
			}
			con.close();
			
			return memberId;
		}
		
		//로그인
		public MemberDto Login(String memberId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from member where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			MemberDto memberDto;
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setMemberId(rs.getString("member_id"));
				memberDto.setMemberPw(rs.getString("member_pw"));
			
			}
			else {
				memberDto = null;
			}
			con.close();
			return memberDto;
		}

		public MemberDto findPw(MemberDto memberDto) throws Exception{
			Connection con= JdbcUtils.getConnection();
			
			String sql= "select * from member where member_id=? and member_name=? and member_phone=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, memberDto.getMemberId());
			ps.setString(2, memberDto.getMemberName());
			ps.setString(3, memberDto.getMemberPhone());
			ResultSet rs=ps.executeQuery();
			
			MemberDto memberDto2;
			if(rs.next()) {
				memberDto2=new MemberDto();
				
				memberDto2.setMemberId(rs.getString("member_id"));
				memberDto2.setMemberPw(rs.getString("member_pw"));
				memberDto2.setMemberName(rs.getString("member_name"));
				memberDto2.setMemberNick(rs.getString("member_nick"));
				memberDto2.setMemberBirth(rs.getString("member_birth"));
				memberDto2.setMemberEmail(rs.getString("member_email"));
				memberDto2.setMemberPhone(rs.getString("member_phone"));
				memberDto2.setMemberPost(rs.getString("member_post"));
				memberDto2.setMemberBasicAddress(rs.getString("member_basic_address"));
				memberDto2.setMemberDetailAddress(rs.getString("member_detail_address"));
				memberDto2.setMemberPoint(rs.getInt("member_point"));
				memberDto2.setMemberGrade(rs.getString("member_grade"));
				memberDto2.setMemberJoindate(rs.getDate("member_joindate"));	
			}
			else {
				memberDto2=null;
			}
			con.close();
			
			return memberDto2;
		}
		
		//비밀번호 변경
		public boolean changePw(String memberId, String memberPw)throws Exception{
			Connection con =JdbcUtils.getConnection();
			
			String sql="update member set member_pw=? where member_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, memberPw);
			ps.setString(2, memberId);
			int count=ps.executeUpdate();
			
			con.close();
			
			return count>0;
		
		}
		
		//회원탈퇴
		public boolean widthrow(String memberId) throws Exception{
			Connection con =JdbcUtils.getConnection();
			
			String sql="delete member where member_id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, memberId);
			int count=ps.executeUpdate();
			
			con.close();
			
			return count>0;
			
			
		}
		//닉네임 중복검사
		public MemberDto checkNick(String memberNick) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from member where member_nick = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberNick);
			ResultSet rs = ps.executeQuery();
			
			MemberDto memberDto;
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setMemberId(rs.getString("member_id"));
				memberDto.setMemberPw(rs.getString("member_pw"));
				memberDto.setMemberName(rs.getString("member_name"));
				memberDto.setMemberNick(rs.getString("member_nick"));
				memberDto.setMemberBirth(rs.getString("member_birth"));
				memberDto.setMemberEmail(rs.getString("member_email"));
				memberDto.setMemberPhone(rs.getString("member_phone"));
				memberDto.setMemberPost(rs.getString("member_post"));
				memberDto.setMemberBasicAddress(rs.getString("member_basic_address"));
				memberDto.setMemberDetailAddress(rs.getString("member_detail_address"));
				memberDto.setMemberPoint(rs.getInt("member_point"));
				memberDto.setMemberGrade(rs.getString("member_grade"));
				memberDto.setMemberJoindate(rs.getDate("member_joindate"));	
			}
			else {
				memberDto = null;
			}
			con.close();
			return memberDto;
		}
}
