<%@page import="java.text.DecimalFormat"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
request.setCharacterEncoding("UTF-8");

String productName = request.getParameter("product_name");
String productSort = request.getParameter("product_sort");
%>

<%
boolean isSearch = productName != null && !productName.trim().equals("");
ProductDao productDao = new ProductDao();
ProductDto productDto = new ProductDto();



List<ProductDto> list;
if(isSearch)
	list = productDao.listUser(productName);
else
	list = productDao.listAll();

%>
<style>


    .float-container {}
    .float-container > .float-left {
        float:left;
    }
    .float-container > .float-right {
        float:right;
    }

   
    .float-container::after {
        content:"";
        display: block;
        clear:both;
    }

    .layer-1 {
        width:100%;
    }
    .layer-2 {
        width:50%;
    }
    .layer-6{
        width:33.3333%;
      
    }
    .layer-4 {
        width:25%;
    }
    .layer-5 {
        width:20%;
    }
	.hoho{
		width:260px;
	}
	
</style>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container w1000 m30">
    <div class="row center">
        <h1><%=productSort%></h1><br>
        </div>
  <div class="row center ">
<!-- 검색창 -->
            <form action="product_user_list.jsp" >
            <%if(productName == null){ %>
            <input type="text" name="product_name" required class="form-input input-round hoho"  >
            <%} else { %>
            <input type="text" name="product_name" required placeholder="검색어 작성" value="<%=productName%>" class="form-input input-round">
            <%} %>
            <input type="submit" value="검색" class="btn btn-primary">
        </form>
    </div><br>

<!-- 헤더 눌렀을 때 -->
<%if(productName == null){
List<ProductDto>  list2 = productDao.categorie(productSort);
%>
    <div class="row float-container">
    <%for (int i = 0; i < list2.size(); i ++) {
        productDto = list2.get(i);
        int productNo = productDto.getProductNo();
        ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
        ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(productNo);
    %>
        <div class="float-left layer-6">
        <%if(i % 3 == 0){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                <%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-6">
        <%if(i % 3 == 1){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                <%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-6">
        <%if(i % 3 == 2){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                <%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
            </div>
            <%} %>
    </div>



<%} else {
if (list.isEmpty()) {
%>
<div class="row center">
<h2>결과가 존재하지 않습니다</h2>
</div>
<%
} else {
%>
<div class="row float-container">
    <%for (int i = 0; i < list.size(); i ++) {
        productDto = list.get(i);
        int productNo = productDto.getProductNo();
        ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
        ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(productNo);
    %>
        <div class="float-left layer-6">
        <%if(i % 3 == 0){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                
               	<%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-6">
        <%if(i % 3 == 1){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                
               	<%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-6">
        <%if(i % 3 == 2){%>
            <<div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                
               	<%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <%} %>
  </div>
<%
}}
%>
</div>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>




