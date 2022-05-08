<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<h1>비밀</h1>
	
	<form action="exit.kh" method="post">
		<div>
			<div>
			<label>비밀번호</label>
			<input type="password" name="memberPw" placeholder="비밀번호를 입력하세요">
			</div>
			
			<div>
			<label>비밀번호 확인</label>
			<input type="password" name="memberPw" placeholder="비밀번호를 재입력하세요">
			</div>
			
			<div>
			<input type="submit" value="탈퇴하기">
			</div>
		</div>
    </form>
<jsp:include page="/template/footer.jsp"></jsp:include>