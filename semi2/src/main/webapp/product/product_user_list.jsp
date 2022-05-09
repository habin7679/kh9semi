<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%


String productName = request.getParameter("product_name");
Format f = new DecimalFormat("0.00");
%>

<%
boolean isSearch = productName != null && !productName.trim().equals("");
ProductDao productDao = new ProductDao();
List<ProductDto> list;
if(isSearch)
	list = productDao.listUser(productName);
else
	list = productDao.listAll();
%>
<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
			<div class="row center">
		<h1><a href="product_user_list.jsp">상품 목록</a></h1>
		</div>
	<div class="row center">
		<!-- 검색창 -->
		<form action="product_user_list.jsp" >
			<%if(productName == null){ %>
			<input type="text" name="product_name" required class="form-input input-round">
			<%} else { %>
			<input type="text" name="product_name" required placeholder="검색어 작성" value="<%=productName%>" class="form-input input-round">
			<%} %>
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
		<table class="table table-border table-hover" >
			<thead>
				<tr>
					<th>상품이미지</th>
					<th>제품명</th>
					<th>제품 가격</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (ProductDto productDto : list) {
				%>
				<tr>
					<input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
					<td><%=productDto.getProductSort() %></td>
					<td><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link"> <%=productDto.getProductImg()%>
					</a></td>
					<td><%=productDto.getProductName()%></td>
					<td><%=productDto.getProductPrice()%></td>
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




