package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/member/change_pw.ez")
public class MemberChangePwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String memberId=req.getParameter("memberId");
			String memberPw=req.getParameter("memberPw");
			
			//처리
			MemberDao memberDao= new MemberDao();
			memberDao.changePw(memberId,memberPw);
			
			//출력
			resp.sendRedirect("change_pw_success.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
