package semi2.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.PayingDao;
import semi2.beans.PayingDto;
@WebServlet("/admin/order_list.ez")
public class OrderListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			PayingDao payingDao = new PayingDao();
			List<PayingDto> list = payingDao.listAll();
			for(PayingDto payingDto : list) {
				resp.getWriter().println(payingDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
				
	}
}
