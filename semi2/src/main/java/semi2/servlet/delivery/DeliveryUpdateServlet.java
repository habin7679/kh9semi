package semi2.servlet.delivery;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.DeliveryDao;
import semi2.beans.DeliveryDto;
@WebServlet(urlPatterns = "/delivery/update.ez")
public class DeliveryUpdateServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId=(String)req.getSession().getAttribute("member");
			String deliveryPost=req.getParameter("deliveryPost");
			
			DeliveryDao deliveryDao= new DeliveryDao();
			deliveryDao.update1(memberId);
			deliveryDao.update2(memberId, deliveryPost);
			
			
			resp.sendRedirect(req.getContextPath()+"/delivery/delivery_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
