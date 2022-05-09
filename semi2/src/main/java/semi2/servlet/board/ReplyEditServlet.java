package semi2.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ReplyDao;
import semi2.beans.ReplyDto;

@WebServlet(urlPatterns = "/board/reply_edit.ez")
public class ReplyEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비 : ReplyDto(replyNo + replyTarget + replyContent)
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyNo(Integer.parseInt(req.getParameter("replyNo")));
			replyDto.setReplyTarget(Integer.parseInt(req.getParameter("replyTarget")));
			replyDto.setReplyContent(req.getParameter("replyContent"));
			
			//처리
			ReplyDao replyDao = new ReplyDao();
			boolean success = replyDao.update(replyDto);
			
			//출력
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+replyDto.getReplyTarget());
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
