<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<form action="find_id.ez" method="post">
	<div>
		<div>
			<h1>아이디 찾기</h1>
		</div>
		
		<div>
			<label>이름</label>
			<input type="text" name="memberName" autocomplete="off" placeholder="이름을 입력하세요">
		</div>
		
		<div>
			<label>생년월일</label>
			<input type="date" name="memberBirth" autocomplete="off">
		</div>
		
		<div>
			<label>전화번호</label>
			<input type="tel" name="memberPhone" autocomplete="off" placeholder="숫자만 입력하세요">
		</div>
		
		<div>
			<input type="submit" value="아이디 찾기">
		</div>
		
		<%if(request.getParameter("error") !=null) {%>
		<span>존재하지 않는 회원입니다</span>
		<%} %>
	</div>
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>