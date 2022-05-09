package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;
import semi2.beans.BuyDto;
@WebServlet(urlPatterns = "/admin/buy_cancel.ez")
public class BuyCancelServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/plain; charset = UTF-8");
			int buyNo = Integer.parseInt(req.getParameter("buyNo"));
			BuyDao buyDao = new BuyDao();
			boolean success = buyDao.cancelInvoice(buyNo);
			
			if(success) {
				resp.sendRedirect("buy_detail.jsp?buyNo="+buyNo);
			}
			else {
				resp.sendRedirect("buy_cancel_fail.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
