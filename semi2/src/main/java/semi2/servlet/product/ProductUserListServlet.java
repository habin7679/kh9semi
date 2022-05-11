package semi2.servlet.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns="/product/list.ez")
public class ProductUserListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		ProductDao productDao = new ProductDao();
		List<ProductDto> list = productDao.listAll();
		
		resp.setContentType("text/plain; charset=UTF-8");
		for(ProductDto productDto : list) {
			resp.getWriter().println(productDto);
		}
	}
	catch(Exception e){
		e.printStackTrace();
		resp.sendError(500);
		
	}
	}
}
