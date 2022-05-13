<%@page import="semi2.beans.BoardDto"%>
<%@page import="semi2.beans.BoardDao"%>
<%@page import="java.util.List"%>
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
	BoardDao boardDao = new BoardDao();
	List<BoardDto> list;
		if (isSearch) {
			list = boardDao.selectListByPaging(p, s, type, keyword);
		} else {
			list = boardDao.listAllByPaging(p, s);
		}
%>
<%
	int count;
	if(isSearch){
		count = memberDao.countByPaging(type, keyword);
	}
	else{
		count = memberDao.countByPaging();
	}
	
	int lastPage = (count + s - 1) / s;
	
	int blockSize = 10;
	
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	if(endBlock > lastPage){
		endBlock = lastPage;
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
				<option value="member_grade">회원등급</option>
			</select>
			<%
			} else {
			%>
			<select name="type" class="form-input input-round">
				<option value="member_id">아이디</option>
				<option value="member_grade" selected>회원등급</option>
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
	<div>
	<%
	}
	%>
	</div>
	<div class="row center pagination">
		<%if(p > 1){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="member_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="member_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(isSearch){ %>
				<%if(i == p){ %>
				<a class="active" href="member_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="member_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="member_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="member_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<%if(endBlock < lastPage){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="member_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="member_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
	

<jsp:include page="/template/footer.jsp"></jsp:include>