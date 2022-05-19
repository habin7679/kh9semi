<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div>
	<div class="row"><h1>비밀번호 변경이 완료되었습니다</h1></div><br><br>
	<div class="row center">
	<a href="<%=request.getContextPath() %>/member/login.jsp" class="btn">로그인 하러가기</a>
	<a href="<%=request.getContextPath() %>" class="btn" >메인화면으로 가기</a>
	</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>