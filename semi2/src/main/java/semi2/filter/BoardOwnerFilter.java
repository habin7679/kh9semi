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

import semi2.beans.BoardDao;
import semi2.beans.BoardDto;
import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebFilter(filterName="f3", urlPatterns = {
		"/board/edit.jsp", "/board/edit.ez",
		"/board/delete.ez"
})
public class BoardOwnerFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		try {
			//준비
			String memberId = (String)req.getSession().getAttribute("member");
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectOne(memberId);
					
					
			if(memberDto.getMemberGrade().equals("관리자")) {
				chain.doFilter(request, response);
				return;
			}
			
			//작성자 본인인지 확인
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			BoardDao boardDao = new BoardDao();
			BoardDto boardDto = boardDao.selectOne(boardNo);
			if(memberId.equals(boardDto.getBoardWriter())) {//본인이라면
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





