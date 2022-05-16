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
	boardDao.plusReadcount(boardNo);
	BoardDto boardDto = boardDao.selectOne(boardNo); 
	
	BoardAttachmentDao boardAttachmentDao = new BoardAttachmentDao();
	BoardAttachmentDto boardAttachmentDto = boardAttachmentDao.selectOne(boardNo);
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOne(boardDto.getBoardWriter());
	
	

	String memberId = (String)session.getAttribute("member");
	boolean isLogin = memberId != null;
	boolean isOwner = isLogin && memberId.equals(boardDto.getBoardWriter());
	

	boolean isAdmin = false;
	if(isLogin){
	MemberDto memberDto1 = memberDao.selectOne(memberId);
	String memberGrade = memberDto1.getMemberGrade();
	isAdmin = memberGrade.equals("관리자");
	}

	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto> replyList = replyDao.selectList(boardDto.getBoardNo()); 
	
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container w1000 m30">
<div class="row center">
<h1>[<%=boardDto.getBoardHead()%>게시판]<%=boardDto.getBoardTitle()%></h1>
</div>
<div class="row right">
	<tr>
		<td>
			<%=memberDto.getMemberId()%>
		 	(<%=memberDto.getMemberGrade()%>)
		</td>
	</tr>
</div>
<div class="row left">
		<tr>
		<td>
			<%=boardDto.getBoardTime()%>
			 조회수 <%=boardDto.getBoardReadcount()%>
		</td>
	</tr>
</div>
<table border="1" width="750">
	<tr>
		<td>
			<h2>
			<div class="container w600 m30" style="text-align:center;">
			<img src="/semi2/file/download.ez?attachmentNo=<%=boardAttachmentDto.getAttachmentNo()%>" width="400">
			<br><br>
				<%=boardDto.getBoardContent()%>
			</div>
			</h2>
		</td>
		</tr>

	<tr>	
			<div class="row right">
			<a href="write.jsp" class="link link-btn">글쓰기</a>
			<%if(isAdmin){ %>
			<a href="write_productqna.jsp?superNo=<%=boardNo%>" class="link link-btn">답글</a>
			<%} %>
			<%if(isOwner || isAdmin){ %>
			<a href="edit_productqna.jsp?boardNo=<%=boardNo%>" class="link link-btn">수정</a>
			<a href="delete.ez?boardNo=<%=boardNo%>" class="link link-btn">삭제</a>
			<%} %>
			<a href="list.jsp" class="link link-btn">목록</a>
			</div>
	</tr>
	

	<tr>
		<td align="right">
			<%if(isLogin){ %>
			<form action="reply_insert.ez" method="post">
				<input type="hidden" name="replyTarget" value="<%=boardDto.getBoardNo()%>">
				<textarea name="replyContent" rows="2" cols="160"></textarea>
				<div class="row right">
				<input type="submit" class="link link-btn" value="댓글 작성">
				</div>
			</form>
			<%} else { %>
				<textarea rows="2" cols="160" disabled placeholder="로그인 후 댓글 작성이 가능합니다"></textarea>
				<div class="row right">
				<input type="submit" class="link link-btn" value="댓글 작성">
				</div>
			<%} %>
		</td>
	</tr>
	

	<tr>
		<td>

			<table width="95%">
				<%for(ReplyDto replyDto : replyList){ %>
				<%
					
					boolean isReplyOwner = memberId != null && memberId.equals(replyDto.getReplyWriter());
				%>
				

					<tr class="show-row">
						<th width="25%">
							<%=replyDto.getReplyWriter()%>
						</th>
						<td width="15%"><%=replyDto.getReplyTime()%></td>
						<td width="50%">

							<pre><%=replyDto.getReplyContent()%></pre>
							<br>
						</td>
						<td>

							<%if(isReplyOwner){ %>
							<a href="#" class="edit-btn">
							<img src="<%=request.getContextPath()%>/image/edit.png" width="20">
							</a>
							<%} %>
							

							<%if(isReplyOwner || isAdmin) { %>
							<a href="reply_delete.ez?replyNo=<%=replyDto.getReplyNo()%>&replyTarger=<%=replyDto.getReplyTarget()%>">
							<img src="<%=request.getContextPath()%>/image/trash.png" width="20">
							</a>
							<%} %>
						</td>
					</tr>
				

					
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



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){

		$(".edit-btn").click(function(){
			$(this).parents(".show-row").hide();
			$(this).parents(".show-row").next().show();
		});
		
		//class="cancel-btn"를 클릭하면 class="edit-row"를 숨기고 class="edit-row" 앞부분을 보여준다.
		$(".cancel-btn").click(function(){
			$(this).parents(".edit-row").hide();
			$(this).parents(".edit-row").prev().show();
		});
		

		$(".edit-row").hide();
	});
</script>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>