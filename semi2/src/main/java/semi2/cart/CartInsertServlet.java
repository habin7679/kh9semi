package semi2.cart;

import java.io.IOException;
import java.util.List;

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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			CartDao cDao = new CartDao();
			CartDto cDto = new CartDto();
			
			cDto.setProductNo(Integer.parseInt(req.getParameter("productNo")));
			cDto.setMemberId((String)req.getSession().getAttribute("member"));
			
			int size = cDao.selectSize((String)req.getSession().getAttribute("member"));
			
			if(size>10) {
				resp.sendRedirect(req.getContextPath()+"/cart/error.jsp");
			} else {
				cDao.insert(cDto);				
				resp.sendRedirect(req.getContextPath()+"/cart/list.jsp");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
