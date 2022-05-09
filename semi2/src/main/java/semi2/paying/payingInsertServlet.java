package semi2.paying;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;
import semi2.beans.BuyDto;
import semi2.beans.OrderDao;
import semi2.beans.OrderDto;
import semi2.beans.PayingDao;
import semi2.beans.PayingDto;
import semi2.beans.ProductDao;

@WebServlet(urlPatterns="/paying/paying.ez")
public class payingInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int orderNo = Integer.parseInt(req.getParameter("orderNo"));
			PayingDao payingDao = new PayingDao();
			PayingDto payingDto = new PayingDto();
			payingDto.setOrderNo(orderNo);
			payingDto.setPayingTotal(Integer.parseInt(req.getParameter("payingTotal")));
			payingDto.setPayingName(req.getParameter("payingName"));
			payingDto.setPayingPhone(req.getParameter("payingPhone"));
			payingDto.setPayingPost(Integer.parseInt(req.getParameter("payingPost")));
			payingDto.setPayingBasicAddress(req.getParameter("payingBasicAddress"));
			payingDto.setPayingDetailAddress(req.getParameter("payingDetailAddress"));
//			payingDto.setPayingDeliveryDate(req.getParameter("payingDeliveryDate"));
//			java.sql.Timestamp payingDeliveryDate = java.sql.TimeStamp.valueOf(req.getParameter("payingDeliveryDate"));
			java.sql.Date payingDeliveryDate = java.sql.Date.valueOf(req.getParameter("payingDeliveryDate"));
			payingDto.setPayingDeliveryDate(payingDeliveryDate);
			payingDto.setPayingDeliveryTime(Integer.parseInt(req.getParameter("payingDeliveryTime")));
			
			String memberId = (String)req.getSession().getAttribute("member");
			
			ProductDao productDao = new ProductDao();
			OrderDao orderDao = new OrderDao();
			
			List<OrderDto> list = orderDao.selectAll(orderNo);
			for(int i =0; i<list.size(); i++) {
				int productNo = list.get(i).getProductNo();
				int orderAmount = list.get(i).getOrderCount();
				
				productDao.stockMinus(productNo, orderAmount);
			}
			
			boolean is = payingDao.insertRest2(payingDto);
			if(is) {
				BuyDao bDao = new BuyDao();
				BuyDto bDto = new BuyDto();
				bDto.setMemberId(memberId);
				bDto.setOrderNo(orderNo);
				bDao.insertCredit(bDto);
				resp.sendRedirect(req.getContextPath()+"/buy/detail.jsp?orderNo="+orderNo);
			}
			else {
				resp.sendRedirect(req.getContextPath());
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
