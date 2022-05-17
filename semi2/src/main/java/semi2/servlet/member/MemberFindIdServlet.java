package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/member/find_id.ez")
public class MemberFindIdServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			MemberDto memberDto= new MemberDto();
			memberDto.setMemberName(req.getParameter("memberName"));
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			
			//처리
			MemberDao memberDao= new MemberDao();
			String memberId=memberDao.findId(memberDto);
			
			//출력
			if(memberId==null) {
				resp.sendRedirect(req.getContextPath()+"/member/find_id.jsp?error");
			}
			else {
				resp.sendRedirect(req.getContextPath()+"/member/find_id_success.jsp?memberId="+memberId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
