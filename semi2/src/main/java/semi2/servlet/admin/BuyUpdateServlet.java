package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.FrameworkListener;

import semi2.beans.BuyDao;
import semi2.beans.BuyDto;
@WebServlet(urlPatterns = "/admin/buy_update.ez")
public class BuyUpdateServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		BuyDto buyDto = new BuyDto();
		buyDto.setBuyNo(Integer.parseInt(req.getParameter("buyNo")));
		buyDto.setMemberId(req.getParameter("memberId"));
		buyDto.setOrderNo(Integer.parseInt(req.getParameter("orderNo")));
		buyDto.setBuyInvoice(Long.parseLong(req.getParameter("buyInvoice")));
		buyDto.setBuyStatus(req.getParameter("buyStatus"));
		
		BuyDao buyDao = new BuyDao();
		boolean success = buyDao.updateInvoice(buyDto);
		if(success) {
			resp.sendRedirect("buy_detail.jsp?buyNo=" + buyDto.getBuyNo());
		}
		else {
			resp.sendRedirect("buy_update_fail.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
