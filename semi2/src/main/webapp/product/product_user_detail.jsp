<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	int productNo = Integer.parseInt(request.getParameter("product_no"));
%>

<%-- 처리 --%>    
<%
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.selectOne(productNo);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
		
<%if(productDto == null){ %>
<h1>해당 상품은 존재하지 않습니다</h1>
<%} else { %>
<h1>상품 상세정보 보기</h1>

<table border="1">
	<tr>
		<th>이름</th>
			<td><%=productDto.getProductName()%></td>
	</tr>
	<tr>
		<th>가격</th>
			<td><%=productDto.getProductPrice()%></td>
	</tr>
	<tr>
		<th>행사여부</th>
			<td><%=productDto.getProductEvent()%></td>
	</tr>
	<tr>
		<th>칼로리</th>
			<td><%=productDto.getProductKcal()%></td>
	</tr>
	<tr>
		<th>단백질</th>
			<td><%=productDto.getProductProtein()%></td>
	</tr>
	<tr>
		<th>탄수화물</th>
			<td><%=productDto.getProductCarbohydrate()%></td>
	</tr>
	<tr>
		<th>지방</th>
			<td><%=productDto.getProductFat()%></td>
	</tr>
	<tr>
		<th>상품정보</th>
			<td><%=productDto.getProductInfo()%></td>
	</tr>
	<tr>
		<th>상품이미지</th>
				<td> <img src = "<%=request.getContextPath() %>/image/product<%=productNo%>.jpg" width="200" height="200"></td>
	</tr>
	<tr>
		<td><input type="button" value="구매하기"></td>
	</tr>
	
	
</table>
<%} %>

<h2><a href="product_user_list.jsp">목록으로 돌아가기</a></h2>
<h2><a href="#">후기보기</a></h2>
<h2><a href="#">상품 문의</a></h2>
		
<jsp:include page="/template/footer.jsp"></jsp:include>