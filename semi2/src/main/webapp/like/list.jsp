<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.LikeDao"%>
<%@page import="semi2.beans.LikeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	LikeDto likeDto = new LikeDto();
	LikeDao likeDao = new LikeDao();
	
	
	List<LikeDto> list = likeDao.selectAll("testuser2");
	
	ProductDao productDao = new ProductDao();
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>


<%for(int i =0; i<list.size(); i++) {
		int productNo = list.get(i).getProductNo();
		System.out.println(productNo);
		ProductDto productDto = productDao.selectOne(productNo);
%>

		<div>
			<label><%=productDto.getProductName()%></label>
			<h4><%=productDto.getProductPrice() %></h4>
			
		</div>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>