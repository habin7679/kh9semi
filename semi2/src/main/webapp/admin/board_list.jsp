<%@page import="semi2.beans.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="./css/commons.css">
    <style>
    .float-container {}
    .float-container > .float-left {
        float:left;
    }
    .float-container > .float-right {
        float:right;
    }
     .float-container::after {
        content:"";
        display: block;
        clear:both;
    }
    .layer-1 {
        width:100%;
    }
    .layer-2 {
        width:50%;
    }
    .layer-3 {
        width:33.3333%;
    }
    .layer-4 {
        width:25%;
    }
    .layer-5 {
        width:20%;
        margin-top:5%;
    }
    label {
    	font-size :25px;
    	font-weight : 600;
    	font-color : #525252;
    } 
    aside {
    }
    </style>
</head>
<body>
	<section>
		<aside class="float-left layer-5">
		<label><a href="<%=request.getContextPath()%>/admin/admin.jsp">Member</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/product/product_admin_list.jsp">Product</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/buy_list.jsp">Order</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/order_list.jsp">Delivery</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/board_list.jsp">Board List</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/board_write.jsp">Write</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/banner.jsp">Banner</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/statistics.jsp">Statistics</a></label><br><br><br><br>	
		</aside>
		
<article class= "float-left layer-2">
<%
	//목록과 검색을 한페이지에서 한다
	//=> 구분이 되어야 한다.
	//=> 주소에 type, keyword가 있으면 "검색"으로 간주
	//=> 없으면 "목록"으로 간주
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	//페이징 관련 파라미터들을 수신
	int p;
	try {//정상적인 숫자가 들어온 경우 - 0이하인 경우 --> Plan A
		p = Integer.parseInt(request.getParameter("p"));
		if(p <= 0)	throw new Exception();
	}
	catch(Exception e){//p가 없거나 숫자가 아닌 경우 + 0이하인 경우 --> Plan B
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
// 		list = boardDao.selectList(type, keyword);
		list = boardDao.selectListByPaging(p, s, type, keyword); 
	}
	else {
// 		list = boardDao.selectList();
		list = boardDao.selectListByPaging(p, s);
	}
%>    

<!-- 숫자(페이지네이션) 링크 -->
<%
	int count;
	if(search){//검색 결과 수 카운트
		count = boardDao.countByPaging(type, keyword);
	}
	else{//목록 결과 수 카운트
		count = boardDao.countByPaging();
	}
	
	//마지막 페이지 번호 계산
	int lastPage = (count + s - 1) / s;
	
	//블록 크기
	int blockSize = 10;
	
	//시작블록 혹은 종료 블록 중 하나만 계산하면 반대편은 계산이 가능하다.
	//종료블록에 영향을 미치는 데이터는 현재 페이지(p) 이다.
	//하단 블록에는 반드시 현재페이지 번호가 포함되어야 하므로 이 번호를 기준으로 시작과 종료를 계산한다!
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	//범위를 초과하는 문제를 해결(endBlock > lastPage)
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>

    


<div class="container w950 m30">

	<div class="row center">
		<h1>전체 게시판</h1>
	</div>
	
	<div class="row right">
		<a href="/admin/board_write.jsp" class="link link-btn">글쓰기</a>
	</div>		
	
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>게시판</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
<!-- 					<th>groupNo</th> -->
<!-- 					<th>superNo</th> -->
<!-- 					<th>depth</th> -->
				</tr>
			</thead>
			<tbody align="center">
				<%for(BoardDto boardDto : list){ %>
				<tr>
					<td><%=boardDto.getBoardHead()%></td>
					<td class="left">
						
						<%-- depth(차수)만큼 띄어쓰기 처리 --%>
						<%if(boardDto.getDepth() > 0){ %>
							<%for(int i=0; i < boardDto.getDepth(); i++){ %>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<%} %>
							<img src="<%=request.getContextPath()%>/image/reply.png" width="20" height="20">
						<%} %>
					

						
						<!-- 게시글 제목 링크 -->
						<a href="/board/detail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
							<%=boardDto.getBoardTitle()%>
						</a>
						
						<!-- 댓글 수 출력 -->
						<%if(boardDto.getBoardReplycount() > 0){ %>
						[<%=boardDto.getBoardReplycount()%>]
						<%} %>
					</td>
					<td><%=boardDto.getBoardWriter()%></td>
					<td><%=boardDto.getBoardTime()%></td>
					<td><%=boardDto.getBoardReadcount()%></td>
<%-- 					<td><%=boardDto.getGroupNo()%></td> --%>
<%-- 					<td><%=boardDto.getSuperNo()%></td> --%>
<%-- 					<td><%=boardDto.getDepth()%></td> --%>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<div class="row center pagination">
		<%--
			목록과 검색은 링크가 다르다. 이유는 유지시켜야 하는 파라미터의 개수가 다르기 때문이다.
			- 목록 = p, s
			- 검색 = p, s, type, keyword
		 --%>
		
		<!-- 이전 버튼 영역 -->
		
		<%--
			p > 1 : 첫 번째 페이지가 아닌 경우
			startBlock > 1 : 첫 번째 블록 구간이 아닌 경우
			p < lastPage : 마지막 페이지가 아닌 경우
			endBlock < lastPage : 마지막 블록 구간이 아닌 경우
		 --%>
		<br>
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="board_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="board_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="board_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="board_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="board_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="board_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="board_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="board_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 영역 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="board_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="board_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="board_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="board_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
	
	<div class="row center">
		<!-- 검색창 -->
		<br>
		<form action="/board/list.jsp" method="get">
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
</article>
</section>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>