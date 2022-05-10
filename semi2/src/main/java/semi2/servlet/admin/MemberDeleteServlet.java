package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;

@WebServlet(urlPatterns = "/admin/member_delete.ez")
public class MemberDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = req.getParameter("memberId");
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.delete(memberId);
			
			req.getSession().removeAttribute("member");
			req.getSession().removeAttribute("admin");
			
			if(success) {
				resp.sendRedirect("member_list.jsp");
			}
			else {
				resp.sendRedirect("member_delete_fail.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
