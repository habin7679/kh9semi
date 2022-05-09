package semi2.servlet.delivary;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.DeliveryDao;
import semi2.beans.DeliveryDto;
import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/delivery/insert.ez")
public class DeliveryInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			DeliveryDto deliveryDto= new DeliveryDto();
			String memberId= (String)req.getSession().getAttribute("member");
			deliveryDto.setDeliveryName(req.getParameter("deliveryName"));
			deliveryDto.setDeliveryPhone(req.getParameter("deliveryPhone"));
			deliveryDto.setDeliveryPost(req.getParameter("deliveryPost"));
			deliveryDto.setDeliveryBasicAddress(req.getParameter("deliveryBasicAddress"));
			deliveryDto.setDeliveryDetailAddress(req.getParameter("deliveryDetailAddress"));
			
			
			DeliveryDao deliveryDao= new DeliveryDao();
			deliveryDao.insert(deliveryDto);
			
			resp.sendRedirect(req.getContextPath()+"/delivery/delivery_list.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
