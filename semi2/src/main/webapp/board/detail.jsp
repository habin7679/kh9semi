<%@page import="semi2.beans.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ReplyDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.BoardDto"%>
<%@page import="semi2.beans.BoardDao"%>
<%@page import="semi2.beans.BoardAttachmentDao"%>
<%@page import="semi2.beans.BoardAttachmentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	BoardDao boardDao = new BoardDao();
	boardDao.plusReadcount(boardNo);//조회수 증가 
	BoardDto boardDto = boardDao.selectOne(boardNo);//게시글을 불러온다 
	
	BoardAttachmentDao boardAttachmentDao = new BoardAttachmentDao();
	BoardAttachmentDto boardAttachmentDto = boardAttachmentDao.selectOne(boardNo);
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOne(boardDto.getBoardWriter());//작성자 모든 정보 조회
	
	//내 글인지 판정
	//= 현재 로그인한 사용자가 게시글 작성자인지 확인
	//= 세션에 있는 사용자의 아이디와 게시글의 작성자를 비교
	String memberId = (String)session.getAttribute("member");
	boolean isLogin = memberId != null;
	boolean isOwner = isLogin && memberId.equals(boardDto.getBoardWriter());
	
	//관리자인지 판정
	String memberGrade = (String)session.getAttribute("auth");
	boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
	
	//현재 글에 대한 댓글 목록을 조회
	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto> replyList = replyDao.selectList(boardDto.getBoardNo()); 
	
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<h1><%=boardDto.getBoardNo()%>번 게시글 보기</h1>
<img src="/semi2/file/download.ez?attachmentNo=<%=boardAttachmentDto.getAttachmentNo()%>">
<table border="1" width="750">
	<tr>
		<td>
			<h2>
				<%-- 말머리가 있으면 출력 --%>
				<%if(boardDto.getBoardHead() != null){ %>
				[<%=boardDto.getBoardHead()%>]
				<%} %>
				
				<%=boardDto.getBoardTitle()%>
			</h2>
		</td>
	</tr>
	<tr>
		<td>
			<%=boardDto.getBoardWriter()%>
		 	(<%=memberDto.getMemberGrade()%>)
		</td>
	</tr>

		<tr>
		<td>
			<%=boardDto.getBoardTime()%>
			 조회수 <%=boardDto.getBoardReadcount()%>
		</td>
	</tr>
	
	<!-- 버튼 영역 -->
	<tr>
		<td align="right">
			<a href="write.jsp">글쓰기</a>
			<%if(isAdmin){ %>
			<a href="write.jsp?superNo=<%=boardNo%>">답글</a>
			<%} %>
			<%if(isOwner || isAdmin){ %>
			<a href="edit.jsp?boardNo=<%=boardNo%>">수정</a>
			<a href="delete.ez?boardNo=<%=boardNo%>">삭제</a>
			<%} %>
			<a href="list.jsp">목록</a>
		</td>
	</tr>
	
	<!-- 댓글 작성 영역 -->
	<tr>
		<td align="right">
			<%if(isLogin){ %>
			<form action="reply_insert.ez" method="post">
				<input type="hidden" name="replyTarget" value="<%=boardDto.getBoardNo()%>">
				<textarea name="replyContent" rows="4" cols="100"></textarea>
				<input type="submit" value="댓글 작성">
			</form>
			<%} else { %>
				<textarea rows="4" cols="100" disabled placeholder="로그인 후 댓글 작성이 가능합니다"></textarea>
				<input type="submit" value="댓글 작성" disabled>
			<%} %>
		</td>
	</tr>
	
	<!-- 댓글 목록 영역 -->
	<tr>
		<td>

			<table width="95%">
				<%for(ReplyDto replyDto : replyList){ %>
				<%
					//본인이 작성한 댓글인지 여부를 미리 검사하여 반복문 내에서 필요에 따라 조건부 처리를 수행할 수 있게 한다.
					boolean isReplyOwner = memberId != null && memberId.equals(replyDto.getReplyWriter());
				%>
				
				<%-- 수정이 가능(본인이 작성한 댓글)한 경우라면 보여주기 위한 줄과 수정하기 위한 줄을 각각 출력 --%>
				
					<%-- 보여주기 위한 줄 --%>
					<tr class="show-row">
						<th width="25%">
							<%=replyDto.getReplyWriter()%>
						</th>
						<td width="15%"><%=replyDto.getReplyTime()%></td>
						<td width="50%">
							<!-- 댓글 내용 -->
							<pre><%=replyDto.getReplyContent()%></pre>
						</td>
						<td>
							<%-- 댓글 수정 아이콘 : 본인 글에만 등장해야함 --%>
							<%if(isReplyOwner){ %>
							<a href="#" class="edit-btn">
							<img src="<%=request.getContextPath()%>/image/edit.png" width="20">
							</a>
							<%} %>
							
							<%-- 댓글 삭제 아이콘 : 본인 글이거나 관리자이거나 둘 중 하나에 해당하면 등장해야함 --%>
							<%if(isReplyOwner || isAdmin) { %>
							<a href="reply_delete.ez?replyNo=<%=replyDto.getReplyNo()%>&replyTarger=<%=replyDto.getReplyTarget()%>">
							<img src="<%=request.getContextPath()%>/image/trash.jpg" width="20">
							</a>
							<%} %>
						</td>
					</tr>
				
					<%-- 본인 글인 경우 수정을 할 수 있도록 준비된 줄 (본인글 : replyWriter == 세션의 회원아이디) --%>
					
					<%if(isReplyOwner){ %>
						<tr align="right" class="edit-row">
							<td colspan="3">
								<form action="reply_edit.ez" method="post">
									<input type="hidden" name="replyNo" value="<%=replyDto.getReplyNo()%>">
									<input type="hidden" name="replyTarget" value="<%=replyDto.getReplyTarget()%>">
									<textarea name="replyContent" rows="4" cols="100"><%=replyDto.getReplyContent()%></textarea>
									<input type="button" value="변경 취소" class="cancel-btn">
									<input type="submit" value="댓글 수정">
								</form>
							</td>
						</tr>
					<%} %>
				<%} %>
			</table>

		</td>
	</tr>
</table>


<!-- 특별출연 : 프론트엔드 스크립트인 jQuery를 이용하여 수정버튼과 취소버튼을 누르면 화면이 변경되도록 구현  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		//class="edit-btn"를 클릭하면 class="show-row"를 숨기고 class="show-row" 뒷부분을 보여준다.
		$(".edit-btn").click(function(){
			$(this).parents(".show-row").hide();
			$(this).parents(".show-row").next().show();
		});
		
		//class="cancel-btn"를 클릭하면 class="edit-row"를 숨기고 class="edit-row" 앞부분을 보여준다.
		$(".cancel-btn").click(function(){
			$(this).parents(".edit-row").hide();
			$(this).parents(".edit-row").prev().show();
		});
		
		//최초에 class="edit-row"는 숨긴다.
		$(".edit-row").hide();
	});
</script>

<jsp:include page="/template/footer.jsp"></jsp:include>