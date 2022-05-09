<%@page import="semi2.beans.BuyDto"%>
<%@page import="semi2.beans.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int buyNo = Integer.parseInt(request.getParameter("buyNo"));
	
	BuyDao buyDao = new BuyDao();
	BuyDto buyDto = buyDao.selectOne(buyNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<title>이지어트</title>
	<%if(buyDto == null){ %>
		 <h1>존재하지 않는 주문내역입니다!</h1>
	<%} else { %>
		<h1>주문 내역 상세</h1>
	
		<table border="1">
		<tr>
			<th>구매번호</th>
			<td><%=buyDto.getBuyNo()%></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=buyDto.getMemberId()%></td>
		</tr>
		<tr>
			<th>주문번호</th>
			<td><%=buyDto.getOrderNo()%></td>
		</tr>
		<tr>
			<th>송장번호</th>
			<td><%=buyDto.getBuyInvoice()%></td>
		</tr>	
		<tr>
			<th>배송상태</th>
			<td><%=buyDto.getBuyStatus()%></td>
		</tr>	
	</table>
	<%} %>
	
	<h2><a href="buy_update.jsp?buyNo=<%=buyDto.getBuyNo()%>">주문수정</a></h2>
	<h2><a href="buy_list.jsp">주문목록</a></h2>	
	<h2><a href="buy_cancel.ez?buyNo=<%=buyDto.getBuyNo()%>">주문취소</a></h2>
	<h2><a href="buy_delete.ez?buyNo=<%=buyDto.getBuyNo()%>">주문삭제</a></h2>
			
	<jsp:include page="/template/footer.jsp"></jsp:include>