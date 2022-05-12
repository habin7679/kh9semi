<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%String memberId=request.getParameter("memberId"); %>

	<div class="row center">
		<label>아이디</label>
		<%=memberId %>입니다
	</div><br>
	
	<div class="row center">
		<a href="login.jsp" class="btn fill">로그인 하기</a>
		<a href="changePw" class="btn fill">비밀번호 변경하기</a>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>