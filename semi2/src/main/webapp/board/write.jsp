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

<form method="post" encType = "multipart/form-data" action="write.ez">
<head>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>

<%if(request.getParameter("superNo") != null){ %>   
<input type="hidden" name="superNo" value="<%=request.getParameter("superNo")%>">
<%} %>
<body>
	<div class="container w800 m30">
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
					height: '600px',
					initialEditType: 'markdown',
					previewStyle: 'vertical' });
					editor.on("change", function(){
					console.log(editor.getMarkdown());
				});
					//editor.getMarkdown();
				const [boardContent, setBoardContent] = useState();
				setBoardContent(editor.getMarkdown());
				
				let boardContenet = editor.getMarkdown();
		
			</script>
			
	 	<input type="hidden" name="boardContent" value=boardContenet>

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

</body>

<jsp:include page="/template/footer.jsp"></jsp:include>