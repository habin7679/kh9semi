package semi2.servlet.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi2.beans.AttachmentDao;
import semi2.beans.AttachmentDto;
import semi2.beans.BoardAttachmentDao;
import semi2.beans.BoardAttachmentDto;
import semi2.beans.BoardDao;
import semi2.beans.BoardDto;

@WebServlet(urlPatterns = "/board/edit.ez")
public class BoardEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String path = System.getProperty("user.home") + "/upload";//운영체제에서 사용자에게 제공되는 home 폴더
			System.out.println("path = " + path);//확인을 위한 출력
			
			File dir = new File(path);
			dir.mkdirs();//폴더 생성
			
			int max = 2 * 1024 * 1024;//최대 크기 제한(byte);
			String encoding = "UTF-8";
			
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
			//준비
			BoardDto boardDto = new BoardDto();
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		
			
			BoardAttachmentDao boardAttachmentDao = new BoardAttachmentDao();
			BoardAttachmentDto boardAttachmentDto = boardAttachmentDao.selectOne(boardNo);
			
			int attach = boardAttachmentDto.getAttachmentNo();
			
			boardDto.setBoardNo(Integer.parseInt(mRequest.getParameter("boardNo")));
			boardDto.setBoardHead(mRequest.getParameter("boardHead"));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardContent(mRequest.getParameter("boardContent"));
			boardAttachmentDto.setAttachmentNo(attach);
				
			
			//처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.update(boardDto);
			
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
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







