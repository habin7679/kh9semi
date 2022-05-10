package semi2.servlet.delivery;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.DeliveryDao;
@WebServlet(urlPatterns = "/delivery/delete.ez")
public class DeliveryDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId=(String) req.getSession().getAttribute("member");
			String deliveryPost=req.getParameter("deliveryPost"); 
			/*
			 * String deliveryPost=req.getParameter("deliveryPost"); String
			 * delveryBasicAddress=req.getParameter("delveryBasicAddress"); String
			 * deliveryDetailAddress=req.getParameter("deliveryDetailAddress");
			 */
			
			DeliveryDao deliveryDao= new DeliveryDao();
			boolean success=deliveryDao.delete(memberId,deliveryPost);
			
			
				resp.sendRedirect(req.getContextPath()+"/delivery/delivery_list.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
