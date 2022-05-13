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
		"/board/reply_edit.ez",
		"/board/reply_delete.ez"
})
public class ReplyOwnerFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		try {
			//준비 : 파라미터의 게시글번호(boardNo)와 세션의 권한(auth) 아이디(login)
			//[1] 관리자인지 확인해서 관리자라면 통과!
			String memberGrade = (String) req.getSession().getAttribute("auth");
			if(memberGrade.equals("관리자")) {
				chain.doFilter(request, response);
				return;
			}
			
			//[2] 작성자 본인인지 확인
			String memberId = (String)req.getSession().getAttribute("member");
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			
			ReplyDao replyDao = new ReplyDao();
			ReplyDto replyDto = replyDao.selectOne(replyNo);
			if(memberId.equals(replyDto.getReplyWriter())) {//본인이라면
				chain.doFilter(request, response);
			}
			else {//본인이 아니라면 : 권한 없음 에러 발생(403, forbidden)
				resp.sendError(403);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}




