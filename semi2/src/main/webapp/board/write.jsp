<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<jsp:include page="/template/header.jsp"></jsp:include>

<form action="write.kh" method="post">

<%--
	이 페이지는 새글쓰기와 답글쓰기를 모두 처리하는 페이지이다.
	따라서 답글쓰기일 경우 전달되는 파라미터(superNo)를 다음 페이지인 write.kh로 전달하는 코드가 필요하다.
 --%> 
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
	            <option>정보</option>
	            <option>유머</option>
	            <option>공지</option>
	        </select>
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