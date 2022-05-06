<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>


<!-- 카테고리 선택하기 위한 회원등급 값 불러오기 -->
<%	
String memberId = (String)session.getAttribute("login");
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.selectOne(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="write.kh" method="post">


<%if(request.getParameter("superNo") != null){ %>   
<input type="hidden" name="superNo" value="<%=request.getParameter("superNo")%>">
<%} %>

	<div class="container w800 m30">
	    <div class="row center">
	        <h1>게시글 작성</h1>
	    </div>
	    <div class="row">
	        <label>말머리</label>
	        <select name="boardHead" class="form-input fill input-round">
	            <option value="">선택</option>
	           	<%if(memberDto.getMemberGrade().equals("관리자")){%>
	            <option>공지</option>
	            <option>자유</option>
	            <option>팁</option>
	            <option>후기</option>
	            <option>문의</option>
	        </select>
	       	<%}else { %>
	       	 	<option>자유</option>
	            <option>팁</option>
	            <option>후기</option>
	            <option>문의</option>
	            <%} %>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" name="boardTitle" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>내용</label>
	        <textarea name="boardContent" required class="form-input fill input-round" rows="12"></textarea>
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">등록</button>
	    </div>
	    <div class="row">
	        <a href="list.jsp" class="link link-btn fill">목록</a>
	    </div>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>