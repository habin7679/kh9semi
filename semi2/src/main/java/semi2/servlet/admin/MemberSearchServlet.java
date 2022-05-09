package semi2.servlet.admin;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet(urlPatterns = "/admin/member_search.ez")
public class MemberSearchServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String type = req.getParameter("type");
			String keyword = req.getParameter("keyword");
	
			boolean isSearch = type != null && keyword != null;
			MemberDao memberDao = new MemberDao();
			List<MemberDto> list;
			
			if(isSearch) {
				list = memberDao.selectList(type, keyword);
			}
			else {
				list = Collections.emptyList();
			}
			
			if(list.isEmpty()) {
				resp.getWriter().println("검색결과가 존재하지 않습니다");
			}
			else {
				for(MemberDto memberDto : list) {
					resp.getWriter().println(memberDto);
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}