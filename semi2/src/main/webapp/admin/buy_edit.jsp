
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

<h1> 주문정보 업데이트 </h1>
<form action = "buy_edit.ez" method="post">
	
	    <div>
	    		<label>구매번호</label>
	    		<input type="text" name="buyNo"  value="<%=buyDto.getBuyNo()%>" required readonly>
	    </div>
	     <div>
	    		<label>회원아이디</label>
	    		<input type="text" name="memberId"  value="<%=buyDto.getMemberId()%>" required readonly>
	    </div>
	    <div>
	    		<label>주문번호</label>
	    		<input type="text" name="orderNo"  value="<%=buyDto.getOrderNo()%>" required readonly>
	    </div>
	    <div>
	    		<label>송장번호</label>
	    		<input type="text" name="buyInvoice"  value="<%=buyDto.getBuyInvoice()%>" required>
	    </div>	    
		 <div>
	    		<label>배송상태</label>
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
	    			
	    </div>
	    
	    		<input type="submit" value="확인" class="btn btn-primary">
  
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>