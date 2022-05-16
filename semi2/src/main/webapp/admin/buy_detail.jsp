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
	<div class="row center"><br><br>
	<%if(buyDto == null){ %>
		 <h1>존재하지 않는 주문내역입니다!</h1>
		 </div>
	<%} else { %>
	<div class="container center w500 m30">
		<div class="row right">
			<h1>주문 내역 상세</h1><br><br>
		</div>
		<table class="table table-border table-hover">
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
<br><br><br>
	<div class="container w300">
	<a href="buy_list.jsp" class ="link link-btn fill" >목록</a><br><br>
	<a href="buy_delete.ez?buyNo=<%=buyDto.getBuyNo()%>" class ="link link-btn fill">주문삭제</a><br><br>
	<a href="buy_update.jsp?buyNo=<%=buyDto.getBuyNo()%>" class ="link link-btn-green fill">송장번호입력</a><br><br>
	<a href="buy_edit.jsp?buyNo=<%=buyDto.getBuyNo()%>" class ="link link-btn-green fill">배송상태변경</a><br><br>
	</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>