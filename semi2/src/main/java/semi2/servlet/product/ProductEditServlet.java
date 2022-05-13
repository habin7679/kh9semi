package semi2.servlet.product;

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
import semi2.beans.InfoAttachmentDao;
import semi2.beans.InfoAttachmentDto;
import semi2.beans.ProductAttachmentDao;
import semi2.beans.ProductAttachmentDto;
import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/product/edit.ez")
public class ProductEditServlet extends HttpServlet {
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
			

			AttachmentDto attachmentDto= new AttachmentDto();
			ProductDto productDto = new ProductDto();
			ProductDao productDao = new ProductDao();
			AttachmentDao attachmentDao = new AttachmentDao();
		
			
			productDto.setProductNo(Integer.parseInt(mRequest.getParameter("productNo")));

			productDto.setProductName(mRequest.getParameter("productName"));
			productDto.setProductSort(mRequest.getParameter("productSort"));
			productDto.setProductPrice(Integer.parseInt(mRequest.getParameter("productPrice")));
			productDto.setProductStock(Integer.parseInt(mRequest.getParameter("productStock")));
			productDto.setProductCompany(mRequest.getParameter("productCompany"));
			java.sql.Date productMade = java.sql.Date.valueOf(mRequest.getParameter("productMade"));
			productDto.setProductMade(productMade);
			java.sql.Date productExpire = java.sql.Date.valueOf(mRequest.getParameter("productExpire"));
			productDto.setProductExpire(productExpire);
			productDto.setProductEvent(mRequest.getParameter("productEvent"));
			productDto.setProductKcal(Integer.parseInt(mRequest.getParameter("productKcal")));
			productDto.setProductProtein(Integer.parseInt(mRequest.getParameter("productProtein")));
			productDto.setProductCarbohydrate(Integer.parseInt(mRequest.getParameter("productCarbohydrate")));
			productDto.setProductFat(Integer.parseInt(mRequest.getParameter("productFat")));
			// productDto.setProductInfo(mRequest.getParameter("productInfo"));
			// productDto.setProductImg(req.getParameter("productImg"));
	
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("productImg"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("productImg"));
			attachmentDto.setAttachmentType(mRequest.getContentType("productImg"));
			File target = mRequest.getFile("productImg");
			attachmentDto.setAttachmentSize(target.length());
			
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("productInfo"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("productInfo"));
			attachmentDto.setAttachmentType(mRequest.getContentType("productInfo"));
			File target1 = mRequest.getFile("productInfo");
			attachmentDto.setAttachmentSize(target1.length());
			
			//변경
			boolean success = productDao.edit(productDto);
			boolean success1 = attachmentDao.edit(attachmentDto);
			
			if(success) {
				resp.sendRedirect("product_edit_success.jsp");
			}
			else {
				resp.sendRedirect("product_edit_fail.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}