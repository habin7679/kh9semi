package semi2.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.OrderDao;
import semi2.beans.OrderDto;
import semi2.beans.PayingDao;
import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns="/order/order.ez")
public class orderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = (String)req.getSession().getAttribute("login");
			PayingDao payingDao = new PayingDao();
			int no = payingDao.getSequence();
			payingDao.insertNo(memberId, no);
			
			OrderDao orderDao = new OrderDao();
			String[] productNo = req.getParameterValues("productNo");
			String[] orderAmount = req.getParameterValues("cartAmount");
			
			for(int i =0; i<productNo.length; i++) {
				OrderDto orderDto = new OrderDto();
				orderDto.setOrderNo(no);
				orderDto.setMemberId(memberId);
				orderDto.setProductNo(Integer.parseInt(productNo[i]));
				orderDto.setOrderCount(Integer.parseInt(orderAmount[i]));
				orderDao.insert(orderDto);
			}
			
			resp.sendRedirect(req.getContextPath()+"/paying/paying.jsp?orderNo="+no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
