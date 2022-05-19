package semi2.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi2.beans.DeliveryDao;
import semi2.beans.DeliveryDto;
import semi2.beans.MemberDao;
import semi2.beans.MemberDto;
@WebServlet(urlPatterns = "/member/join.ez")
public class MemberJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/plain; charset=UTF-8");
			
			MemberDto memberDto= new MemberDto();
			String memberId=req.getParameter("memberId");
			memberDto.setMemberId(memberId);
			
			memberDto.setMemberPw(req.getParameter("memberPw"));
			
			memberDto.setMemberNick(req.getParameter("memberNick"));
			
			String memberName=req.getParameter("memberName");
			memberDto.setMemberName(memberName);
			
			memberDto.setMemberBirth(req.getParameter("memberBirth"));
			
			memberDto.setMemberEmail(req.getParameter("memberEmail"));
			
			String memberPhone=req.getParameter("memberPhone");
			memberDto.setMemberPhone(memberPhone);
			
			String memberPost=req.getParameter("memberPost");
			memberDto.setMemberPost(memberPost);
			
			String memberBasicAddress=req.getParameter("memberBasicAddress");
			memberDto.setMemberBasicAddress(memberBasicAddress);
			
			String memberDetailAddress=req.getParameter("memberDetailAddress");
			memberDto.setMemberDetailAddress(memberDetailAddress);
			
			MemberDao memberDao= new MemberDao();
			memberDao.join(memberDto);
			
			DeliveryDto deliveryDto= new DeliveryDto();
			deliveryDto.setMemberId(memberId);
			deliveryDto.setDeliveryName(memberName);
			deliveryDto.setDeliveryPhone(memberPhone);
			deliveryDto.setDeliveryPost(memberPost);
			deliveryDto.setDeliveryBasicAddress(memberBasicAddress);
			deliveryDto.setDeliveryDetailAddress(memberDetailAddress);
			
			DeliveryDao deliveryDao= new DeliveryDao();
			deliveryDao.insert(deliveryDto);
			
			resp.sendRedirect(req.getContextPath()+"/member/join_success.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath()+"/member/join.jsp?error");
		}
	}
	
}
