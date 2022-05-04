<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%String memberId=request.getParameter("memberId"); %>
</head>
<body>
	<div>
		<label>아이디</label>
		<input type="text" value="<%=memberId %>입니다">
	</div>
	
	<div>
		<a href="login.jsp">로그인 하기</a>
	</div>
	
	<div>
		<a href="changePw">비밀번호 변경하기</a>
	</div>
</body>
</html>