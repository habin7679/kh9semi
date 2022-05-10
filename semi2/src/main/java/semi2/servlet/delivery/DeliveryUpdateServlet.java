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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			DeliveryDto deliveryDto= new DeliveryDto();
			deliveryDto.setMemberId(req.getParameter("memberId"));
			deliveryDto.setDeliveryName(req.getParameter("deliveryName"));
			deliveryDto.setDeliveryPhone(req.getParameter("deliveryPhone"));
			deliveryDto.setDeliveryPost(req.getParameter("deliveryPost"));
			deliveryDto.setDeliveryBasicAddress(req.getParameter("deliveryBasicAddress"));
			deliveryDto.setDeliveryDetailAddress(req.getParameter("deliveryDetailAddress"));
			
			
			DeliveryDao deliveryDao= new DeliveryDao();
			deliveryDao.update(deliveryDto);
			
			resp.sendRedirect(req.getContextPath()+"/delivery/delivery_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
