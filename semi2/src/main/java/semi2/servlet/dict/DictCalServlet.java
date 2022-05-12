package semi2.servlet.dict;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/dict/cal.ez")
public class DictCalServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			double age=Double.parseDouble(req.getParameter("age"));
			double height=Double.parseDouble(req.getParameter("height"));
			double weight= Double.parseDouble(req.getParameter("weight"));
			String gender= req.getParameter("gender");
			
			
			boolean isMale=gender.equals("male");
			double basal1=0;
			double basal2=0;
			if(isMale) {
				 basal1=66+ (13.7* weight) + (5 *height) - (6.8*age);
			}
			else {
				basal1=655+ (9.6*weight) + (1.7 *height) - (4.7*age);
			}
			
			double count= Double.parseDouble(req.getParameter("count"));
			
			
			if(count==0) {
				basal2 = basal1*1.2d;
			}else if(count>=1&&count<=3) {
				basal2 = basal1*1.375d;
			}else {
				basal2 = basal1*1.55d;
			}
			
			double kcal= basal2-basal2*0.2;
			
			basal1=Math.round(basal1);
			basal2=Math.round(basal2);
			kcal=Math.round(kcal);
			
			resp.sendRedirect(req.getContextPath()+"/dict/detail.jsp?basal1="+basal1+"&basal2="+basal2+"&kcal="+kcal);
			
			
		} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}
}
