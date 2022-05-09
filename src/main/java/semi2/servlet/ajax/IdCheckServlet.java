package semi2.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/ajax/id.ez")
public class IdCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId=req.getParameter("memberId");
			
			MemberDao memberDao= new MemberDao();
			MemberDto memberDto=memberDao.selectOne(memberId);
			
			resp.setContentType("text/plain; charset=UTF-8");
			if(memberDto !=null) {
				resp.getWriter().print("N");
			}
			else {
				resp.getWriter().print("Y");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
