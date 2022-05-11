<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<h1>비밀</h1>
	
	<form action="exit.ez" method="post">
		<div class="containor w500">
			<div>
			<label>비밀번호</label>
			<input type="password" name="memberPw" placeholder="비밀번호를 입력하세요" class="form-input fill">
			</div>
			
			<div>
			<label>비밀번호 확인</label>
			<input type="password" name="memberPw" placeholder="비밀번호를 재입력하세요" class="form-input fill">
			</div>
			
			<div>
			<input type="submit" value="탈퇴하기" class="btn fill btn-primary">
			</div>
		</div>
    </form>
<jsp:include page="/template/footer.jsp"></jsp:include>