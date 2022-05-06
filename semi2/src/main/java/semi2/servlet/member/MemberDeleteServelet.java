package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/member/delete.ez")
public class MemberDeleteServelet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId= (String)req.getSession().getAttribute("member");
			String memberPw=req.getParameter("memberPw");
			
			MemberDao memberDao= new MemberDao();
			MemberDto memberDto= memberDao.selectOne(memberId);
			boolean isPw= memberPw !=null && memberPw.equals(memberDto.getMemberPw());
			if(!isPw) {
				resp.sendRedirect("exit.jsp?error");
				return;
			}
			
			memberDao.widthrow(memberId);
			
			req.getSession().removeAttribute("member");
			req.getSession().removeAttribute("admin");
			
			resp.sendRedirect("exit_success.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
