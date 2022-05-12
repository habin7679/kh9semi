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


@WebServlet(urlPatterns = "/board/write.ez")
public class BoardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//String path = System.getProperty("user.home") + "/upload";//운영체제에서 사용자에게 제공되는 home 폴더
			String path = AttachmentDao.path;
			System.out.println("path = " + path);//확인을 위한 출력
			
			File dir = new File(path);
			dir.mkdirs();//폴더 생성
			
			int max = 2 * 1024 * 1024;//최대 크기 제한(byte);
			String encoding = "UTF-8";
			
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
			
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardHead(mRequest.getParameter("boardHead"));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardContent(mRequest.getParameter("boardContent"));
			
			String memberId = (String) req.getSession().getAttribute("member");
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
			
			
			int no = boardDao.getSequence();
			boardDto.setBoardNo(no);
			boardDao.insert(boardDto);
			
			
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
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
