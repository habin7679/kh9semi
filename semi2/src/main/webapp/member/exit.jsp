<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/menu.jsp"></jsp:include>
	
	<form action="exit.ez" method="post" style="height: 400px;">
		<div class="container w500 m30">
			<h1>회원탈퇴</h1>
			<div class="row">
			<label>비밀번호</label>
			<input type="password" name="memberPw" placeholder="비밀번호를 입력하세요" class="form-input fill">
			</div>
			
			<div class="row">
			<label>비밀번호 확인</label>
			<input type="password" name="memberPw" placeholder="비밀번호를 재입력하세요" class="form-input fill">
			</div>
			
			<div>
			<a href="mypage.jsp" class="link link-btn btn-primary" style="withth:49.5%">취소</a>
			<input type="submit" value="탈퇴하기" class="btn btn-primary" style="withth:49.5%">
			</div>
		</div>
    </form>
<jsp:include page="/template/footer.jsp"></jsp:include>