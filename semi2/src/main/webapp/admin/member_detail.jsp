<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = request.getParameter("memberId");
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOne(memberId);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<title>이지어트</title>
	<div class="container w500 m30">
	<div class="row">
	<%if(memberDto == null){ %>
		 <h1>존재하지 않는 회원입니다!</h1>
	<%} else { %>
	</div>
	<div class="row">
		<h1>회원 정보 상세</h1><br><br>
	</div>
	<div class="row">
			<div class="row">
			<label>아이디</label>
			<input type="text" value="<%=memberDto.getMemberId()%>" autocomplete="off" class="form-input fill" readonly>
		</div>
	</div>	
		<div class="row">
			<label>비밀번호</label>
	        <input type="text" value="<%=memberDto.getMemberPw()%>" class="form-input fill" readonly>
	    </div>
 <div class="row">
	        <label>닉네임</label>
	            <input type="text" value="<%=memberDto.getMemberNick()%>" class="form-input fill" readonly>
	    </div>
	    <div class="row">
	    	<label>이름  </label>
	    		<input type="text" value="<%=memberDto.getMemberName()%>" class="form-input fill" readonly>
	    </div>
	    <div class="row">
	        <label>생년월일</label>
	        <input type="text" value="<%=memberDto.getMemberBirth()%>" class="form-input fill" readonly>
	    </div>
	    <div class="row">
	        <label>전화번호</label>
	        <input type="text" value="<%=memberDto.getMemberPhone()%>" class="form-input fill"  readonly>
	    </div>
	    <div class="row">
	        <label>이메일</label>
	        <input type="text"  value="<%=memberDto.getMemberEmail()%>" class="form-input fill" readonly>
	    </div>
	    <div class="row">
	        <label>주소</label><br>
                <input type="text"  value="<%=memberDto.getMemberPost()%>" width="65%" class="form-input" width="20%" readonly>
       </div>
       <div class="row">
       		<input type="text" value="<%=memberDto.getMemberBasicAddress()%>" class="form-input fill" readonly>
       </div>
       <div class="row">
            <input type="text"  value="<%=memberDto.getMemberDetailAddress()%>" class="form-input fill" readonly>
	    </div>
	    <div class="row">
	    		<label>회원포인트</label>
	    		<input type="text"  value="<%=memberDto.getMemberPoint()%>" class="form-input fill " readonly>
	    </div>
	    <div class="row">
	    		<label>회원등급</label>
	    		<input type="text"  value="<%=memberDto.getMemberGrade()%>" class="form-input fill" readonly>
	    </div>
	    
	    <div class="row">
	    		<label>회원가입일</label>
	    		<input type="text" name="memberJoindate" value="<%=memberDto.getMemberJoindate()%>"  class="form-input fill" readonly>
	    </div>

		<div class = "row">
			<a href="member_list.jsp" class="link link-btn fill">목록</a><br>
		<div>
		<div class="row">
			<a href="member_update.jsp?memberId=<%=memberDto.getMemberId()%>" class ="link link-btn-green fill">수정</a>
		</div>
		</div>
	<%} %>
</div>
	</div>

	<jsp:include page="/template/footer.jsp"></jsp:include>