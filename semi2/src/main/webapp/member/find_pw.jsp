<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="find_pw.ez" method="post">
	<div>
		<div>
			<h1>비밀번호 찾기</h1>
		</div>
		
		<div>
			<label>아이디</label>
			<input type="text" name="memberId" autocomplete="off" placeholder="아이디를 입력하세요">
		</div>
		
		<div>
			<label>이름</label>
			<input type="text" name="memberName" autocomplete="off" placeholder="이름을 입력하세요">
		</div>
		
		<div>
			<label>전화번호</label>
			<input type="tel" name="memberPhone" autocomplete="off" placeholder="숫자만 입력하세요">
		</div>
		
		<div>
			<input type="submit" value="확인">
		</div>
		
		
	</div>
	</form>
	
		<div>
			<a href="find_id.jsp">아이디 찾기</a>
		</div>
</body>
</html>