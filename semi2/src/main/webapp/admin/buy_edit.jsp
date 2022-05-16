
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

<jsp:include page="/template/header.jsp"></jsp:include>

<h1>주문정보 업데이트</h1><br><br>
<div class="container w500">
<form action = "buy_edit.ez" method="post">
		 <table class="table table-border table-hover">
        <tr class="w300 m30">
	    		<th>구매번호</th>
	    		<td>
	    		<input type="text" name="buyNo" value="<%=buyDto.getBuyNo()%>" class="form-input fill input-round" required></td>
		 </tr>
		 <tr>
	    		<th>회원아이디</th>
	    		<td>
	    		<input type="text" name="memberId" value="<%=buyDto.getMemberId()%>" class="form-input fill input-round" required></td>
	    </tr>
	    <tr>
	    		<th>주문번호</th>
	    		<td>
	    		<input type="text" name="orderNo" value="<%=buyDto.getOrderNo()%>" class="form-input fill input-round" required></td>
	    </tr>
	    <tr>
	    		<th>송장번호</th>
	    		<td><input type="text" name="buyInvoice" value="<%=buyDto.getBuyInvoice()%>" class="form-input fill input-round" required></td>
	    </tr>	    
		 <tr>
	    		<th>배송상태</th>
	    		<td>
	    		<select name="buyStatus" required>
	    			<%if(buyDto.getBuyStatus().equals("결제완료")){ %>
					<option selected>결제완료</option>
					<%}else{ %>
					<option>결제완료</option>
					<%} %>
					
					<%if(buyDto.getBuyStatus().equals("배송중")){ %>
					<option selected>배송중</option>
					<%}else{ %>
					<option>배송중</option>
					<%} %>
					
					<%if(buyDto.getBuyStatus().equals("배송완료")){ %>
					<option selected>배송완료</option>
					<%}else{ %>
					<option>배송완료</option>
					<%} %>
					
					<%if(buyDto.getBuyStatus().equals("취소완료")){ %>
					<option selected>취소완료</option>
					<%}else{ %>
					<option>취소완료</option>
					<%} %>
	    			</select>
	    			</td>
	    </tr>
	    </table>
	    		<br><br><input type="submit" value="확인" class="btn btn-primary"><br><br><br><br>
  
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>