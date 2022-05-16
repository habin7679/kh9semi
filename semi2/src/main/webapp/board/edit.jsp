<%@page import="semi2.beans.BoardDto"%>
<%@page import="semi2.beans.BoardDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
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
	
	String memberId = (String)session.getAttribute("member");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOne(memberId);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<form action="edit.ez" method="post" encType = "multipart/form-data">
<input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">


	<div class="container w1000 m30">
	    <div class="row center">
	        <h1>게시글 수정</h1>
	    </div>
	    <div class="row">
	    </div>
	    <div class="row">
	       <label>카테고리</label>
	        <select name="boardHead" class="form-input fill input-round">
	            <option value="자유">선택</option>
	           	<%if(memberDto.getMemberGrade().equals("관리자")){%>
	            <option>공지</option>
	            <option>자유</option>
	            <option>팁</option>
	            <option>후기</option>
	            <option>문의</option>
	       	<%}else { %>
	       	 	<option>자유</option>
	            <option>팁</option>
	            <%} %>
	        </select>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" name="boardTitle" autocomplete="off" required class="form-input fill input-round" value="<%=boardDto.getBoardTitle()%>">
	    </div>
	    <div class="row">
	        <label>내용</label>
	        <div id="editor"></div> 
	        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
			<script> 
			
				const Editor = toastui.Editor; 
				const editor = new Editor({ 
					el: document.querySelector('#editor'),
					height: '500px',
					initialEditType: 'markdown',
					previewStyle: 'markdown'
				});
				
				editor.on("change", function(){
					var content = editor.getMarkdown();
					$("input[name=boardContent]").val(content);
					console.log($("input[name=boardContent]").val());
				});
				
			</script>
				<input type="hidden" name="boardContent">
	    <div class="row">
	        <label>첨부파일</label>
	        <input type="file" name="attach" class="form-input input-round" rows="12">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">수정</button>
	    </div>
	    <div class="row">
	        <a href="list.jsp" class="link link-btn fill">목록</a>
	    </div>
	</div>
</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>