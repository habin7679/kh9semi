<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<title>이지어트</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String memberId = request.getParameter("memberId");
%>

<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOne("memberId");
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h1> 회원 정보 수정 </h1>
<form action = "member_update.ez" method="post">
	
		<div>
			<label>아이디</label>
			<input type="hidden" name="memberId" value="<%=memberDto.getMemberId()%>" required>
		</div>
		<div>
			<label>비밀번호</label>
	        <input type="password" name="memberPw" value="<%=memberDto.getMemberPw()%>" required>
	    </div>
	    <div>
	        <label>닉네임</label>
	            <input type="text" name="memberNick" value="<%=memberDto.getMemberNick()%>" required>
	    </div>
	    <div>
	    	<label>이름</label>
	    		<input type="text" name="memberName" value="<%=memberDto.getMemberName()%>" required>
	    </div>
	    <div>
	        <label>생년월일</label>
	        <input type="date" name="memberBirth" value="<%=memberDto.getMemberBirth()%>" required>
	    </div>
	    <div>
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" value="<%=memberDto.getMemberPhone()%>"  required>
	    </div>
	    <div>
	        <label>이메일</label>
	        <input type="email" name="memberEmail"  value="<%=memberDto.getMemberEmail()%>" required>
	    </div>
	    <div>
	        <label>주소</label><br>
                <input type="text" name="memberPost" value="<%=memberDto.getMemberPost()%>" required>
                <button>검색</button>
       </div>
       <div>
       		<input type="text" name="memberBasicAddress" value="<%=memberDto.getMemberBasicAddress()%>" required>
       </div>
       <div>
            <input type="text" name="memberDetailAddress" value="<%=memberDto.getMemberDetailAddress()%>" required>
	    </div>
	    <div>
	    		<label>회원포인트</label>
	    		<input type="number" name="memberPoint"  value="<%=memberDto.getMemberPoint()%>"  required min="0" step="100">
	    </div>
	    <div>
	    		<label>회원등급</label>
	    		<select name="memberGrade" value="<%=memberDto.getMemberGrade()%>" required>
	    			<option value="">선택</option>
	    			<option>일반회원</option>
	    			<option>우수회원</option>
	    			<option>vip</option>
	    			<option>관리자</option>
	    		</select>
	    </div>
	    <div>
	    		<label>회원가입일</label>
	    		<input type="date" name="memberJoindate" value="<%=memberDto.getMemberJoindate()%>" >
	    </div>
	    
		<div>
			  <a href="member_detail.jsp?memberId=<%=memberDto.getMemberId()%>">취소</a>
	        <button type="submit">수정</button>
	    </div>
	</div>
	</form>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>