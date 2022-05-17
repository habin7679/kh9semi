<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<form action="find_pw.ez" method="post">
	<div class="container w500 m30">
		<div class="row">
			<h1>비밀번호 찾기</h1>
		</div>
		
		<div class="row">
			<label>아이디</label>
			<input type="text" name="memberId" autocomplete="off" placeholder="아이디를 입력하세요" class="form-input fill">
		</div>
		
		<div class="row">
			<label>이름</label>
			<input type="text" name="memberName" autocomplete="off" placeholder="이름을 입력하세요" class="form-input fill">
		</div>
		
		<div class="row">
			<label>전화번호</label>
			<input type="tel" name="memberPhone" autocomplete="off" placeholder="숫자만 입력하세요" class="form-input fill">
		</div>
		<% if(request.getParameter("error") !=null){ %>
            <div class="row">
                <span style="color:red;">입력하신 정보가 올바르지 않습니다</span>
            </div>
            <%} %>
		
		<div class="row">
			<input type="submit" value="확인" class="btn fill btn-primary">
		</div>
		
		
	</div>
	</form><br>
	
		<div class="row center">
			<a href="<%=request.getContextPath() %>/member/find_id.jsp" class="btn w500">아이디 찾기</a>
		</div>
<jsp:include page="/template/footer.jsp"></jsp:include>