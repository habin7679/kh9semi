<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	ProductDao productDao = new ProductDao();
	//String productSort = request.getParameter("productSort");
	List<ProductDto> list = productDao.listAll();
%>
<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w1000 m30">
			<div class="row center">
		<h1>상품 목록</h1>
		</div>
		<div class="row right">
		<a href="product_insert.jsp" class="link link-btn">생성</a>
		</div>
		
		<div class="row">
		<table class="table table-border table-hover" >
			<%-- <thead>
				<tr>
					<th>상품이미지</th>
					<th>제품명</th>
					<th>제품 가격</th>
					<th>평점</th>
				</tr>
			</thead>--%>
			<tbody>
				<%for(ProductDto productDto : list){ %>
				<div type = "hidden" <%=productDto.getProductNo() %>></div>
				<div>
					<a href="details.jsp" class="link">
						<%=productDto.getProductImg()%><br>
					</a>
						<%=productDto.getProductName()%><br>
						<%=productDto.getProductPrice()%><br>
					</div>
				<%}%>
			</tbody>
	</table>
	</div>
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>





