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

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebFilter(filterName="f5", urlPatterns = {
		
		"/admin/*", "/product_admin_detail.jsp",
		"/product_admin_list.jsp", "/product_delete_faill.jsp",
		"/product_delete_success.jsp", "/product_edit.jsp",
		"/product_edit_success.jsp", "/product_edit_fail.jsp",
		"/product_insert.jsp", "/product_insert_success.jsp"
		
		
})
public class adminFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			//준비 : 파라미터의 게시글번호(boardNo)와 세션의 권한(auth) 아이디(login)
			//[1] 관리자인지 확인해서 관리자라면 통과!
			String memberId = (String)req.getSession().getAttribute("member");
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectOne(memberId);
					
					
			if(memberDto.getMemberGrade().equals("관리자")) {
				chain.doFilter(request, response);
				
			}
			else {
				resp.sendRedirect(req.getContextPath()+"/member/admin.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}