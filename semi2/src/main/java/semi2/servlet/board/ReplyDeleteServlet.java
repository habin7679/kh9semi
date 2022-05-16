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

@WebServlet(urlPatterns = "/board/reply_delete.ez")
public class ReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			//준비
			boolean isAdmin = false;
			boolean isMember = false;
			
			
			ReplyDao replyDao = new ReplyDao();
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			int replyTarget = Integer.parseInt(req.getParameter("replyTarget"));
			
			
			String memberGrade = (String) req.getSession().getAttribute("admin");
			if(memberGrade.equals("관리자")) {
			isAdmin = true;
			}
			
			String memberId = (String)req.getSession().getAttribute("member");
			
			ReplyDto replyDto = replyDao.selectOne(replyNo);
			if(memberId.equals(replyDto.getReplyWriter())) {//본인이라면
			isMember = true;
			}


			
			
			//처리
			boolean success = false;
			if(isAdmin || isMember) {
			success = replyDao.delete(replyNo);
			}
			//출력
			if(success) {
				BoardDao boardDao = new BoardDao();
				boardDao.updateReplycount(replyTarget);//댓글 수 갱신작업
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
