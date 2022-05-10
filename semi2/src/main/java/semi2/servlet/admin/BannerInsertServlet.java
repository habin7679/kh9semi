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

@WebServlet(urlPatterns = "/admin/add.ez")
public class BannerInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			try {
				String path = "admin/banner";
				System.out.println("path = " + path);
				
				File dir = new File(path);
				dir.mkdirs();
				
				int max = 2 * 1024 * 1024;
				String encoding = "UTF-8";
				
				DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
				
				MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
		/*		
				if(mRequest.getFile("bannerImg") != null) {
					AttachmentDto attachmentDto = new AttachmentDto();
					AttachmentDao attachmentDao = new AttachmentDao();
					attachmentDto.setAttachmentNo(attachmentDao.getSequence());
					attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("bannerImg"));
					attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("bannerImg"));
					attachmentDto.setAttachmentType(mRequest.getContentType("bannerImg"));
					File target = mRequest.getFile("bannerImg");
					attachmentDto.setAttachmentSize(target.length());
					
					attachmentDao.insert(attachmentDto);
					
					ProductAttachmentDto productAttachmentDto = new ProductAttachmentDto();
		
					productAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
					
					ProductAttachmentDao productAttachmentDao = new ProductAttachmentDao();
					productAttachmentDao.insert(productAttachmentDto);
					
				}*/
				
				resp.sendRedirect("banner_insert_success.jsp");
				
			}
			catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
			
		}
	}

