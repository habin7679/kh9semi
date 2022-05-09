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
	<%if(memberDto == null){ %>
		 <h1>존재하지 않는 회원입니다!</h1>
	<%} else { %>
		<h1>회원 정보 상세</h1>
	
		<table border="1">
		<tr>
			<th>아이디</th>
			<td><%=memberDto.getMemberId()%></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=memberDto.getMemberPw()%></td>
		</tr>
		<tr>
			<th>고객명</th>
			<td><%=memberDto.getMemberName()%></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><%=memberDto.getMemberNick()%></td>
		</tr>	
		<tr>
			<th>전화번호</th>
			<td><%=memberDto.getMemberPhone()%></td>
		</tr>	
		<tr>
			<th>이메일</th>
			<td><%=memberDto.getMemberEmail()%></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><%=memberDto.getMemberPost()%></td>
		</tr>	
		<tr>
			<th>기본주소</th>
			<td><%=memberDto.getMemberBasicAddress()%></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><%=memberDto.getMemberDetailAddress()%></td>
		</tr>
		<tr>
			<th>보유포인트</th>
			<td><%=memberDto.getMemberPoint()%></td>
		</tr>
		<tr>
			<th>등급</th>
			<td><%=memberDto.getMemberGrade()%></td>
		</tr>
		<tr>
			<th>회원가입일</th>
			<td><%=memberDto.getMemberJoindate()%></td>
		</tr>
	</table>
	<%} %>
	
	<h2><a href="member_list.jsp">목록</a></h2>
	<h2><a href="member_update.jsp?memberId=<%=memberDto.getMemberId()%>">수정</a></h2>
	<h2><a href="member_delete.ez?memberId=<%=memberDto.getMemberId()%>">회원삭제</a></h2>
			
	<jsp:include page="/template/footer.jsp"></jsp:include>