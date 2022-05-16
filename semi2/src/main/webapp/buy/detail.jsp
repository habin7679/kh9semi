<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@page import="semi2.beans.BuyDto"%>
<%@page import="semi2.beans.BuyDao"%>
<%@page import="java.sql.Date"%>
<%@page import="semi2.beans.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.OrderDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.PayingDto"%>
<%@page import="semi2.beans.PayingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("member");
	int bNo = Integer.parseInt(request.getParameter("buyNo"));
	BuyDao bDao = new BuyDao();
	BuyDto bDto = bDao.selectOne(bNo);
	
	PayingDao payingDao = new PayingDao();
	PayingDto payingDto = payingDao.selectOne(bDto.getOrderNo());
	ProductDao productDao = new ProductDao();
	ProductAttachmentDao paDao = new ProductAttachmentDao();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<table class="table table-border layer-3 container">
	<tr>
		<th>주문일시</th>
		<td><%=payingDto.getPayingDate() %></td>
		</tr>
		<tr>
		<th>수령인</th>
		<td><%=payingDto.getPayingName() %></td>
		</tr>
		<tr>
		<th>연락처</th>
		<td><%=payingDto.getPayingPhone() %></td>
		</tr>
		<tr>
		<th>우편번호</th>
		<td><%=payingDto.getPayingPost() %></td>
		</tr>
		<tr>
		<th>기본주소</th>
		<td><%=payingDto.getPayingBasicAddress() %></td>
		</tr>
		<tr>
		<th>상세주소</th>
		<td><%=payingDto.getPayingDetailAddress() %></td>
		</tr>
		<tr>
		<th>배송희망일</th>
		<td><%=payingDto.getPayingDeliveryDate() %></td>
		</tr>
		<tr>
		<th>배송희망시간(0~23)</th>
		<td><%=payingDto.getPayingDeliveryTime()%>시</td>
		</tr>
		<tr>
		<th>현재 배송상태</th>
		<td><%=bDto.getBuyStatus() %></td>
		</tr>
		<tr>
		<th>운송장번호</th>
		<td><%=bDto.getBuyInvoice() %></td>
		</tr>
</table>

	<table class="table table-border layer-2 container">
		<tr>
			<th>제품사진</th>
			<th>제품명</th>
			<th>수량</th>
			<th>제품 리뷰</th>
		</tr>
<% 
	OrderDao oDao = new OrderDao();
	List<OrderDto> list = oDao.selectAll(bDto.getOrderNo());
	
	for(int i =0; i<list.size(); i++){
		
		OrderDto oDto = list.get(i);
		int pNo = oDto.getProductNo();
		int oNo = oDto.getOrderNo();
		ProductDto productDto = productDao.selectOne(pNo);
		ProductAttachmentDto paDto = paDao.selectOne(pNo);
%>

	<tr>
		<td>
			<img src="/semi2/file/download.ez?attachmentNo=<%=paDto.getAttachmentNo()%>" width="50" height="50">
		</td>
		<td><%=productDto.getProductName() %></td>
		<td><%=oDto.getOrderCount() %></td>
	<%if(bDto.getBuyStatus().equals("배송완료")){
			if(oDto.getOrderReview().equals("x")) {%>
				<td>
				<form action="<%=request.getContextPath()%>/board/write_review.jsp" method="post">
					<input type="hidden" name="productNo" value="<%=pNo %>">
					<input type="hidden" name="orderNo" value="<%=oNo %>">
					<input type="submit" value="리뷰 작성하기" class="btn">
				</form>
				</td>
			<%}else {%>
				<td>리뷰 작성완료</td>
			<%} %>
	<%} else { %>
			<td>리뷰 작성불가</td>
	<%} %>		
	</tr>
<%}%>
	</table>
	<br><BR>
	<a href="<%=request.getContextPath() %>/index.jsp" class="btn">홈 화면으로 이동</a>
	<a href="<%=request.getContextPath() %>/buy/list.jsp" class="btn">구매 리스트로 이동</a>
	<br><BR>
<jsp:include page="/template/footer.jsp"/>