<%@page import="semi2.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	int p;
		try {
			p = Integer.parseInt(request.getParameter("p"));
			if(p <= 0)	throw new Exception();
		}
		catch(Exception e){
			p = 1;
		}
	
	int s;
		try {
			s = Integer.parseInt(request.getParameter("s"));
			if(s <= 0) throw new Exception();
		}
		catch(Exception e){
			s = 10;
		}
%>
<%
boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
MemberDao memberDao = new MemberDao();
List<MemberDto> list;
if (isSearch) {
	list = memberDao.selectList(type, keyword);
} else {
	list = memberDao.listAll();
}
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
	<div class="row center">
		<h1>
			<a href="member_list.jsp">회원 목록</a>
		</h1>
	</div>
	<form action="member_list.jsp" method="get">

		<%
		if (type == null || type.equals("member_id")) {
		%>
		<select name="type" class="form-input input-round">
			<option value="member_id" selected>아이디</option>
			<option value="member_name">이름</option>
		</select>
		<%
		} else {
		%>
		<select name="type" class="form-input input-round">
			<option value="member_id">아이디</option>
			<option value="member_name" selected>이름</option>
		</select>
		<%
		}
		%>

		<%
		if (isSearch) {
		%>
		<input type="search" name="keyword" class="form-input input-round"
			placeholder="검색어" value="<%=keyword%>">
		<%
		} else {
		%>
		<input type="search" name="keyword" class="form-input input-round"
			placeholder="검색어">
		<%
		}
		%>

		<input type="submit" value="검색" class="btn btn-primary">
	</form>
</div>


<!-- 검색결과 -->
<%
if (list.isEmpty()) {
%>
<div class="row center">
	<h2>결과가 존재하지 않습니다</h2>
</div>
<%
} else {
%>
<div class="row right">
	<a href="member_insert.jsp" class="link link-btn">회원추가</a>
</div>
<div class="row">
	<table class="table table-border table-hover">
		<thead>
			<tr>
				<th>아이디</th>
				<th>회원명</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>보유포인트</th>
				<th>등급</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (MemberDto memberDto : list) {
			%>
			<tr>
				<td><%=memberDto.getMemberId()%></td>
				<td><%=memberDto.getMemberName()%></td>
				<td><%=memberDto.getMemberNick()%></td>
				<td><%=memberDto.getMemberPhone()%></td>
				<td><%=memberDto.getMemberPoint()%></td>
				<td><%=memberDto.getMemberGrade()%></td>
				
				<td><a href="member_detail.jsp?memberId=<%=memberDto.getMemberId()%>" class="link">상세보기</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</div>
<%
}
%>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>
