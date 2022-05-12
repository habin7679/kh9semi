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

@WebFilter(filterName="f2", urlPatterns = {
		
		"/member/mypage.jsp",
		"/member/password.jsp", "/member/password.ez",
		"/member/edit.jsp", "/member/information.ez",
		"/member/exit.jsp", "/member/exit.ez",
		"/board/write.jsp", "/board/write.ez",
		"/board/edit.jsp", "/board/edit.ez",
		"/board/delete.ez", "/board/write_review.ez"
		
})
public class LoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			//세션 검사
			String memberId = (String) req.getSession().getAttribute("member");
			
			if(memberId == null) {
				//로그인 페이지로 강제 이동 처리
				resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
				//resp.sendError(401); //401(Unauthorize - 미인증)
			}
			else {
				//chain.doFilter(req, resp);
				chain.doFilter(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}