package semi2.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ProductDao;

@WebServlet(urlPatterns="/product/delete.ez")
public class ProductDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		int productNo = Integer.parseInt(req.getParameter("product_no"));
		
		ProductDao productDao = new ProductDao();
		boolean result = productDao.delete(productNo);
		
		if(result) {
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
