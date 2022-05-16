<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
   %>

	
	
	<div class="container w500 m30" style="height: 400px;">
	<div class="row center"><h1><%=memberDto.getMemberNick() %></h1>님 반갑습니다</div>
	<div class="row center"><h2>등급:<%=memberDto.getMemberGrade() %></h2></div>
	<div class="row"><h2>포인트:<%=memberDto.getMemberPoint() %>p</h2></div>
	<div class="row center"><a href="<%=request.getContextPath() %>/member/edit.jsp" class="link link-btn">정보 수정하기</a></div>

	<style>
	.ha{
	padding-right : 130px;
	padding-top : 130px;
	}

    
</style>
<div class="row float-container">
<div class="float-left layer-3">
<jsp:include page="/template/menu.jsp"></jsp:include>
</div>
<div class="float-left layer-2 ha">
	<h1><%=memberDto.getMemberNick() %>님 반갑습니다</h1>
	<h2>등급:<%=memberDto.getMemberGrade() %></h2>
	<h2>포인트:<%=memberDto.getMemberPoint() %>p</h2>
	<a href="<%=request.getContextPath() %>/member/edit.jsp" class="link link-btn">정보 수정하기</a>
	</div>

	</div>

	

<jsp:include page="/template/footer.jsp"></jsp:include>