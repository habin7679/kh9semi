package semi2.buy;

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
import semi2.beans.ProductDao;

@WebServlet(urlPatterns="/buy/cancel.ez")
public class BuyCancelServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bNo = Integer.parseInt(req.getParameter("buyNo"));
			BuyDao bDao = new BuyDao();
			BuyDto bDto = bDao.selectOne(bNo);
			OrderDao oDao = new OrderDao();
			List<OrderDto> list = oDao.selectAll(bDto.getOrderNo());
			ProductDao productDao = new ProductDao();
			for(int i =0; i<list.size(); i++) {
				int productNo = list.get(i).getProductNo();
				int orderAmount = list.get(i).getOrderCount();
				productDao.stockPlus(productNo, orderAmount);
			}
			boolean is = bDao.updateStatus("취소완료", bNo);
			
			
			resp.sendRedirect(req.getContextPath()+"/buy/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
