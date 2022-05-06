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
	List<BuyDto> list = bDao.selectAll("testuser2");
	PayingDao payingDao = new PayingDao();
%>



<jsp:include page="/template/header.jsp"></jsp:include>
<%
	for(int i =0; i<list.size(); i++){
		BuyDto bDto = list.get(i);
		int oNo = bDto.getOrderNo();
		Date date =	payingDao.payingDate(oNo);
%>
<a href="detail.jsp?orderNo=<%=oNo%>"><%=date %>자 주문</a><br><br>
송장번호: <%if(bDto.getBuyInvoice()==0){%>상품준비중<% }else{%><%=bDto.getBuyInvoice()%><%}%><br><br>
주문현황: <%=bDto.getBuyStatus() %><br><br>
<hr>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>