<%@page import="semi2.beans.BuyDto"%>
<%@page import="semi2.beans.OrderDto"%>
<%@page import="semi2.beans.BuyDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<jsp:include page="/template/header.jsp"></jsp:include>
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
		BuyDao buyDao = new BuyDao();
		List<BuyDto> list;
		if (isSearch) {
			list = buyDao.selectListByPaging(p, s, type, keyword);
		} else {
			list = buyDao.listAllByPaging(p, s);
		}
	%>
	<%
		int count;
		if(isSearch){
			count = buyDao.countByPaging(type, keyword);
		}
		else{
			count = buyDao.countByPaging();
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
	
	<div class="container w950 m30">
	<div>
		<div class="row center">
			<h1>
				<a href="buy_list.jsp">주문 목록</a>
			</h1>
		</div>
		<form action="buy_list.jsp" method="get">
	
			<%
			if (type == null || type.equals("buy_no")) {
			%>
			<select name="type" class="form-input input-round">
				<option value="buy_no" selected>구매번호</option>
				<option value="member_id">회원아이디</option>
			</select>
			<%
			} else {
			%>
			<select name="type" class="form-input input-round">
				<option value="buy_no">구매번호</option>
				<option value="member_id" selected>회원아이디</option>
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
	
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>구매번호</th>
					<th>아이디</th>
					<th>주문번호</th>
					<th>송장번호</th>
					<th>배송상태</th>
					<th>상세</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (BuyDto buyDto : list) {
				%>
				<tr>
					<td><%=buyDto.getBuyNo()%></td>
					<td><%=buyDto.getMemberId()%></td>
					<td><%=buyDto.getOrderNo()%></td>
					<td><%=buyDto.getBuyInvoice()%></td>
					<td><%=buyDto.getBuyStatus()%></td>
					<td><a href="buy_detail.jsp?buyNo=<%=buyDto.getBuyNo()%>" class="link">상세보기</a></td>
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
			<a href="buy_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="buy_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
			<a href="buy_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="buy_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(isSearch){ %>
				<%if(i == p){ %>
				<a class="active" href="buy_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="buy_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="buy_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="buy_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<%if(endBlock < lastPage){ %>
			<%if(isSearch){ %>
			<a href="buy_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="buy_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(isSearch){ %>
			<a href="buy_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="buy_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
</div>
<br>
<jsp:include page="/template/footer.jsp"></jsp:include>