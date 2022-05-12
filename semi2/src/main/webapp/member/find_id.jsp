<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<form action="find_id.ez" method="post">
	<div class="container w700 m30">
		<div class="row">
			<h1>아이디 찾기</h1>
		</div>
		
		<div class="row">
			<label>이름</label>
			<input type="text" name="memberName" autocomplete="off" placeholder="이름을 입력하세요" class="form-input fill">
		</div>
		
		<div class="row">
			<label>생년월일</label>
			<input type="date" name="memberBirth" autocomplete="off" class="form-input fill">
		</div>
		
		<div class="row">
			<label>전화번호</label>
			<input type="tel" name="memberPhone" autocomplete="off" placeholder="숫자만 입력하세요" class="form-input fill">
		</div>
		
		<div class="row">
			<input type="submit" value="아이디 찾기" class="btn fill btn-primary">
		</div>
		
		<%if(request.getParameter("error") !=null) {%>
		<span style="color:red;">존재하지 않는 회원입니다</span>
		<%} %>
	</div>
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>