package semi2.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.CartDao;
import semi2.beans.OrderDao;
import semi2.beans.OrderDto;
import semi2.beans.PayingDao;
import semi2.beans.ProductDao;
import semi2.beans.ProductDto;

@WebServlet(urlPatterns="/order/quickOrder.ez")
public class OrderQuickInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = (String)req.getSession().getAttribute("member");
			PayingDao payingDao = new PayingDao();
			int no = payingDao.getSequence();
			
			payingDao.insertNo(memberId, no);

			OrderDao orderDao = new OrderDao();
			int productNo = Integer.parseInt(req.getParameter("productNo"));
			int orderAmount = Integer.parseInt(req.getParameter("orderAmount"));
			
			ProductDao pDao = new ProductDao();
			ProductDto pDto = pDao.selectOne(productNo);
			OrderDto orderDto = new OrderDto();
			
			orderDto.setOrderNo(no);
			orderDto.setProductNo(productNo);
			orderDto.setOrderCount(orderAmount);
			orderDto.setProductPrice(pDto.getProductPrice());
			
			orderDto.setOrderPrice();
			orderDao.insert(orderDto);
			
			resp.sendRedirect(req.getContextPath()+"/paying/insert.jsp?orderNo="+no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
