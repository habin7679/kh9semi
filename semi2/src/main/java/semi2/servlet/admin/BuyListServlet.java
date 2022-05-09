package semi2.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.BuyDao;
import semi2.beans.BuyDto;

@WebServlet("/admin/buy_list.ez")
public class BuyListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BuyDao buyDao = new BuyDao();
			List<BuyDto> list = buyDao.selectAllForAdmin();
			
			for(BuyDto buyDto : list) {
				resp.getWriter().println(buyDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
	}
}