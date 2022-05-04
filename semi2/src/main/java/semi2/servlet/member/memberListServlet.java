package semi2.servlet.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet("/member/list.ez")
public class memberListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MemberDao memberDao = new MemberDao();
			List<MemberDto> list = memberDao.listAll();
			
			resp.setContentType("text/plain; charset=UTF-8");
			for(MemberDto memberDto : list) {
				resp.getWriter().println(memberDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
	}
}