package semi2.servlet.product;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/product/search.ez")
public class ProductSearchServlet extends HttpServlet {
	protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		try {
			String type = req.getParameter("type");
			String keyword = req.getParameter("keywrod");
			
			boolean isSearch = type != null && keyword != null;
			ProductDao productDao = new ProductDao();
			
			List<ProductDto> list;
			if(isSearch) {
				list = productDao.selectList(type, keyword);
			}
			else {
				list = Collections.emptyList();
			}
			
			resp.setContentType("text/plain; charset = UTF-8");
			if(list.isEmpty()) {
				resp.getWriter().println("검색결과가 존재하지 않습니다");
			}
			else {
				for(ProductDto productDto : list) {
					resp.getWriter().println(productDto);
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		}

}
