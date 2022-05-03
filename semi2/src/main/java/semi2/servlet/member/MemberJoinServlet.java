package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet(urlPatterns = "/member/join.ez")
public class MemberJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			
			//준비 - MemberDto(9개 : 아이디+비밀번호+닉네임+생년월일+전화번호+이메일+우편번호+기본주소+상세주소)
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(req.getParameter("memberId"));
			memberDto.setMemberPw(req.getParameter("memberPw"));
			memberDto.setMemberName(req.getParameter("memberName"));
			memberDto.setMemberNick(req.getParameter("memberNick"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			memberDto.setMemberEmail(req.getParameter("memberEmail"));
			memberDto.setMemberPost(req.getParameter("memberPost"));
			memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
			memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
			
			//처리
			MemberDao memberDao = new MemberDao();
			memberDao.join(memberDto);
			
			
			//출력
			resp.sendRedirect("join_success.jsp");
			//resp.sendRedirect(req.getContextPath()+"/member/join_finish.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}