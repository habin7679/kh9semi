package semi2.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BoardDao;
import semi2.beans.BoardDto;

@WebServlet("/admin/board_list.ez")
public class BoardListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BoardDao boardDao = new BoardDao();
			List<BoardDto> list = boardDao.selectList();
			
			for(BoardDto boardDto : list) {
				resp.getWriter().println(boardDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
