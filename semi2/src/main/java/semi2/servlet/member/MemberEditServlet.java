package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet(urlPatterns = "/member/edit.ez")
public class MemberEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비 : 파라미터(8개) + 세션(1개)
			req.setCharacterEncoding("UTF-8");

			MemberDto memberDto = new MemberDto();
			
			memberDto.setMemberId((String) req.getSession().getAttribute("member"));
			
			memberDto.setMemberNick(req.getParameter("memberNick"));
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			memberDto.setMemberEmail(req.getParameter("memberEmail"));
			memberDto.setMemberPost(req.getParameter("memberPost"));
			memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
			memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
			memberDto.setMemberPw(req.getParameter("memberPw"));
			
			//처리
			MemberDao memberDao = new MemberDao();
			
			//1. 원래 DB의 회원정보를 불러와서 비교
			MemberDto findDto = memberDao.selectOne(memberDto.getMemberId());
			boolean isPasswordCorrect = memberDto.getMemberPw().equals(findDto.getMemberPw());
			
			if(!isPasswordCorrect) {
				resp.sendRedirect(req.getContextPath()+"/member/edit.jsp?error");
				return;
			}
			
			//2. 개인정보 변경
			memberDao.edit(memberDto);
			
			//출력
			resp.sendRedirect(req.getContextPath()+"/member/mypage.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}