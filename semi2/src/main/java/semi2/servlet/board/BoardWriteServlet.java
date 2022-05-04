package semi2.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BoardDao;
import semi2.beans.BoardDto;

@WebServlet(urlPatterns = "/board/write.kh")
public class BoardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비 - 새글일 경우와 답글일 경우에 따라 다르게 처리되어야 한다.
			//새글일 경우 - boardHead, boardTitle, boardContent
			//답글일 경우 - boardHead, boardTitle, boardContent, superNo
			
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardHead(req.getParameter("boardHead"));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardContent(req.getParameter("boardContent"));
			
			String memberId = (String) req.getSession().getAttribute("login");
			boardDto.setBoardWriter(memberId);
			
			//처리
			BoardDao boardDao = new BoardDao();
			boardDto.setBoardNo(boardDao.getSequence());
			
//			새글일 경우와 답글일 경우를 구분하여서 groupNo, superNo, depth와 관련된 작업을 하고 등록해야한다.
//			새글일 경우
//			- group_no - board_no와 같게 설정한다.
//			- super_no - 0으로 설정한다
//			- depth - 0으로 설정한다
//			답글일 경우(원본글의 정보가 필요하다)
//			- group_no - 원본글의 group_no
//			- super_no - 원본글의 board_no
//			- depth - 원본글의 depth + 1
			if(req.getParameter("superNo") == null) {//새글이라면(superNo 파라미터가 없다면)
				boardDto.setGroupNo(boardDto.getBoardNo());
				boardDto.setSuperNo(0);
				boardDto.setDepth(0);
			}
			else {//답글이라면
				int superNo = Integer.parseInt(req.getParameter("superNo"));
				BoardDto originDto = boardDao.selectOne(superNo);
				boardDto.setGroupNo(originDto.getGroupNo());
				boardDto.setSuperNo(originDto.getBoardNo());//==superNo
				boardDto.setDepth(originDto.getDepth() + 1);
			}
			
			boardDao.insert(boardDto);
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
