<%@page import="semi2.beans.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.BoardDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	
	
	
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	int p;
	try {
		p = Integer.parseInt(request.getParameter("p"));
		if(p <= 0)	throw new Exception();
	}
	catch(Exception e){
		p = 1;
	}
	
	int s;
	try {
		s = Integer.parseInt(request.getParameter("s"));
		if(s <= 0) throw new Exception();
	}
	catch(Exception e){
		s = 10;
	}
%>

<%
	boolean search = type != null && keyword != null;
	BoardDao boardDao = new BoardDao();
	List<BoardDto> list;
	if(search){

		list = boardDao.selectNoticeListByPaging(p, s, type, keyword); 
	}
	else {

		list = boardDao.selectNoticeListByPaging(p, s);
	}
%>    


<%
	int count;
	if(search){
		count = boardDao.countByPaging_notice(type, keyword);
	}
	else{
		count = boardDao.countByPaging_notice();
	}
	
	
	int lastPage = (count + s - 1) / s;
	
	
	int blockSize = 10;
	
	
	
	
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>

    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w950 m30">

	<div class="row center">
		<h1>공지 게시판</h1>
	</div>
	
	<div class="row right">
		<a href="write.jsp" class="link link-btn">글쓰기</a>
	</div>		
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>게시판</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>



				</tr>
			</thead>
			<tbody align="center">
				<%for(BoardDto boardDto : list){ %>
				<tr>
					<td><%=boardDto.getBoardHead()%></td>
					<td class="left">
						
						
						<%if(boardDto.getDepth() > 0){ %>
							<%for(int i=0; i < boardDto.getDepth(); i++){ %>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<%} %>
							<img src="<%=request.getContextPath()%>/image/reply.png" width="20" height="20">
						<%} %>
					

						
						
						<a href="detail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
							<%=boardDto.getBoardTitle()%>
						</a>
						
						
						<%if(boardDto.getBoardReplycount() > 0){ %>
						[<%=boardDto.getBoardReplycount()%>]
						<%} %>
					</td>
<%
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.selectOne(boardDto.getBoardWriter());
%>
					<td><%=memberDto.getMemberNick()%></td>

					<td><%=boardDto.getBoardTime()%></td>
					<td><%=boardDto.getBoardReadcount()%></td>



				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<div class="row center pagination">

		
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="notice_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="notice_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="notice_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="notice_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
	
	<div class="row center">
		
		<form action="notice_list.jsp" method="get">
			<select name="type" class="form-input input-round">
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
				<option value="board_writer">작성자</option>
			</select>
			
			<input type="search" name="keyword" placeholder="검색어 입력" required class="form-input input-round">
			
			<input type="submit" value="검색" class="btn btn-primary">
		</form>
	</div>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>