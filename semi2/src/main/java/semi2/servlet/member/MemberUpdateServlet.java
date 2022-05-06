package semi2.servlet.member;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/member/update.ez")
public class MemberUpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(req.getParameter("memberId"));
			memberDto.setMemberPw(req.getParameter("memberPw"));
			memberDto.setMemberNick(req.getParameter("memberNick"));
			memberDto.setMemberName(req.getParameter("memberPhone"));
			memberDto.setMemberPhone(req.getParameter("memberEmail"));
			memberDto.setMemberEmail(req.getParameter("memberBirth"));
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			memberDto.setMemberPost(req.getParameter("memberPost"));
			memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
			memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
			memberDto.setMemberPoint(Integer.parseInt(req.getParameter("memberPoint")));
			memberDto.setMemberGrade(req.getParameter("memberGrade"));
			java.sql.Date memberjoinDate = java.sql.Date.valueOf(req.getParameter("memberJoindate"));
			memberDto.setMemberJoindate(memberjoinDate);			
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.update(memberDto);
			resp.sendRedirect(req.getContextPath()+"/member/detail.jsp?memberId=" + memberDto.getMemberId());
		
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}