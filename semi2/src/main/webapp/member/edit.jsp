<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId=(String) session.getAttribute("member");
  	
	MemberDao memberDao= new MemberDao();
	MemberDto memberDto= memberDao.selectOne(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="edit.ez" method="post">
	<div >
	    <div>
	        <h1>개인정보 변경</h1>
	    </div>
	    <div>
	        <label>닉네임</label>
	        <input type="text" name="memberNick" autocomplete="off" value="<%=memberDto.getMemberNick()%>">
	    </div>
	    <div>
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" value="<%=memberDto.getMemberBirth()%>">
	    </div>
	    <div>
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" value="<%=memberDto.getMemberPhone()%>">
	    </div>
	    <div>
	        <label>이메일</label>
	        <input type="email" name="memberEmail" autocomplete="off" value="<%=memberDto.getMemberEmail()%>">
	    </div>
	    <div>
	        <label>주소</label><br>
	        <input type="text" name="memberPost" autocomplete="off" size="6" maxlength="6" placeholder="우편번호" value="<%=memberDto.getMemberPost()%>">
	        <a href="#" class="link link-btn">검색</a>
	    </div>
	    <div>
	        <input type="text" name="memberBasicAddress" autocomplete="off" placeholder="기본주소" value="<%=memberDto.getMemberBasicAddress()%>">
	    </div>
	    <div>
	        <input type="text" name="memberDetailAddress" autocomplete="off" placeholder="상세주소" value="<%=memberDto.getMemberDetailAddress()%>">
	    </div>
	    <div>
	        <label>비밀번호 확인</label>
	        <input type="password" name="memberPw">
	    </div>
	    <div>
	        <button type="submit">정보 변경하기</button>
	    </div>
	    
		<% if(request.getParameter("error") != null){ %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		<%} %>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>