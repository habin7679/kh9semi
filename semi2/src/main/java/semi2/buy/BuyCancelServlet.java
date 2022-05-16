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
import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
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
			boolean is = bDao.updateStatus("취소완료", bNo);
			
			if(is) {
				BuyDto bDto = bDao.selectOne(bNo);
				
				int oNo = bDto.getOrderNo();
				
				OrderDao oDao = new OrderDao();
				
				List<OrderDto> list = oDao.selectAllBuy(oNo);
				//넘버, 어마운트
				
				ProductDao productDao = new ProductDao();
				
				int totalPrice = 0;
				
				for(int i =0; i<list.size(); i++) {
					
					int productNo = list.get(i).getProductNo();
					int orderAmount = list.get(i).getOrderCount();
					
					productDao.stockPlus(productNo, orderAmount);
					
					totalPrice+=list.get(i).getOrderPrice();
				}
				MemberDao mDao = new MemberDao();
				String memberId=(String)req.getSession().getAttribute("member");
				MemberDto memberDto= mDao.selectOne(memberId);
				if(memberDto.getMemberPoint()>3000) {
					mDao.updateGrade("우수회원", memberId);
				}
				else if(memberDto.getMemberPoint()>7000) {
					mDao.updateGrade("vip", memberId);
				}
				else {
					mDao.updateGrade("일반회원", memberId);
				}
				
				mDao.pointMinus(totalPrice, (String)req.getSession().getAttribute("member"));
				
				resp.sendRedirect(req.getContextPath()+"/buy/list.jsp");				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
