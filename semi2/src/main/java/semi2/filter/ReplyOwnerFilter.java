package semi2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.ReplyDao;
import semi2.beans.ReplyDto;

@WebFilter(filterName="f4", urlPatterns = {
//		"/board/reply_edit.ez",
//		"/board/reply_delete.ez"
})
public class ReplyOwnerFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		try {

			String memberGrade = (String) req.getSession().getAttribute("admin");
			if(memberGrade.equals("관리자")) {
				chain.doFilter(request, response);
				return;
			}
			

			String memberId = (String)req.getSession().getAttribute("member");
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			
			ReplyDao replyDao = new ReplyDao();
			ReplyDto replyDto = replyDao.selectOne(replyNo);
			if(memberId.equals(replyDto.getReplyWriter())) {
				chain.doFilter(request, response);
			}
			else {
				resp.sendError(403);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}




