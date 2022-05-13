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
<h1>상품 정보 수정</h1>

<form action="edit.ez" method="post" enctype="multipart/form-data">
<input type="hidden" name="productNo" value="<%=productDto.getProductNo()%>">
<table>
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="productName" value="<%=productDto.getProductName()%>">
		</td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
			<select name="productSort">
				<option <%if(productDto.getProductSort().equals("정기배송")){%>selected<%} %>>정기배송</option>
				<option <%if(productDto.getProductSort().equals("닭가슴살")){%>selected<%} %>>닭가슴살</option>
				<option <%if(productDto.getProductSort().equals("샐러드")){%>selected<%} %>>샐러드</option>
				<option <%if(productDto.getProductSort().equals("소고기")){%>selected<%} %>>소고기</option>
				<option <%if(productDto.getProductSort().equals("간식")){%>selected<%} %>>간식</option>
				<option <%if(productDto.getProductSort().equals("도시락")){%>selected<%} %>>도시락</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>가격</th>
		<td>
			<input type="text" name="productPrice" value="<%=productDto.getProductPrice()%>">
		</td>
	</tr>
	<tr>
		<th>재고</th>
		<td>
			<input type="text" name="productStock" value="<%=productDto.getProductStock()%>">
		</td>
	</tr>
	<tr>
		<th>제조사</th>
		<td>
			<input type="text" name="productCompany" value="<%=productDto.getProductPrice()%>">
		</td>
	</tr>
	<tr>
		<th>제조일</th>
		<td>
			<input type="date" name="productMade" value="<%=productDto.getProductMade()%>">
		</td>
	</tr>
	<tr>
		<th>폐기일</th>
		<td>
			<input type="date" name="productExpire" value="<%=productDto.getProductExpire()%>">
		</td>
	</tr>
		<tr>
		<th>행사여부</th>
		<td>
			<input type="text" name="productEvent" value="<%=productDto.getProductEvent()%>">
		</td>
	</tr>
		<tr>
		<th>칼로리</th>
		<td>
			<input type="text" name="productKcal" value="<%=productDto.getProductKcal()%>">
		</td>
	</tr>
		<tr>
		<th>단백질</th>
		<td>
			<input type="text" name="productProtein" value="<%=productDto.getProductProtein()%>">
		</td>
	</tr>
		<tr>
		<th>탄수화물</th>
		<td>
			<input type="text" name="productCarbohydrate" value="<%=productDto.getProductCarbohydrate()%>">
		</td>
	</tr>
		<tr>
		<th>지방</th>
		<td>
			<input type="text" name="productFat" value="<%=productDto.getProductFat()%>">
		</td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<input type="submit" value="수정하기">
		</td>
	</tr>
</table>
</form>
		
<jsp:include page="/template/footer.jsp"></jsp:include>