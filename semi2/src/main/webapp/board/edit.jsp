<%@page import="semi2.beans.BoardDto"%>
<%@page import="semi2.beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 준비 --%>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>

<%-- 처리 --%>
<%
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.selectOne(boardNo);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="edit.kh" method="post">
<input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">

	<div class="container w800 m30">
	    <div class="row center">
	        <h1>게시글 수정</h1>
	    </div>
	    <div class="row">
	        <label>말머리</label>
	        <%if(boardDto.getBoardHead() == null){ %>
			<select name="boardHead" class="form-input fill input-round">
				<option value=""  selected>선택</option>
				<option>정보</option>
				<option>유머</option>
				<option>공지</option>
			</select>
			<%} else if(boardDto.getBoardHead().equals("정보")){ %>
			<select name="boardHead" class="form-input fill input-round">
				<option value="">선택</option>
				<option selected>정보</option>
				<option>유머</option>
				<option>공지</option>
			</select>
			<%} else if(boardDto.getBoardHead().equals("유머")){ %>
			<select name="boardHead" class="form-input fill input-round">
				<option value="">선택</option>
				<option>정보</option>
				<option selected>유머</option>
				<option>공지</option>
			</select>
			<%} else if(boardDto.getBoardHead().equals("공지")){ %>
			<select name="boardHead" class="form-input fill input-round">
				<option value="">선택</option>
				<option>정보</option>
				<option>유머</option>
				<option selected>공지</option>
			</select>
			<%} %>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" name="boardTitle" autocomplete="off" required class="form-input fill input-round" value="<%=boardDto.getBoardContent()%>">
	    </div>
	    <div class="row">
	        <label>내용</label>
	        <textarea name="boardContent" required class="form-input fill input-round" rows="12"><%=boardDto.getBoardContent()%></textarea>
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">수정</button>
	    </div>
	    <div class="row">
	        <a href="list.jsp" class="link link-btn fill">목록</a>
	    </div>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>