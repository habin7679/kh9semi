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
import semi2.beans.LikeDao;
import semi2.beans.LikeDto;

@WebServlet(urlPatterns="/cart/insert.ez")
public class CartInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			CartDao cDao = new CartDao();
			CartDto cDto = new CartDto();
			
			String memberId = (String)req.getSession().getAttribute("member");
			int productNo = Integer.parseInt(req.getParameter("productNo"));
			
			cDto.setProductNo(productNo);
			cDto.setMemberId(memberId);
			
			int size = cDao.selectSize(memberId);
			
			 if(cDao.savedProduct(productNo, memberId)) {
				resp.sendRedirect(req.getContextPath()+"/cart/error2.jsp");
			 } else if(size>=10) {
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
