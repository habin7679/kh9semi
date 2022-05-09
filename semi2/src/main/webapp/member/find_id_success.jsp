<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%String memberId=request.getParameter("memberId"); %>

	<div>
		<label>아이디</label>
		<input type="text" value="<%=memberId %>입니다">
	</div>
	
	<div>
		<a href="login.jsp">로그인 하기</a>
	</div>
	
	<div>
		<a href="change_pw.jsp">비밀번호 변경하기</a>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>