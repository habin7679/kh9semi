<%@page import="semi2.beans.BuyDto"%>
<%@page import="semi2.beans.OrderDto"%>
<%@page import="semi2.beans.BuyDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
%>
<%
	boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
	BuyDao buyDao = new BuyDao();
	List<BuyDto> list;
	if (isSearch) {
		list = buyDao.selectList(type, keyword);
	} else {
		list = buyDao.selectAllForAdmin();
	}
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
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
<%
}
%>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>
