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
	//List<BuyDto> list = bDao.selectAll(memberId);
	PayingDao payingDao = new PayingDao();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
 
<%
		int p;
		try {
			p = Integer.parseInt(request.getParameter("p"));
			if(p <= 0)	throw new Exception();
		}
		catch(Exception e){
			p = 1;
		}
	
	int s;
		try {
			s = Integer.parseInt(request.getParameter("s"));
			if(s <= 0) throw new Exception();
		}
		catch(Exception e){
			s = 10;
		}
	%>
	<%
		BuyDao buyDao = new BuyDao();
		List<BuyDto> list2;

			list2 = buyDao.listAllByPagingId(p, s, memberId);
	%>
	<%
		int count;
		count = buyDao.countByPaging();
		
		int lastPage = (count + s - 1) / s;
		
		int blockSize = 10;
		
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		
		if(endBlock > lastPage){
			endBlock = lastPage;
		}
	%>
<div class="row float-container">
<div class="float-left layer-3">
<jsp:include page="/template/menu.jsp"></jsp:include>
</div>


<table class="table table-border layer-2">
	<tr>
		<th>주문 일시</th>
		<th>주문 현황</th>
		<th>운송장번호</th>
		<th>구매 취소</th>
	</tr>

<%
	for(int i =0; i<list2.size(); i++){
		BuyDto bDto = list2.get(i);
		int oNo = bDto.getOrderNo();
		PayingDto payingDto = payingDao.selectOneDate(oNo);
%>
<tr>
	<td>
		<a href="detail.jsp?buyNo=<%=bDto.getBuyNo()%>"><%=payingDto.getPayingDate() %></a>	
	</td>
	<td>
		<%=bDto.getBuyStatus() %>
	</td>
	<td>
		<%if(bDto.getBuyInvoice()==0){%>상품준비중<% }else{%><%=bDto.getBuyInvoice()%><%}%>	
	</td>
	<td>
		<%if(bDto.getBuyStatus().equals("입금전")||bDto.getBuyStatus().equals("결제완료")) {%>
			<a href="cancel.ez?buyNo=<%=bDto.getBuyNo()%>" class="btn">취소하기</a>
		<%} else{%>
			취소 불가
		<%} %>
	</td>
</tr>

<%} %>
	</table>
	<div class="row center pagination">
		<%if(p > 1){ %>
			<a href="list.jsp?p=1&s=<%=s%>">&laquo;</a>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
		<%} %>
		
		<%for(int i=startBlock; i <= endBlock; i++){ %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
		<%} %>
		
		<%if(endBlock < lastPage){ %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
		<%} %>
		
		<%if(p < lastPage){ %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
		<%} %>
		
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>