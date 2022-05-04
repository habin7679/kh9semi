<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memberId = (String)session.getAttribute("login");
CartDao cDao = new CartDao();
List<CartDto> list = cDao.selectAll(memberId);
ProductDao pDao = new ProductDao();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="order.ez" method="post">
<%for(int i =0; i<list.size(); i++) {
	int productNo = list.get(i).getProductNo();
	ProductDto pDto = pDao.selectOne(productNo);
%>
	<div>
		<input type="hidden" name="productNo" value=<%=pDto.getProductNo()%>/>
		<h1><%= pDto.getProductName() %></h1>
		<img src="<%=pDto.getProductImg() %>"/>
		<h3><%=pDto.getProductPrice() %></h3>
		<input type="number" name="cartAmount" value=<%=list.get(i).getCartAmount()%>></input>
		<input type="checkbox">
		<a href="delete.ez?productNo="<%=pDto.getProductNo() %>>삭제하기</a>
	</div>
<%} %>
	<input type="submit" value="구매하기">
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>