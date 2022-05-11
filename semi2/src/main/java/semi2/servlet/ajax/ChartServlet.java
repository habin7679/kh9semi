package semi2.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import semi2.beans.YearStatusDao;
import semi2.beans.YearStatusDto;

@WebServlet(urlPatterns = "/ajax/chart.kh")
public class ChartServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			YearStatusDao yearStatusDao = new YearStatusDao();
			List<YearStatusDto> list = yearStatusDao.selectList(); 
			
			ObjectMapper mapper = new ObjectMapper();
			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(mapper.writeValueAsString(list));
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}