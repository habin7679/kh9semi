package semi2.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/product/detail.ez")
public class ProductDetailServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(req.getParameter("product_no"));
			
			ProductDao productDao = new ProductDao();
			ProductDto productDto = productDao.selectOne(no);
			
			resp.setContentType("text/plain; charset=UTF-8");
			if(productDto == null) {
				resp.getWriter().println(" oh no");
			}
			else {
				resp.getWriter().print("no:" +productDto.getProductNo());
				resp.getWriter().print("name :" +productDto.getProductName());
				resp.getWriter().print("sort :"+productDto.getProductSort());
				resp.getWriter().print("price: "+productDto.getProductPrice());
				resp.getWriter().print("stock :"+productDto.getProductStock());
				resp.getWriter().print("company :"+productDto.getProductCompany());
				resp.getWriter().print("made :"+productDto.getProductMade());
				resp.getWriter().print("expire :"+productDto.getProductExpire());
				resp.getWriter().print("event :"+productDto.getProductEvent());
				resp.getWriter().print("kcal :"+productDto.getProductKcal());
				resp.getWriter().print("protein :"+productDto.getProductProtein());
				resp.getWriter().print("carbohydrate :"+productDto.getProductCarbohydrate());
				resp.getWriter().print("fat :"+productDto.getProductFat());
				resp.getWriter().print("info :"+productDto.getProductInfo());
				resp.getWriter().print("img :"+productDto.getProductImg());
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
