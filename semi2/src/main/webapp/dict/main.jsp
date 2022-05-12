<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="cal.ez" >
	<div>
		<div>
			<select name="gender">
				<option value="">선택</option>
				<option>남자</option>
				<option>여자</option>
			</select>
		</div>
		
		<div>
			나이<input type="text" name="age">
		</div>
		
		<div>
			키<input type="text" name="height">
		</div>
		
		<div>
			몸무게<input type="text" name="weight">
		</div>
		
		<div>
			주당 운동횟수<select name="count">
				<option>0</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>회
		</div>
		
		<div>
			<input type="submit" value="제출하기">
		</div>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>