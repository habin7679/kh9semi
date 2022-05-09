package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;
import semi2.beans.BuyDto;
@WebServlet(urlPatterns = "/admin/buy_edit.ez")
public class BuyEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/plain; charset = UTF-8");
			BuyDto buyDto = new BuyDto();
			buyDto.setMemberId(req.getParameter("memberId"));
			buyDto.setOrderNo(Integer.parseInt(req.getParameter("orderNo")));
			buyDto.setBuyInvoice(Long.parseLong(req.getParameter("buyInvoice")));
			buyDto.setBuyStatus(req.getParameter("buyStatus"));
			buyDto.setBuyNo(Integer.parseInt(req.getParameter("buyNo")));

			BuyDao buydao = new BuyDao();
			boolean success = buydao.edit(buyDto);
			
			if(success) {
				resp.sendRedirect("buy_detail.jsp?buyNo=" + buyDto.getBuyNo());
			}
			else {
				resp.sendRedirect("buy_edit_fail.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
