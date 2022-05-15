package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.PayingDao;
import semi2.beans.PayingDto;
@WebServlet(urlPatterns = "/admin/order_detail.ez")
public class OrderDetailServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int orderNo = Integer.parseInt(req.getParameter("orderNo"));
		
		PayingDao payingDao = new PayingDao();
		PayingDto payingDto = payingDao.selectOne(orderNo);
		
		if (payingDto == null) {
			resp.getWriter().println("존재하지 않는 배송");
		}
		else {
			resp.getWriter().println("주문번호 :" + payingDto.getOrderNo());
			resp.getWriter().println("아이디 :" + payingDto.getMemberId());
			resp.getWriter().println("총가격 :" + payingDto.getPayingTotal());
			resp.getWriter().println("주문일시 :" + payingDto.getPayingDate());
			resp.getWriter().println("수령인 :" + payingDto.getPayingName());
			resp.getWriter().println("연락처 :" + payingDto.getPayingPhone());
			resp.getWriter().println("우편 :" + payingDto.getPayingPost());
			resp.getWriter().println("주소 :" + payingDto.getPayingBasicAddress());
			resp.getWriter().println("상세주소 :" + payingDto.getPayingDetailAddress());
			resp.getWriter().println("배송비 :" + payingDto.getPayingDeliveryFee());
			resp.getWriter().println("배송일 :" + payingDto.getPayingDeliveryDate());
			resp.getWriter().println("배송시간 :" + payingDto.getPayingDeliveryTime());
			resp.getWriter().println("결제방법 :" + payingDto.getPayingPayway());
		}
		
	} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}