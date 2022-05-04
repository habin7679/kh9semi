<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>상품 정보 입력</h1>

<form action="add.ez" method="post">
	<table>
		<tr>
			<th>상품이름</th>
			<td>
				<input type="text" name="productName" required>
			</td>
		</tr>
		<tr>
			<th>분류</th>
			<td>
				<select name="productSort" required>
					<option value="">선택하세요</option>
					<option>정기배송</option>
					<option>닭가슴살</option>
					<option>샐러드</option>
					<option>소고기</option>	
					<option>간식</option>		
					<option>도시락</option>							
				</select>
			</td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td>
				<input type="number" name="productPrice" required min="0" step="100">
			</td>
		</tr>
		<tr>
			<th>재고</th>
			<td>
				<input type="number" name="productStock" required  min="0" step="1">
			</td>
		</tr>
		<tr>
			<th>제조사</th>
			<td>
				<input type="text" name="productCompany" required>
			</td>
		</tr>
		<tr>
			<th>제조일</th>
			<td>
				<input type="date" name="productMade" required>
			</td>
		</tr>
		<tr>
			<th>폐기일</th>
			<td>
				<input type="date" name="productExpire" required>
			</td>
		</tr>
		<tr>
			<th>행사여부</th>
			<td>
				<select name="productEvent" required>
				<option value="">선택하세요</option>
				<option>0</option>
				<option>1</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>칼로리</th>
			<td>
				<input type="number" name="productKcal" required>
			</td>
		</tr>
		<tr>
			<th>단백질 함량</th>
			<td>
				<input type="number" name="productProtein" required>
			</td>
		</tr>
		<tr>
			<th>탄수화물 함량</th>
			<td>
				<input type="number" name="productCarbohydrate" required>
			</td>
		</tr>
		<tr>
			<th>지방함량</th>
			<td>
				<input type="number" name="productFat" required>
			</td>
		</tr>
		<tr>
			<th>상품정보</th>
			<td>
			<textarea name="productInfo" required></textarea>
			</td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td>
				<input type="text" name="productImg">
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="등록">
			</td>
		</tr>
	</table>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>