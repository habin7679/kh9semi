package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet(urlPatterns = "/member/login.ez")
public class MemberLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/plain; charset=UTF-8");
			//준비
			String memberId= req.getParameter("memberId");
			String memberPw= req.getParameter("memberPw");
			String referer=req.getParameter("reperer");
			
			//처리
			MemberDao memberDao= new MemberDao();
			MemberDto memberDto=memberDao.Login(memberId);
			
			boolean login= memberDto !=null;
			boolean login2=memberDto.getMemberPw().equals(memberPw);
			
			//출력
			if(login&&login2) {
				req.getSession().setAttribute("member", memberId);
				req.getSession().setAttribute("admin", memberDto.getMemberGrade());
				
				if(referer !=null) {
					resp.sendRedirect(referer);
				}
				else {
					resp.sendRedirect(req.getContextPath());
				}
			}
			else {
				resp.sendRedirect("login.jsp?error");
			}
			
		}catch(

	Exception e)
	{
		e.printStackTrace();
		resp.sendError(500);
	}
}}