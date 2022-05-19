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


@WebServlet(urlPatterns = "/board/write_productqna.ez")
public class BoardWriteProductqnaserlvlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String path = System.getProperty("user.home") + "/git/kh9semi/semi2/src/main/webapp/image";
			System.out.println("path = " + path);
			
			File dir = new File(path);
			dir.mkdirs();
			
			int max = 2 * 1024 * 1024;
			String encoding = "UTF-8";
			
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
			
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardHead(mRequest.getParameter("boardHead"));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardContent(mRequest.getParameter("boardContent"));
			boardDto.setBoardProductNo(Integer.parseInt(mRequest.getParameter("productNo")));
			
			String memberId = (String) req.getSession().getAttribute("member");
			boardDto.setBoardWriter(memberId);
			
			
			BoardDao boardDao = new BoardDao();
			boardDto.setBoardNo(boardDao.getSequence());
			









			if(mRequest.getParameter("superNo") == null) {
				boardDto.setGroupNo(boardDto.getBoardNo());
				boardDto.setSuperNo(0);
				boardDto.setDepth(0);
			}
			else {
				int superNo = Integer.parseInt(mRequest.getParameter("superNo"));
				BoardDto originDto = boardDao.selectOne(superNo);
				boardDto.setGroupNo(originDto.getGroupNo());
				boardDto.setSuperNo(originDto.getBoardNo());
				boardDto.setDepth(originDto.getDepth() + 1);
			}
			
			
			int no = boardDao.getSequence();
			boardDto.setBoardNo(no);
			boardDao.insertProductqna(boardDto);
			
			
			if(mRequest.getFile("attach") != null) {
				AttachmentDto attachmentDto = new AttachmentDto();
				AttachmentDao attachmentDao = new AttachmentDao();
				attachmentDto.setAttachmentNo(attachmentDao.getSequence());
				attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("attach"));
				attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("attach"));
				attachmentDto.setAttachmentType(mRequest.getContentType("attach"));
				File target = mRequest.getFile("attach");
				attachmentDto.setAttachmentSize(target.length());
				
				attachmentDao.insert(attachmentDto);
				
				BoardAttachmentDto boardAttachmentDto = new BoardAttachmentDto();
				boardAttachmentDto.setBoardNo(no);
				boardAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());	
				
				BoardAttachmentDao boardAttachmentDao = new BoardAttachmentDao();
				boardAttachmentDao.insert(boardAttachmentDto);
			}
			else {				
				BoardAttachmentDto boardAttachmentDto = new BoardAttachmentDto();
				boardAttachmentDto.setBoardNo(no);
				boardAttachmentDto.setAttachmentNo(1);	
				
				BoardAttachmentDao boardAttachmentDao = new BoardAttachmentDao();
				boardAttachmentDao.insert(boardAttachmentDto);
			}
			
			
			resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
