<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.LikeDao"%>
<%@page import="semi2.beans.LikeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String memberId = (String)session.getAttribute("member");
	LikeDto likeDto = new LikeDto();
	LikeDao likeDao = new LikeDao();
	
	List<LikeDto> list = likeDao.selectAll(memberId);
	
	ProductDao productDao = new ProductDao();
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>


<%for(int i =0; i<list.size(); i++) {
		int productNo = list.get(i).getProductNo();
		ProductDto pDto = productDao.selectOne(productNo);
%>
	<form action="delete.ez" method="post">
		<div class="container">
			<img src="<%=request.getContextPath()%>/image/product<%=productNo %>.jpg" width="200" height="200"><br><br>
			<a href="detail.jsp?productNo=<%=productNo%>"><%=pDto.getProductName() %></a>
			<input type="hidden" name="productNo" value="<%=pDto.getProductNo() %>">
			<h4><%=pDto.getProductPrice() %></h4>		
			<input type="submit" value="삭제하기">
			<a href="<%=request.getContextPath()%>/cart/insert.ez?productNo=<%=productNo %>">장바구니에 추가하기</a>
		</div>
	</form>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>