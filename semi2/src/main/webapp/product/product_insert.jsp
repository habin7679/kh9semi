<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

 <div class="container w400 m50">
	<div class="row center">
	<h1>상품 정보 입력</h1><br>
	</div>
	<div class="row center">
	<form action="add.ez" method="post"  enctype="multipart/form-data">
		<div class="row">
			<label>상품 이름</label>
			<input type="text" name="productName" required class="form-input fill input-round" >
		</div>
		<div class="row">	
			<label>상품 분류</label>
			<select name="productSort" required  class="form-input fill input-round">
				<option value="">선택하세요</option>
				<option>닭가슴살</option>
				<option>샐러드</option>
				<option>소고기</option>	
				<option>간식</option>		
				<option>도시락</option>							
			</select>
		</div>		
		<div class="row">	
			<label>상품 가격</label>
			<input type="number" name="productPrice" required min="0" step="100" class="form-input fill input-round">
		</div>
		<div class="row">	
			<label>재고</label>
			<input type="number" name="productStock" required  min="0" step="1" class="form-input fill input-round">
		</div>
		<div class="row">
			<label>제조사</label>
			<input type="text" name="productCompany" required class="form-input fill input-round">
		</div>
		<div class="row">
			<label>제조일</label>
			<input type="date" name="productMade" required class="form-input fill input-round">
		</div>	
		<div class="row">
			<label>폐기일</label>
			<input type="date" name="productExpire" required class="form-input fill input-round">
		</div>		
		<div class="row">
			<label>행사여부</label>
			<select name="productEvent" required class="form-input fill input-round">
				<option value="">선택하세요</option>
				<option>0</option>
				<option>1</option>
			</select>
		</div>
		<div class="row">
			<label>칼로리</label>
			<input type="number" name="productKcal" required class="form-input fill input-round">
		</div>
		<div class="row">
			<label>단백질 함량</label>
			<input type="number" name="productProtein" required class="form-input fill input-round">
		</div>	
		<div class="row">
			<label>탄수화물 함량</label>
			<input type="number" name="productCarbohydrate" required class="form-input fill input-round">
		</div>	
		<div class="row">
			<label>지방함량</label>
			<input type="number" name="productFat" required class="form-input fill input-round">
		</div>
		<div class="row">
			<label>상품정보</label>
			<input type="file" name="productInfo" class=" fill ">
		</div>
		<div class="row">
			<label>상품이미지</label>
			<input type="file" name="productImg" class=" fill ">
		</div>
		<div class="row center" >
			<a href="product_admin_list.jsp" class="link link-btn fill">목록</a><br>
		</div>
		<div class="row center" >
			<button type="submit" class="btn btn-primary fill">추가</button>
		</div>
	</form>
	</div>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>