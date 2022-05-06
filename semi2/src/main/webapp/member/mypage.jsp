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
	  <div><%=memberDto.getMemberNick() %></div>
	  <div><a href="update.jsp">내 정보 변경하기</a></div>
	  
	  
	 </div>
	
	

<jsp:include page="/template/footer.jsp"></jsp:include>