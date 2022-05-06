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
		<h1><a href="product_user_list.jsp">상품 목록</a></h1>
		</div>
		
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
					<div type="hidden" <%=productDto.getProductNo()%>></div>
					<td><a href="details.jsp" class="link"> <%=productDto.getProductImg()%>
					</a></td>
					<td><%=productDto.getProductName()%></td>
					<td><%=productDto.getProductPrice()%></td>
					<%
					}
					%>
			</tbody>
	</table>
	</div>
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>




