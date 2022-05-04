<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	ProductDao productDao = new ProductDao();
	String productSort = request.getParameter("productSort");
	List<ProductDto> list = productDao.listUser(productSort);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
			<div class="row center">
		<h1>상품 목록</h1>
		</div>
		<div class="row right">
		<a href="product_insert.jsp" class="link link-btn">생성</a>
		</div>
		<div class="row">
		<table class="table table-border table-hover" >
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
				<%for(ProductDto productDto : list){ %>
				<tr>
				<td><%=productDto.getProductNo() %></td>
						<td><%=productDto.getProductName()%></td>
						<td><%=productDto.getProductSort()%></td>
						<td><%=productDto.getProductPrice()%></td>
						<td><%=productDto.getProductStock()%></td>
						<td><%=productDto.getProductCompany()%></td>
						<td><%=productDto.getProductMade()%></td>
						<td><%=productDto.getProductExpire()%></td>
						<td><%=productDto.getProductEvent()%></td>
						<td><a href = "detail.jsp" class="link">상세보기</a>
					</div>
					</td>
				</tr>
				<%}%>
			</tbody>
	</table>
	</div>
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>





