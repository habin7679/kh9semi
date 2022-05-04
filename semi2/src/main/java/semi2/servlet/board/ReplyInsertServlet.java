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

@WebServlet(urlPatterns = "/board/reply_insert.kh")
public class ReplyInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비 : ReplyDto ( replyTarget + replyContent ) + 작성자(HttpSession)
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyContent(req.getParameter("replyContent"));
			replyDto.setReplyBoardNo(Integer.parseInt(req.getParameter("replyBoardNo")));
			replyDto.setReplyWriter((String)req.getSession().getAttribute("login"));
			
			//처리
			ReplyDao replyDao = new ReplyDao();
			replyDao.insert(replyDto);
			
			BoardDao boardDao = new BoardDao();
			boardDao.updateReplycount(replyDto.getReplyBoardNo());
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+replyDto.getReplyBoardNo());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
