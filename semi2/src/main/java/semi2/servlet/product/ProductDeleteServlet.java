package semi2.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.AttachmentDao;
import semi2.beans.ProductAttachmentDao;
import semi2.beans.ProductAttachmentDto;
import semi2.beans.ProductDao;

@WebServlet(urlPatterns="/product/delete.ez")
public class ProductDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(req.getParameter("product_no"));
		//int no = 98;
		ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
		ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(no);
		int ano = productattachmentDto.getAttachmentNo();
		//int ano=10;
		
		ProductDao productDao = new ProductDao();
		AttachmentDao attachmentDao = new AttachmentDao();
		boolean result = productDao.delete(no);
		boolean result1 = attachmentDao.delete(ano); 
		
		
if(result && result1) {
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
