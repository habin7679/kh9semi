<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String referer=request.getHeader("Referer");
%>
<title>Insert title here</title>
</head>
<body>
	<form action="login.ez" method="post">
	<div>
		<div>
			<h1>로그인</h1>
		</div>
		<%if(referer !=null){%>
			<input type="hidden" value="<%=referer %>">
		<%}%>
		
		<div>
			<label>아이디</label>
			<input type="text" name="memberId" autocomplete="off" placeholder="아이디">
		</div>
		
		<div>
			<label>비밀번호</label>
			<input type="text" name="memberPw" placeholder="비밀번호">
		</div>
		
		<div>
			<input type="submit" value="로그인">
		</div>
		
		<div>
			<a href="find_id.jsp">아이디 찾기</a>
		</div>
	</div>
	<% if(request.getParameter("error") !=null){ %>
	<div>
		<sapn>로그인 정보가 일치하지 않습니다</sapn>
	</div>
	<%} %>
	</form>
	
	
</body>
</html>