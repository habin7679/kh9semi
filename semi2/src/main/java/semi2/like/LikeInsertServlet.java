package semi2.like;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.LikeDao;
import semi2.beans.LikeDto;

@WebServlet(urlPatterns="/like/insert.ez")
public class LikeInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			LikeDto lDto = new LikeDto();

			lDto.setMemberId((String)req.getSession().getAttribute("member"));
			int pNo = Integer.parseInt(req.getParameter("productNo"));
			
			lDto.setProductNo(pNo);

			LikeDao lDao = new LikeDao();
			if(lDao.selectOne(lDto).getProductNo()==pNo) {
				//중복 추가 금지
				resp.sendRedirect(req.getContextPath()+"/like/error1.jsp");
			}else if(lDao.selectSize((String)req.getSession().getAttribute("member"))>=10){
				resp.sendRedirect(req.getContextPath()+"/like/error.jsp");
			}else {
				lDao.insert(lDto);
				resp.sendRedirect(req.getContextPath()+"/like/list.jsp");				
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
