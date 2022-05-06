<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.CartDto"%>
<%@page import="semi2.beans.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memberId = (String)session.getAttribute("member");

	CartDao cDao = new CartDao();
	ProductDao pDao = new ProductDao();
	
	List<CartDto> list = cDao.selectAll("testuser2");

%>    
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="http://localhost:8080/semi2/order/order.ez" method="post">
<%
	for(int i =0; i<list.size(); i++) {
		CartDto cDto = list.get(i);
		int pNo = cDto.getProductNo();
		ProductDto pDto = pDao.selectOne(pNo);
		int price = pDto.getProductPrice();
		int amount = cDto.getCartAmount();
		int total = price*amount;
%>
	<a href="detail.jsp?productNo=<%=pNo%>"><%=pDto.getProductName() %></a>
	<br><br>
	<%=price %>
	<input type="hidden" name="productNo" value="<%=pNo %>">
	<input type="number" name="cartAmount" value="<%=amount %>"/>
	<input type="text" readonly name="orderPrice" value="<%=total%>"/>
	<input type="checkbox">
	<a href="delete.ez?productNo=<%=pNo %>">삭제하기</a>
	
	<br><br>
<%} %>
	<input type="submit" value="구매하기">
</form>
	


<jsp:include page="/template/footer.jsp"></jsp:include>