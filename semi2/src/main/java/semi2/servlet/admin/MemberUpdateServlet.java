package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/admin/member_update.ez")
public class MemberUpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/plain; charset = UTF-8");
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberPw(req.getParameter("memberPw"));
			memberDto.setMemberName(req.getParameter("memberName"));
			memberDto.setMemberNick(req.getParameter("memberNick"));
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			memberDto.setMemberEmail(req.getParameter("memberEmail"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			memberDto.setMemberPost(req.getParameter("memberPost"));
			memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
			memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
			memberDto.setMemberPoint(Integer.parseInt(req.getParameter("memberPoint")));
			memberDto.setMemberGrade(req.getParameter("memberGrade"));
			java.sql.Date memberjoinDate = java.sql.Date.valueOf(req.getParameter("memberJoindate"));
			memberDto.setMemberJoindate(memberjoinDate);
			memberDto.setMemberId(req.getParameter("memberId"));

			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.updateAll(memberDto);
			
			if(success) {
				resp.sendRedirect("member_detail.jsp?memberId=" + memberDto.getMemberId());
			}
			else {
				resp.sendRedirect("member_update_fail.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
