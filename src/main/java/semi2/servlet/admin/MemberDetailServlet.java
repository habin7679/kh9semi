package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/admin/member_detail.ez")
public class MemberDetailServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		String memberId = req.getParameter("memberId");
		
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = memberDao.selectOne(memberId);
		
		if (memberDto == null) {
			resp.getWriter().println("존재하지 않는 회원");
		}
		else {
			resp.getWriter().println("아이디 :" + memberDto.getMemberId());
			resp.getWriter().println("비밀번호 :" + memberDto.getMemberPw());
			resp.getWriter().println("이름 :" + memberDto.getMemberName());
			resp.getWriter().println("닉네임 :" + memberDto.getMemberNick());
			resp.getWriter().println("생년월일 :" + memberDto.getMemberBirth());
			resp.getWriter().println("이메일 :" + memberDto.getMemberEmail());
			resp.getWriter().println("전화번호 :" + memberDto.getMemberPhone());
			resp.getWriter().println("우편번호 :" + memberDto.getMemberPost());
			resp.getWriter().println("기본주소 :" + memberDto.getMemberBasicAddress());
			resp.getWriter().println("상세주소 :" + memberDto.getMemberDetailAddress());
			resp.getWriter().println("보유포인트 :" + memberDto.getMemberPoint());
			resp.getWriter().println("등급 :" + memberDto.getMemberGrade());
			resp.getWriter().println("회원가입일 :" + memberDto.getMemberJoindate());
		}
		
	} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
