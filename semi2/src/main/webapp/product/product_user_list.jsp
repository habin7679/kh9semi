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
    /*
        다단 레이아웃(2단 이상의 가로 배치) 구현하기
        - 지금까지 구현했던 화면들은 한 줄에 1개만 나오는 경우였다
        - CSS에서 가로배치를 구현하는 방법은 3가지
            (1) float 속성 사용
            (2) flexbox layout 사용
            (3) grid layout 사용
    */

    /*
        float를 사용할 경우 디자인 상 가장 문제가되는 것은 clear를 어디서 할 것인가?
        - 즉, float는 아무데서나 쓰면 문제가 생긴다
        - 주어진 영역에서만 float를 쓰도록 영역을 하나 만든다
    */

    .float-container {}
    .float-container > .float-left {
        float:left;
    }
    .float-container > .float-right {
        float:right;
    }

    /*
        가상 선택자(pseudo selector) 
        - 존재하지 않는 영역을 선택하는 선택자
        - 대표적으로 시작지점(::before)과 종료지점(::after) 등을 사용할 수 있다
        - 애초에 존재하지 않는 공간이므로 존재하도록 만드는 후처리가 필요하다
        - content를 이용해서 글자를 입력해주고
        - display를 이용해서 배치기준을 설정해준다.
    */
    .float-container::after {
        content:"";
        display: block;
        clear:both;
    }

    /* 1단부터 5단까지 클래스를 이용해서 폭을 설정하도록 구현 */
    .layer-1 {
        width:100%;
    }
    .layer-2 {
        width:50%;
    }
    .layer-3 {
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
        <div class="float-left layer-3">
        <%if(i % 3 == 0){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                <%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-3">
        <%if(i % 3 == 1){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                <%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-3">
        <%if(i % 3 == 2){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
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


<!-- 검색했을 때-->
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
        <div class="float-left layer-3">
        <%if(i % 3 == 0){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                
               	<%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-3">
        <%if(i % 3 == 1){%>
            <div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
                <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
                <input type="hidden" name="productSort" value="<%=productDto.getProductSort() %>">
                
               	<%=productDto.getProductName()%><br>
                <%=productDto.getProductPrice()%><br><br><br>
            </a>
            </div>
        <%}%>
        </div>
        <div class="float-left layer-3">
        <%if(i % 3 == 2){%>
            <<div><a href="product_user_detail.jsp?product_no=<%=productDto.getProductNo()%>" class="link">
                <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="300" height="300"><br>
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




