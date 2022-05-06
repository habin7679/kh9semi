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
<%
	for(int i =0; i<list.size(); i++){
		BuyDto bDto = list.get(i);
		int oNo = bDto.getOrderNo();
		PayingDto payingDto = payingDao.selectOne(oNo);
%>
<a href="detail.jsp?orderNo=<%=oNo%>"><%=payingDto.getPayingDate() %> 주문</a><br><br>
송장번호: <%if(bDto.getBuyInvoice()==0){%>상품준비중<% }else{%><%=bDto.getBuyInvoice()%><%}%><br><br>
주문현황: <%=bDto.getBuyStatus() %><br><br>
<%if(bDto.getBuyStatus().equals("입금전")||bDto.getBuyStatus().equals("결제완료")) {%>
<a href="cancel.ez?buyNo=<%=bDto.getBuyNo() %>">취소하기</a>
<%} %>
<hr>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>