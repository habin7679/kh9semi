<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>


<!-- 카테고리 선택하기 위한 회원등급 값 불러오기 -->
<%	
String memberId = (String)session.getAttribute("member");
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.selectOne(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<form method="post" encType = "multipart/form-data" action="write.ez">

<%if(request.getParameter("superNo") != null){ %>   
<input type="hidden" name="superNo" value="<%=request.getParameter("superNo")%>">
<%} %>
	<div class="container w1000 m30">
	    <div class="row center">
	        <h1>게시글 작성</h1>
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
	        <input type="text" name="boardTitle" autocomplete="off" required class="form-input fill input-round">
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
	    	<label>첨부파일</label><br>
	    	<input type="file" name="attach" class="form-input input-round">
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