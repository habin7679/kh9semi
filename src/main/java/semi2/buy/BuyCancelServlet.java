package semi2.buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;

@WebServlet(urlPatterns="/buy/cancel.ez")
public class BuyCancelServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bNo = Integer.parseInt(req.getParameter("buyNo"));
			BuyDao bDao = new BuyDao();
			boolean is = bDao.updateStatus("취소완료", bNo);
			
			resp.sendRedirect(req.getContextPath()+"/buy/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
