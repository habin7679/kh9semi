package semi2.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BoardDao;
import semi2.beans.ReplyDao;

@WebServlet(urlPatterns = "/board/reply_delete.ez")
public class ReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			int replyTarget = Integer.parseInt(req.getParameter("replyTarget"));
			
			
			ReplyDao replyDao = new ReplyDao();
			boolean success = replyDao.delete(replyNo);
			
			
			if(success) {
				BoardDao boardDao = new BoardDao();
				boardDao.updateReplycount(replyTarget);
				resp.sendRedirect("detail.jsp?boardNo="+replyTarget);
			}
			else {
				resp.sendError(404);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
