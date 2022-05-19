package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/member/find_pw.ez")
public class MemberFindPwSevlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			MemberDto memberDto= new MemberDto();
			memberDto.setMemberId(req.getParameter("memberId"));
			memberDto.setMemberName(req.getParameter("memberName"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			 //처리
			MemberDao memberDao= new MemberDao();
			MemberDto memberDto2=memberDao.findPw(memberDto);
			
			//출력
			if(memberDto2 !=null) {
				resp.sendRedirect(req.getContextPath()+"/member/change_pw.jsp?memberId="+memberDto2.getMemberId());
			}
			else {
				resp.sendRedirect(req.getContextPath()+"/member/find_pw.jsp?error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
