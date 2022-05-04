<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String memberId=request.getParameter("memberId");
%>

<title>Insert title here</title>
</head>
<body>
	<form action="change_pw.ez" method="post">
	<div>
		<div>
			<h1>비밀번호 변경</h1>
		</div>
		
		<div>
			<input type="hidden" name="memberId" value="<%=memberId %>">
		</div>
		
		<div>
			<label>새 비밀번호</label>
			<input type="text" name="memberPw" placeholder="첫자 영어 대문자,영어, 숫자, 특수문자 8~16자로 작성">
		</div>
		
		<div>
			<input type="submit" value="비밀번호  변경하기">
		</div>
	</div>
	</form>
</body>
</html>