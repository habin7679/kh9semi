package semi2.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns = "/product/add.ez")
public class ProductInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			try {
				req.setCharacterEncoding("UTF-8");
				ProductDto productDto = new ProductDto();
				//productDto.setProductNo(Integer.parseInt(req.getParameter("productNo")));
				productDto.setProductName(req.getParameter("productName"));
				productDto.setProductSort(req.getParameter("productSort"));
				productDto.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
				productDto.setProductStock(Integer.parseInt(req.getParameter("productStock")));
				productDto.setProductCompany(req.getParameter("productCompany"));
				productDto.setProductMadeString(req.getParameter("productMadeString"));
				productDto.setProductExpireString(req.getParameter("productExpireString"));
				productDto.setProductEvent(req.getParameter("productEvent"));
				productDto.setProductKcal(Integer.parseInt(req.getParameter("productKcal")));
				productDto.setProductProtein(Integer.parseInt(req.getParameter("productProtein")));
				productDto.setProductCarbohydrate(Integer.parseInt(req.getParameter("productCarbohydrate")));
				productDto.setProductFat(Integer.parseInt(req.getParameter("productFat")));
				productDto.setProductInfo(req.getParameter("productInfo"));
				productDto.setProductImg(req.getParameter("productImg"));
				
				ProductDao productDao = new ProductDao();
				productDao.add(productDto);
				
				resp.sendRedirect("product_insert_finish.jsp");
				
			}
			catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
			
		}
	}

