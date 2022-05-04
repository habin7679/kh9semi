<%@page import="semi2.beans.OrderDao"%>
<%@page import="semi2.beans.PayingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("login");
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	OrderDao oDao = new OrderDao();
	int totalPrice = oDao.totalPrice(orderNo);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<form action="insert.ez" method="post">
		<div>
			<input type="hidden" name="orderNo" value="<%=orderNo%>">
			<input type="text" name="totalPrice" value="<%=totalPrice %>">
			
			
		
		</div>
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>