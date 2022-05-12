<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@page import="semi2.beans.AttachmentDto"%>
<%@page import="semi2.beans.AttachmentDao"%>
<%@page import="semi2.beans.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	int productNo = Integer.parseInt(request.getParameter("product_no"));
%>

<%-- 처리 --%>    
<%
ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(productNo);
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.selectOne(productNo);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
   <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
        $(function(){
            //[1] 1페이지를 불러와서 화면에 띄운다
            var page = 1;
            var size = 10;
            loadPage(page, size);
            //[2] 더보기 버튼을 누르면 다음페이지를 화면에 띄운다
            $(".btn-more").click(function(){
                page++;
                loadPage(page, size);
            });
            
            function loadPage(page, size) {
                $.ajax({
                    url:"http://localhost:30000/semi2/ajax/board.ez",
                    type:"post",
                    data:{
                        p : page,
                        s : size
                    },
                    success:function(resp){
                        //목표 : resp에 들어있는 데이터를 기반으로 화면 생성을 한다
                        // -> 태그를 생성해서 데이터를 배치해야 한다.
                        // -> $("<div>") 라고 작성하면 div를 생성하라는 의미
                        //페이지 크기보다 작은 개수가 불러와졌다면 더보기가 없는 것으로 간주
                        if(resp.length < size) {
                            $(".btn-more").remove();
                        }
                        for(var i=0; i < resp.length; i++) {
                            var tr = $("<tr>");
                            var td1 = $("<td>").text(resp[i].boardNo);
                            var td2 = $("<td>").text(resp[i].boardTitle).addClass("left");
                            var td3 = $("<td>").text(resp[i].boardWriter);
                            var td4 = $("<td>").text(resp[i].boardTime);
                            var td5 = $("<td>").text(resp[i].boardReadcount);
                            //tr에 td1부터 td5까지 순차적으로 추가
                            tr.append(td1).append(td2).append(td3).append(td4).append(td5);
                            //#table-body에 tr을 추가
                            $("#table-body").append(tr);
                        }
                    }
                });
            }
        });
       
        var recentProdArr = JSON.parse(localStorage.getItem("recentProdArr"));
        if (recentProdArr == null) {
        	recentProdArr = [];
        }
		console.log(recentProdArr);
        recentProdArr.push(<%=productNo%>);
        localStorage.setItem("recentProdArr", JSON.stringify(recentProdArr));
        console.log(recentProdArr);
        
    </script>
		
<%if(productDto == null){ %>
<h1>해당 상품은 존재하지 않습니다</h1>
<%} else { %>

<h1>상품 상세정보 보기</h1>

<table border="1">
	<tr>
		<th>이름</th>
			<td><%=productDto.getProductName()%></td>
	</tr>
	<tr>
		<th>가격</th>
			<td><%=productDto.getProductPrice()%></td>
	</tr>
	<tr>
		<th>칼로리</th>
			<td><%=productDto.getProductKcal()%></td>
	</tr>
	<tr>
		<th>단백질</th>
			<td><%=productDto.getProductProtein()%></td>
	</tr>
	<tr>
		<th>탄수화물</th>
			<td><%=productDto.getProductCarbohydrate()%></td>
	</tr>
	<tr>
		<th>지방</th>
			<td><%=productDto.getProductFat()%></td>
	</tr>
	<tr>
		<th>상품정보</th>
			<td><img src="<%=request.getContextPath()%>/image/product<%=productNo%>.jpg" width="200" height="200"><br>
			<%=productDto.getProductInfo()%></td>
	</tr>
	<tr>
		<th>상품이미지</th>
				<td><img src="/semi2/file/download.ez?attachmentNo=5<%--<%=productattachmentDto.getAttachmentNo()%>--%>"  width="200" height="200"></td>
	</tr>
	<tr>
		<td><input type="button" value="구매하기"></td>
	</tr>
	
	
</table>
<%} %>

<body>
   <%
	//목록과 검색을 한페이지에서 한다
	//=> 구분이 되어야 한다.
	//=> 주소에 type, keyword가 있으면 "검색"으로 간주
	//=> 없으면 "목록"으로 간주
	String type = request.getParameter("board_product_no");
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
		list = boardDao.productselectList(productNo);
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

<%//
	//List<BoardDto> replyList = boardDao.productselectList(productNo);
%>//
<%//=replyList%>

<div class="container w950 m30">

	<div class="row center">
		<h1>상품 후기</h1>
	</div>
	
	<div class="row right">
		<a href="/semi2/board/write_review.jsp?productNo=<%=productNo%>" class="link link-btn">글쓰기</a>
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
						<a href="/semi2/board/detail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
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
		
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 영역 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>

	</div>
	

<jsp:include page="/template/footer.jsp"></jsp:include>