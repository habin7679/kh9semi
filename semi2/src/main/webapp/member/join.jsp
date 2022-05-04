<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join.ez" method="post">
	<div>
		<div>
			<h1>회원가입</h1>
		</div>
		<div>
			<label>아이디</label>
			<input type="text" name="memberId" placeholder="영문 소문자, 숫자 8~20자로 작성" autocomplete="off">
		</div>
		<div>
			<label>비밀번호</label>
	        <input type="password" name="memberPw" placeholder="첫자 영어 대문자,영어, 숫자, 특수문자 8~16자로 작성">
	    </div>
	    <div>
	        <label>닉네임</label>
	            <input type="text" name="memberNick" placeholder="한글 10자 이내" autocomplete="off">
	    </div>
	    <div>
	    	<label>이름</label>
	    		<input type="text" name="memberName" placeholder="이름" autocomplete="off">
	    </div>
	    <div>
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off">
	    </div>
	    <div>
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" placeholder="숫자만 입력" autocomplete="off">
	    </div>
	    <div>
	        <label>이메일</label>
	        <input type="email" name="memberEmail" class="form-input fill input-round" autocomplete="off">
	    </div>
	    <div>
	        <label>주소</label><br>
                <input type="text" name="memberPost" placeholder="우편번호" autocomplete="off">
                <button>검색</button>
            </div>
            <div>
                <input type="text" name="memberBasicAddress" placeholder="기본주소" autocomplete="off">
            </div>
            <div>
                <input type="text" name="memberDetailAddress" placeholder="상세주소" autocomplete="off">
	    </div>
		<div>
	        <button type="submit">회원가입</button>
	    </div>
	</div>
	</form>
	<a href="https://www.naver.com">d</a>
</body>
</html>