package semi2.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.AttachmentDao;
import semi2.beans.InfoAttachmentDao;
import semi2.beans.InfoAttachmentDto;
import semi2.beans.ProductAttachmentDao;
import semi2.beans.ProductAttachmentDto;
import semi2.beans.ProductDao;

@WebServlet(urlPatterns="/product/delete.ez")
public class ProductDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(req.getParameter("product_no"));
		
		ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
		InfoAttachmentDao infoattachmentDao = new InfoAttachmentDao();
		ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(no);
		InfoAttachmentDto infoattachmentDto = infoattachmentDao.selectOne(no);
		int ano = productattachmentDto.getAttachmentNo();
		int ino = infoattachmentDto.getAttachmentNo();
		
		ProductDao productDao = new ProductDao();
		AttachmentDao attachmentDao = new AttachmentDao();
		boolean result = productDao.delete(no);
		boolean result1 = attachmentDao.delete(ano); 
		boolean result2 = attachmentDao.delete(ino); 
		
		
if(result && result1&&result2) {
			resp.sendRedirect("product_delete_success.jsp");
		}
		else {
			resp.sendRedirect("product_delete_fail.jsp");
		}
	}
	
		catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
		}
	}
}
