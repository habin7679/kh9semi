package semi2.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.naming.java.javaURLContextFactory;
import org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding;

import semi2.beans.MemberDao;
import semi2.beans.MemberDto;

@WebServlet(urlPatterns = "/admin/member_insert.ez")
public class MemberInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		req.setCharacterEncoding("UTF-8");
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId(req.getParameter("memberId"));
		memberDto.setMemberPw(req.getParameter("memberPw"));
		memberDto.setMemberNick(req.getParameter("memberNick"));
		memberDto.setMemberName(req.getParameter("memberName"));
		memberDto.setMemberPhone(req.getParameter("memberPhone"));
		memberDto.setMemberEmail(req.getParameter("memberEmail"));
		memberDto.setMemberBirth(req.getParameter("memberBirth"));
		memberDto.setMemberPost(req.getParameter("memberPost"));
		memberDto.setMemberBasicAddress(req.getParameter("memberBasicAddress"));
		memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
		memberDto.setMemberPoint(Integer.parseInt(req.getParameter("memberPoint")));
		memberDto.setMemberGrade(req.getParameter("memberGrade"));
		java.sql.Date memberJoindate = java.sql.Date.valueOf(req.getParameter("memberJoindate"));
		memberDto.setMemberJoindate(memberJoindate);
		
		MemberDao memberDao = new MemberDao();
		memberDao.add(memberDto);
		
		resp.sendRedirect("member_detail.jsp?memberId="+ memberDto.getMemberId());
	}
	catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
		}
	}
}
