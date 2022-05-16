
<%@page import="semi2.beans.BuyDto"%>
<%@page import="semi2.beans.BuyDao"%>
<title>이지어트</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int buyNo = Integer.parseInt(request.getParameter("buyNo"));

	BuyDao buyDao = new BuyDao();
	BuyDto buyDto = buyDao.selectOne(buyNo);
%>
<head>
<style>
	th {
	font-weight : 600;
	}	
</style>
</head>
	<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container w500 m30">
<h1>송장번호 입력</h1><br><br>
<form action = "buy_update.ez" method="post">
    <table class="table table-border table-hover">
	    <tr>
	    		<th>구매번호</th>
	    		<td><input type="text" name="buyNo" value="<%=buyDto.getBuyNo()%>" class="form-input fill input-round" required></td>
	     <tr>
	    		<th>회원아이디</th>
	    		<td><input type="text" name="memberId" value="<%=buyDto.getMemberId()%>" class="form-input fill input-round" required></td>
	    </tr>
	    <tr>
	    		<th>주문번호</th>
	    		<td><input type="text" name="orderNo" value="<%=buyDto.getOrderNo()%>" class="form-input fill input-round" required></td>
	    </tr>
	    <tr>
	    		<th>송장번호</th>
	    		<td>
	    		<input type="text" name="buyInvoice" class="form-input fill input-round" value="<%=buyDto.getBuyInvoice()%>">
	    		</td>
	    </tr>	    
		 <tr>
	    		<th>배송상태</th>
	    		<td><input type="text" name="buyStatus" value="<%=buyDto.getBuyStatus()%>" class="form-input fill input-round" required></td>
	    </tr>
	</table>
	    <div class="container w300">
	    	<br><br><br><input type="submit" value="확인" class="btn btn-primary fill">
	    </div>

</form>
</div>
<br><br><br>
<jsp:include page="/template/footer.jsp"></jsp:include>