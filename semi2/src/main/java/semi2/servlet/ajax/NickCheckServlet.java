package semi2.servlet.ajax;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet(urlPatterns = "/ajax/nick.ez")
public class NickCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String memberNick = req.getParameter("memberNick");
			
			//처리
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.checkNick(memberNick);
			
			
			resp.setContentType("text/plain; charset=UTF-8");
			if(memberDto != null) {//사용중
				resp.getWriter().print("NN");
			}
			else {//사용가능
				resp.getWriter().print("NY");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}