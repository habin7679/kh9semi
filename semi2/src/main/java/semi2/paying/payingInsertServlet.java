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
import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
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
			String memberId = (String)req.getSession().getAttribute("member");
			
			PayingDao payingDao = new PayingDao();
			PayingDto payingDto = new PayingDto();			
			ProductDao productDao = new ProductDao();
			OrderDao orderDao = new OrderDao();
			
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
			payingDto.setPayingDeliveryFee(Integer.parseInt(req.getParameter("deliveryFee")));
			payingDto.setPayingDeliveryTime(Integer.parseInt(req.getParameter("payingDeliveryTime")));

			List<OrderDto> list = orderDao.selectAllPaying(orderNo);
			
			int totalPrice = 0;
			
			for(int i =0; i<list.size(); i++) {
				int productNo = list.get(i).getProductNo();
				int orderAmount = list.get(i).getOrderCount();
				totalPrice+=list.get(i).getOrderPrice();
				productDao.stockMinus(productNo, orderAmount);
			}
			MemberDto memberDto= new MemberDto();
			MemberDao mDao = new MemberDao();
			mDao.pointAdd(totalPrice, memberId);
			memberDto=mDao.selectOne(memberId);
			
			if(memberDto.getMemberPoint()>70000) {
				mDao.updateGrade(memberId, "vip");
			}
			else if(memberDto.getMemberPoint()>30000) {
				mDao.updateGrade(memberId, "우수회원");
			}
			else {
				mDao.updateGrade(memberId, "일반회원");
			}
			
			
			boolean is = payingDao.insertRest2(payingDto);
			if(is) {
				BuyDao bDao = new BuyDao();
				BuyDto bDto = new BuyDto();
				bDto.setMemberId(memberId);
				bDto.setOrderNo(orderNo);
				bDao.insertCredit(bDto);
				int buyNo = bDao.bNoExtraction(orderNo);
				resp.sendRedirect(req.getContextPath()+"/buy/detail.jsp?buyNo="+buyNo);
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

