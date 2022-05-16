<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("product_no"));
%>
<%-- 처리 --%>
<%
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.selectOne(no);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
      <div class="container w400 m50">
        <div class="row center">
        <h1>상품 정보 수정</h1><br><br>
        </div>
        <div class="row center">
        <form action="edit.ez" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>" >
        <div class="row">
            <label>상품 이름</label>
            <input type="text" name="productName" value="<%=productDto.getProductName()%>" class="form-input fill input-round">
        </div>
        <div class="row">
            <label>분류</label>
            <select name="productSort" class="form-input fill input-round">
               <option <%if(productDto.getProductSort().equals("정기배송")){%>selected<%} %>>정기배송</option>
                <option <%if(productDto.getProductSort().equals("닭가슴살")){%>selected<%} %>>닭가슴살</option>
                <option <%if(productDto.getProductSort().equals("샐러드")){%>selected<%} %>>샐러드</option>
                <option <%if(productDto.getProductSort().equals("소고기")){%>selected<%} %>>소고기</option>
                <option <%if(productDto.getProductSort().equals("간식")){%>selected<%} %>>간식</option>
                <option <%if(productDto.getProductSort().equals("도시락")){%>selected<%} %>>도시락</option>
            </select>
        </div>
        <div class="row">
            <label>가격</label>
            <input type="text" name="productPrice" value="<%=productDto.getProductPrice()%>" class="form-input fill input-round">
        </div>
        <div class="row ">
            <label>재고</label>
            <input type="text" name="productStock" value="<%=productDto.getProductStock()%>" class="form-input fill input-round">
        </div>
        <div class="row ">
            <label>제조사</label>
            <input type="text" name="productCompany" value="<%=productDto.getProductPrice()%>" class="form-input fill input-round">
        </div>
        <div class="row">
            <label>제조일</label>
            <input type="date" name="productMade" value="<%=productDto.getProductMade()%>" class="form-input fill input-round">
        </div>
        <div class="row">
            <label>폐기일</label>
            <input type="date" name="productExpire" value="<%=productDto.getProductExpire()%>" class="form-input fill input-round">
        </div>
        <div class="row ">
            <label>행사여부</label>
             <select name="productEvent"class="form-input fill input-round">
              <option <%if(productDto.getProductEvent().equals("0")){%>selected<%} %>>0</option>
               <option <%if(productDto.getProductEvent().equals("1")){%>selected<%} %>>1</option>
               </select>
        </div>
        </div>
        <div class="row" >
            <label>칼로리</label>
            <input type="text" name="productKcal" value="<%=productDto.getProductKcal()%>" class="form-input fill input-round">
        </div>
        <div class="row ">
            <label>단백질</label>
            <input type="text" name="productProtein" value="<%=productDto.getProductProtein()%>" class="form-input fill input-round">
        </div>
        <div class="row ">
            <label>탄수화물</label>
            <input type="text" name="productCarbohydrate" value="<%=productDto.getProductCarbohydrate()%>" class="form-input fill input-round">
        </div>
        <div class="row ">
            <label>지방</label>
            <input type="text" name="productFat" value="<%=productDto.getProductFat()%>" class="form-input fill input-round">
        </div>
        <div class="row center" colspan="2" >
      	 <a href="product_admin_detail.jsp?product_no=<%=productDto.getProductNo()%>"class ="link fill link-btn">취소</a><br><br>
			<button type="submit" class="btn btn-primary fill">수정하기</button>
		</div>
	</form>
	</div>
	</div>
		
<jsp:include page="/template/footer.jsp"></jsp:include>