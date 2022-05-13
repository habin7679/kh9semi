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
				 basal1=88.4+ (13.4* weight) + (4.8 *height) - (5.68*age);
			}
			else {
				basal1=447.6+ (9.25*weight) + (3.1 *height) - (4.33*age);
			}
			
			double count= Double.parseDouble(req.getParameter("count"));
			
			
			if(count==0) {
				basal2 = basal1*1.2d;
			}else if(count>=1&&count<=3) {
				basal2 = basal1*1.375d;
			}else {
				basal2 = basal1*1.55d;
			}
			
			double kcal= basal2-500;
			
			double oneEat=kcal/3;
			
			double protein=kcal/10*4/4;
			
			double carbo=kcal/10*4/4;
			
			double fat=kcal/10*2/9;
			
			basal1=Math.round(basal1);
			basal2=Math.round(basal2);
			kcal=Math.round(kcal);
			oneEat=Math.round(oneEat);
			protein=Math.round(protein);
			carbo=Math.round(carbo);
			fat=Math.round(fat);
			
			resp.sendRedirect(req.getContextPath()+"/dict/detail.jsp?basal1="+basal1+"&basal2="+basal2+"&kcal="+kcal
					+"&oneEat="+oneEat+"&protein="+protein+"&carbo="+carbo+"&fat="+fat);
			
			
		} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}
}
