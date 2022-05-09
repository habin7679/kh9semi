package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;
import semi2.beans.BuyDto;
@WebServlet(urlPatterns = "/admin/buy_detail.ez")
public class BuyDetailServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int buyNo = Integer.parseInt(req.getParameter("buyNo"));
		
		BuyDao buyDao = new BuyDao();
		BuyDto buyDto = buyDao.selectOne(buyNo);
		
		if (buyDto == null) {
			resp.getWriter().println("존재하지 않는 회원");
		}
		else {
			resp.getWriter().println("구매번호 :" + buyDto.getBuyNo());
			resp.getWriter().println("아이디 :" + buyDto.getMemberId());
			resp.getWriter().println("주문번호 :" + buyDto.getOrderNo());
			resp.getWriter().println("송장번호 :" + buyDto.getBuyInvoice());
			resp.getWriter().println("배송상태 :" + buyDto.getBuyStatus());
		}
		
	} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}