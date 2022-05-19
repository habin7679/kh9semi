package semi2.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BoardDao;
import semi2.beans.ReplyDao;
import semi2.beans.ReplyDto;

@WebServlet(urlPatterns = "/board/reply_insert.ez")
public class ReplyInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyContent(req.getParameter("replyContent"));
			replyDto.setReplyTarget(Integer.parseInt(req.getParameter("replyTarget")));
			replyDto.setReplyWriter((String)req.getSession().getAttribute("member"));
			
			
			ReplyDao replyDao = new ReplyDao();
			replyDao.insert(replyDto);
			
			BoardDao boardDao = new BoardDao();
			boardDao.updateReplycount(replyDto.getReplyTarget());
			
			
			resp.sendRedirect("detail.jsp?boardNo="+replyDto.getReplyTarget());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
