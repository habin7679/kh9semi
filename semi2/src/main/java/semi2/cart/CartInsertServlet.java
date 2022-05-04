package semi2.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.CartDao;
import semi2.beans.CartDto;

@WebServlet(urlPatterns="/cart/insert.ez")
public class CartInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = (String)req.getSession().getAttribute("login");
			int productNo = Integer.parseInt(req.getParameter("productNo"));
			
			CartDto cDto = new CartDto();
			cDto.setMemberId(memberId);
			cDto.setProductNo(productNo);
			CartDao cDao = new CartDao();
			if(cDao.selectOne(cDto)!=null) {
				resp.sendRedirect(req.getContextPath()+"/index.jsp");
			}else {
				cDao.insert(cDto);				
			}
			
			resp.sendRedirect(req.getContextPath()+"/cart/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
