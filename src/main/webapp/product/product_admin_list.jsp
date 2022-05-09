<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ProductDao"%>
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
ProductDao productDao = new ProductDao();
List<ProductDto> list;
if (isSearch) {
	list = productDao.selectList(type, keyword);
} else {
	list = productDao.listAll();
}
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
	<div class="row center">
		<h1>
			<a href="product_admin_list.jsp">상품 목록</a>
		</h1>
	</div>
	<form action="product_admin_list.jsp" method="get">

		<%
		if (type == null || type.equals("product_name")) {
		%>
		<select name="type" class="form-input input-round">
			<option value="product_name" selected>이름</option>
			<option value="product_sort">분류</option>
		</select>
		<%
		} else {
		%>
		<select name="type" class="form-input input-round">
			<option value="product_name">이름</option>
			<option value="product_sort" selected>분류</option>
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
	<a href="product_insert.jsp" class="link link-btn">생성</a>
</div>
<div class="row">
	<table class="table table-border table-hover">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>제품명</th>
				<th>분류</th>
				<th>제품 가격</th>
				<th>재고</th>
				<th>제조사</th>
				<th>제조일</th>
				<th>폐기일</th>
				<th>행사 여부</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (ProductDto productDto : list) {
			%>
			<tr>
				<td><%=productDto.getProductNo()%></td>
				<td><%=productDto.getProductName()%></td>
				<td><%=productDto.getProductSort()%></td>
				<td><%=productDto.getProductPrice()%></td>
				<td><%=productDto.getProductStock()%></td>
				<td><%=productDto.getProductCompany()%></td>
				<td><%=productDto.getProductMade()%></td>
				<td><%=productDto.getProductExpire()%></td>
				<td><%=productDto.getProductEvent()%></td>
				<td><a href="product_admin_detail.jsp?product_no=<%=productDto.getProductNo() %>" class="link">상세보기</a></td>
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





