package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;

@WebServlet(urlPatterns = "/admin/buy_delete.ez")
public class BuyDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int buyNo = Integer.parseInt(req.getParameter("buyNo"));
			BuyDao buyDao = new BuyDao();
			boolean success = buyDao.delete(buyNo);
			
			if(success) {
				resp.sendRedirect("buy_list.jsp");
			}
			else {
				resp.sendRedirect("buy_delete_fail.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
