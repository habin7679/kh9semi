<%@page import="java.util.Collections"%>
<%@page import="semi2.beans.PayingDto"%>
<%@page import="java.sql.Date"%>
<%@page import="semi2.beans.PayingDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi2.beans.BuyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("member");
	BuyDao bDao = new BuyDao();
	List<BuyDto> list = bDao.selectAll(memberId);
	PayingDao payingDao = new PayingDao();
%>



<jsp:include page="/template/header.jsp"></jsp:include>

<table class="table table-border layer-3 container">
	<tr>
		<th>주문 일시</th>
		<th>주문 현황</th>
		<th>운송장번호</th>
		<th>구매 취소</th>
	</tr>

<%
	for(int i =0; i<list.size(); i++){
		BuyDto bDto = list.get(i);
		int oNo = bDto.getOrderNo();
		PayingDto payingDto = payingDao.selectOneDate(oNo);
%>
<tr>
	<td>
		<a href="detail.jsp?buyNo=<%=bDto.getBuyNo()%>"><%=payingDto.getPayingDate() %>주문</a>	
	</td>
	<td>
		<%=bDto.getBuyStatus() %>
	</td>
	<td>
		<%if(bDto.getBuyInvoice()==0){%>상품준비중<% }else{%><%=bDto.getBuyInvoice()%><%}%>	
	</td>
	<td>
		<%if(bDto.getBuyStatus().equals("입금전")||bDto.getBuyStatus().equals("결제완료")) {%>
			<a href="cancel.ez?buyNo=<%=bDto.getBuyNo() %>">취소하기</a>
		<%} else{%>
			취소 불가
		<%} %>
	</td>
</tr>

<%} %>
	</table>

<jsp:include page="/template/footer.jsp"></jsp:include>