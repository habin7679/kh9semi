<title>이지어트</title>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 준비 --%>
<%
	MemberDao memberDao = new MemberDao();
	List<MemberDto> list = memberDao.listAll();
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
			<div class="row center">
		<h1>회원 목록 조회</h1>
		</div>
		<div class="row right">
		<a href="member_insert.jsp" class="link link-btn">회원추가</a>
		</div>
		<div class="row">
		<table class="table table-border table-hover" >
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>등급</th>
					<th>포인트</th>
					<th>상세</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto memberDto : list){ %>
					<tr>
					<td><%=memberDto.getMemberId()%></td>
					<td><%=memberDto.getMemberName()%></td>
					<td><%=memberDto.getMemberNick()%></td>
					<td><%=memberDto.getMemberGrade()%></td>
					<td><%=memberDto.getMemberPoint()%></td>
					<td><a href = "member_detail.jsp" class="link">상세보기</a></td>
					</tr>
				<%} %>
			</tbody>
	</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>