package semi2.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.CartDao;
import semi2.beans.CartDto;

@WebServlet(urlPatterns="/cart/delete.ez")
public class CartDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int productNo = Integer.parseInt(req.getParameter("productNo"));
			String memberId = (String)req.getSession().getAttribute("member");

			CartDao cDao = new CartDao();
			cDao.delete(memberId, productNo);
			
			resp.sendRedirect(req.getContextPath()+"/cart/list.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}