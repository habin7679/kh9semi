package semi2.like;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.LikeDao;

@WebServlet(urlPatterns="/like/delete.ez")
public class LikeDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = (String)req.getSession().getAttribute("member");
			int productNo = Integer.parseInt(req.getParameter("productNo"));

			LikeDao lDao = new LikeDao();
			//아이디 바꾸기
			lDao.delete(memberId, productNo);

			resp.sendRedirect(req.getContextPath()+"/like/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}