<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
	
	%>
	 <div>
	  <div><%=memberDto.getMemberNick()%></div>
	  <div><%=memberDto.getMemberPoint() %>point</div>
	  <div><a href="edit.jsp">내 정보 변경하기</a></div>
	  <div><a href="<%=request.getContextPath() %>/buy/list.jsp">구매내역</a></div>
	  <div><a href="#">최근 본 상품</a></div>
	  <div><a href="#">배송지 관리</a></div>
	  <div><a href="#">정기배송 신청하기</a></div>
	  <div><a href="<%=request.getContextPath()%>/review_list.jsp">내 후기내역</a></div>
	  <div><a href="<%=request.getContextPath()%>/qna_list.jsp">내 문의내역</a></div>
	  
	  <div><a href="exit.jsp">회원 탈퇴하기</a></div>
	  
	  
	 </div>
	
	

<jsp:include page="/template/footer.jsp"></jsp:include>