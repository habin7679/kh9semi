<%@page import="semi2.beans.PayingDto"%>
<%@page import="semi2.beans.PayingDao"%>
<%@page import="semi2.beans.BuyDto"%>
<%@page import="semi2.beans.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	
	PayingDao payingDao = new PayingDao();
	PayingDto payingDto = payingDao.selectOneForAdmin(orderNo);
%>


<title>이지어트</title>
	<div class="row center"><br><br>
	<%if(payingDto == null){ %>
		 <h1>존재하지 않는 배송내역입니다!</h1>
		 </div>
	<%} else { %>
	<div class="container center w500 m30">
		<div class="row right">
			<h1>주문 내역 상세</h1><br><br>
		</div>
		<table class="table table-border table-hover">
		<tr>
			<th>구매번호</th>
			<td><%=payingDto.getOrderNo()%></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=payingDto.getMemberId()%></td>
		</tr>
		<tr>
			<th>총구매금액</th>
			<td><%=payingDto.getPayingTotal()%></td>
		</tr>
		<tr>
			<th>주문일시</th>
			<td><%=payingDto.getPayingDate()%></td>
		</tr>	
		<tr>
			<th>수령인</th>
			<td><%=payingDto.getPayingName()%></td>
		</tr>	
		<tr>
			<th>연락처</th>
			<td><%=payingDto.getPayingPhone()%></td>
		</tr>	
		<tr>
			<th>우편번호</th>
			<td><%=payingDto.getPayingPost()%></td>
		</tr>	
		<tr>
			<th>주소</th>
			<td><%=payingDto.getPayingBasicAddress()%></td>
		</tr>	
		<tr>
			<th>상세주소</th>
			<td><%=payingDto.getPayingDetailAddress()%></td>
		</tr>	
		<tr>
			<th>배송비</th>
			<td><%=payingDto.getPayingDeliveryFee()%></td>
		</tr>	
		<tr>
			<th>배송일자</th>
			<td><%=payingDto.getPayingDeliveryDate()%></td>
		</tr>
		<tr>
		<th>배송시간</th>
			<td><%=payingDto.getPayingDeliveryTime()%></td>
		</tr>	
		<tr>
		<th>결제방법</th>
			<td><%=payingDto.getPayingPayway()%></td>
		</tr>	
		
	</table>
	<%} %>
<br><br><br>
	<div class="container w300">
	<a href="order_list.jsp" class ="link link-btn fill" >목록</a><br><br>
	</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>