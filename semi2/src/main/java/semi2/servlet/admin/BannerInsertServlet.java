package semi2.servlet.admin;

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
import semi2.beans.ProductAttachmentDao;
import semi2.beans.ProductAttachmentDto;
import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/admin/add.ez")
public class BannerInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			try {
				String path = System.getProperty("user.home") + "/git/kh9semi/semi2/src/main/webapp/image";//운영체제에서 사용자에게 제공되는 home 폴더
				System.out.println("path = " + path);//확인을 위한 출력
				
				File dir = new File(path);
				dir.mkdirs();//폴더 생성
				
				int max = 2 * 1024 * 1024;//최대 크기 제한(byte);
				String encoding = "UTF-8";
				
				DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
				
				MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
				
				
				
				if(mRequest.getFile("productImg") != null) {
					AttachmentDto attachmentDto = new AttachmentDto();
					AttachmentDao attachmentDao = new AttachmentDao();
					attachmentDto.setAttachmentNo(attachmentDao.getSequence());
					attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("productImg"));
					attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("productImg"));
					attachmentDto.setAttachmentType(mRequest.getContentType("productImg"));
					File target = mRequest.getFile("productImg");
					attachmentDto.setAttachmentSize(target.length());
					
					attachmentDao.insert(attachmentDto);
					
					
				}
				
				resp.sendRedirect("banner_insert_success.jsp");
				
			}
			catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
			
		}
	}