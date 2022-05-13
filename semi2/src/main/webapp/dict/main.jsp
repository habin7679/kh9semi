<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="cal.ez" >
	<div class="container w500 m30">
		<h1>칼로리 처방</h1>
		<div class="row">
			성별<select name="gender" class="form-input fill">
				<option value="">선택</option>
				<option>남자</option>
				<option>여자</option>
			</select>
		</div>
		
		<div class="row">
			나이<input type="text" name="age" class="form-input fill" placeholder="나이를 입력하세요" autocomplete="off">
		</div>
		
		<div class="row">
			키<input type="text" name="height" class="form-input fill" placeholder="키를 입력하세요" autocomplete="off">
		</div>
		
		<div class="row">
			몸무게<input type="text" name="weight" class="form-input fill" placeholder="몸무게를 입력하세요" autocomplete="off">
		</div>
		
		<div class="row">
			주당 운동횟수<select name="count" class="form-input fill">
				<option>0</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>회
		</div>
		
		<div class="row">
			<input type="submit" value="제출하기" class="btn btn-primary fill">
		</div>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>