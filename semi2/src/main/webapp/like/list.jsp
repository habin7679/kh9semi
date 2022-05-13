<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
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
	ProductAttachmentDao paDao = new ProductAttachmentDao();
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>


    <div class="row float-container">
<%for(int i =0; i<list.size(); i++) {
		int productNo = list.get(i).getProductNo();
		ProductDto pDto = productDao.selectOneCart(productNo);
		ProductAttachmentDto paDto = paDao.selectOne(productNo);
		
%>

    <div class="float-left layer-3">
			<img src="/semi2/file/download.ez?attachmentNo=<%=paDto.getAttachmentNo()%>" width="200" height="200"><br>
			<a href="<%=request.getContextPath()%>/product/product_user_detail.jsp?product_no=<%=productNo%>"><%=pDto.getProductName() %></a><br>
			<input type="hidden" name="productNo" value="<%=productNo%>"><br>
			<h4><%=pDto.getProductPrice() %></h4><br>
			<a href="<%=request.getContextPath() %>/like/delete.ez?productNo=<%=productNo %>" class="btn">삭제하기</a><br><br><br>
			<a href="<%=request.getContextPath()%>/cart/insert.ez?productNo=<%=productNo %>" class="btn">장바구니에 추가하기</a><br><br><br>
		</div>
<%} %>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>