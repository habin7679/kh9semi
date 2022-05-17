<%@page import="semi2.beans.InfoAttachmentDto"%>
<%@page import="semi2.beans.InfoAttachmentDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	int productNo = Integer.parseInt(request.getParameter("product_no"));
%>

<%-- 처리 --%>    
<%
ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(productNo);
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.selectOne(productNo);
	InfoAttachmentDao infoattachmentDao = new InfoAttachmentDao();
	InfoAttachmentDto infoattachmentDto = infoattachmentDao.selectOne(productNo);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
		
<%if(productDto == null){ %>
<h1>해당 상품은 존재하지 않습니다</h1>
<%} else { %>
<div class="container w800 m30">
<div class="row">
<h1>상품 상세정보</h1><br><br>
</div>


    <table class="table table-border table-hover">
        <tr class="w300 m30">
            <th>상품번호</th>
                <td><%=productDto.getProductNo()%></td>
        </tr>    
        <tr>
            <th class="w200 m30">이름</th>
                <td><%=productDto.getProductName()%></td>
        </tr>
        <tr>
            <th>분류</th>
                <td><%=productDto.getProductSort()%></td>
        </tr>
        <tr>
            <th>가격</th>
                <td><%=productDto.getProductPrice()%></td>
        </tr>
        <tr>
            <th>재고</th>
                <td><%=productDto.getProductStock()%></td>
        </tr>
        <tr>
            <th>제조사</th>
                <td><%=productDto.getProductCompany()%></td>
        </tr>
        <tr>
            <th>제조일</th>
                <td><%=productDto.getProductMade()%></td>
        </tr>
        <tr>
            <th>폐기일</th>
                <td><%=productDto.getProductExpire()%></td>
        </tr>
        <tr>
            <th>행사여부</th>
                <td><%=productDto.getProductEvent()%></td>
        </tr>
        <tr>
            <th>칼로리</th>
                <td><%=productDto.getProductKcal()%></td>
        </tr>
        <tr>
            <th>단백질</th>
                <td><%=productDto.getProductProtein()%></td>
        </tr>
        <tr>
            <th>탄수화물</th>
                <td><%=productDto.getProductCarbohydrate()%></td>
        </tr>
        <tr>
            <th>지방</th>
                <td><%=productDto.getProductFat()%></td>
        </tr>
        <tr>
            <th>상품정보</th>
                <td><img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=infoattachmentDto.getAttachmentNo()%>"width="400" height="1500"></td>
        </tr>
         <tr>
            <th>상품이미지</th>
                <td> <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>" width="200" height="200"></td>
        </tr> 
    </table>

<%} %>
<br><br><br>
	<div class="container w300">
		<a href="product_admin_list.jsp" class ="link link-btn fill">목록</a><br><br>
		<a href="product_edit.jsp?product_no=<%=productDto.getProductNo()%>" class ="link link-btn-green fill">상품 수정</a><br><br>
		<a href="delete.ez?product_no=<%=productDto.getProductNo()%>" class ="link link-btn-green fill">상품 삭제</a><br>
	</div>
</div>		
<jsp:include page="/template/footer.jsp"></jsp:include>