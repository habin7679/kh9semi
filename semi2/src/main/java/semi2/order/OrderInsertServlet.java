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

@WebServlet(urlPatterns="/order/order.ez")
public class OrderInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = (String)req.getSession().getAttribute("member");
			PayingDao payingDao = new PayingDao();
			int no = payingDao.getSequence();
			payingDao.insertNo(memberId, no);

			OrderDao orderDao = new OrderDao();
			String[] buyPNo = req.getParameterValues("checkProduct");
			String[] productNo = req.getParameterValues("productNo");
			String[] orderAmount = req.getParameterValues("cartAmount");

			CartDao cDao = new CartDao();
			ProductDao pDao = new ProductDao();
			int count = 0;
			for(int i =0; i<buyPNo.length; i++) {
				for(int j = 0; j<productNo.length; j++) {
					if(buyPNo[i].equals(productNo[j])){
						count++;
						break;
					}
				}
				if(count>0) {					
					ProductDto pDto = pDao.selectOne(Integer.parseInt(productNo[i]));
					cDao.delete(memberId, Integer.parseInt(productNo[i]));
					OrderDto orderDto = new OrderDto();
					orderDto.setOrderNo(no);
					orderDto.setProductNo(Integer.parseInt(productNo[i]));
					orderDto.setOrderCount(Integer.parseInt(orderAmount[i]));
					orderDto.setProductPrice(pDto.getProductPrice());
					orderDto.setOrderPrice();
					orderDao.insert(orderDto);
					count=0;
				}
				
			}
			
			resp.sendRedirect(req.getContextPath()+"/paying/insert.jsp?orderNo="+no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
