<%@page import="semi2.beans.OrderDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@page import="semi2.beans.AttachmentDto"%>
<%@page import="semi2.beans.AttachmentDao"%>
<%@page import="semi2.beans.InfoAttachmentDto"%>
<%@page import="semi2.beans.InfoAttachmentDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
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
InfoAttachmentDao infoattachmentDao = new InfoAttachmentDao();
InfoAttachmentDto infoattachmentDto = infoattachmentDao.selectOne(productNo);
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.selectOne(productNo);
	
	OrderDao oDao = new OrderDao();
	//>int orderNo = oDao.ReviewOrderNo(productNo);
	
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
                    url:"http://localhost:30000/semi2/ajax/board.ez?product_no=<%=productDto.getProductNo()%>",
                    type:"post",
                    data:{
                        p : page,
                        s : size
                    },
                    success:function(resp){
                        //목표 : resp에 들어있는 데이터를 기반으로 화면 생성을 한다
                        // -> 태그를 생성해서 데이터를 배치해야 한다.
                        // -> $("<div>") 라고 작성하면 div를 생성하라는 의미//
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
        var recentProdArr = JSON.parse(localStorage.getItem("recentProdArr")); // 로컬스토리지에서 최근 본 상품 목록 가져오기
        if (recentProdArr == null) {
        	recentProdArr = [];     // 초기에 최근 본 상품 없을 경우 변수 초기화
        }
        
		console.log(recentProdArr); // 기존 최근 본 상품 목록 로그  출력
        recentProdArr.unshift(<%=productNo%>); // 현재 상품 최근 본 상품 목록 배열 앞에 넣기(push 에서 unshift로 변경)
        const set = new Set(recentProdArr);
        recentProdArr = [...set]; // 중복 제거
        localStorage.setItem("recentProdArr", JSON.stringify(recentProdArr.slice(0, 2))); // 로컬스토리지 업데이트 (slice로 배열 3개만 유지)
        console.log(recentProdArr); // 업데이트 된 최근 본 상품 목록 로그 출력
		console.log(recentProdArr);
        recentProdArr.push(<%=productNo%>);
        localStorage.setItem("recentProdArr", JSON.stringify(recentProdArr));
        console.log(recentProdArr);
        
    </script>
		<style>
     .float-container {
     margin-top : 50px;
     }
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

        /* 1단부터 5단까지 클래스를 이용해서 폭을 설정하도록 구현 */
        .layer-1 {
            width:50%;
        }
        .layer-2 {
        margin-top : 30px;
            width:50%;
        }
       .label1{
       	font-size: 25px;
       }
       .label2{
       	font-size : 20px;
       }
       .info{
       	margin-top: 100px;
       }
       
</style>
<%if(productDto == null){ %>
<h1>해당 상품은 존재하지 않습니다</h1>
<%} else { %>

<h1><%=productDto.getProductName() %> 정보 보기</h1><br>
<div class="container w950 m30">
        <div class="row float-container">
            <div class="float-left layer-1">
               <img src="/semi2/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  width="400" height="400">
            </div>
            <div class="float-left layer-2">
                <label class="label1"><%=productDto.getProductName()%></label><br><br>
                <label class="label2">가격 : <%=productDto.getProductPrice()%></label><br><br>
                <label class="label2">칼로리 : <%=productDto.getProductKcal()%></label><br><br>
                <label class="label2">단백질 : <%=productDto.getProductProtein()%></label><br><br>
                <label class="label2">탄수화물 : <%=productDto.getProductCarbohydrate()%></label><br><br>
                <label class="label2"> 지방 : <%=productDto.getProductFat()%></label><br><br>
				<label class="label2">수량</label>
				<form action = "quickOrder.ez" method="post">
				<select class="form-input" name = "orderAmount">
				<%int stock = productDto.getProductStock();
				for(int i = 1; i<=stock; i++){
				%>
                    <option><%=i %></option>
				<%} %>
                </select><br><br>
                <input type="hidden" name="productNo" value="<%=productNo %>">
                <input type="submit" value="구매하기" class="btn btn-primary"><br><br>
				</form>
            </div>
            <div class="row center">
                <img src="/semi2/file/download.ez?attachmentNo=<%=infoattachmentDto.getAttachmentNo()%>"  width="500" height="1500" class="info">
            </div>
        </div>
<%} %>


    <div class="container w800 m30">
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
		count = boardDao.countByPaging_review(type, keyword);
	}
	else{//목록 결과 수 카운트
		count = boardDao.countByPaging_review();
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




	<div class="row center">
		<h1>상품 후기</h1>
	</div>
	
	<div class="row right">
	<%-- 
	<%if(orderNo>0){ %>
		<a href="/semi2/board/write_review.jsp?productNo=<%=productNo%>" class="link link-btn">글쓰기</a>
		<%} %>
	 --%>
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
						<a href="/semi2/board/detail_review.jsp?boardNo=<%=boardDto.getBoardNo()%>">
							<%=boardDto.getBoardTitle()%>
						</a>
						
						<!-- 댓글 수 출력 -->
						<%if(boardDto.getBoardReplycount() > 0){ %>
						[<%=boardDto.getBoardReplycount()%>]
						<%} %>
					</td>
<%
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.selectOne(boardDto.getBoardWriter());//작성자 모든 정보 조회
%>
					<td><%=memberDto.getMemberNick()%></td>
<%-- 				<td><%=boardDto.getBoardWriter()%></td>--%>
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
			<a href="/semi2/board/review_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="/semi2/board/review_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="/semi2/board/review_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="/semi2/board/review_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="/semi2/board/review_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="/semi2/board/review_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 영역 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="/semi2/board/review_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="/semi2/board/review_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="/semi2/board/review_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="/semi2/board/review_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>

	</div>
	</body>
	</div>
	
	
    <div class="container w800 m30">
<body>
   <%
	//목록과 검색을 한페이지에서 한다
	//=> 구분이 되어야 한다.
	//=> 주소에 type, keyword가 있으면 "검색"으로 간주
	//=> 없으면 "목록"으로 간주
	String type1 = request.getParameter("board_product_no");
	String keyword1 = request.getParameter("keyword");
	//페이징 관련 파라미터들을 수신
	int p1;
	try {//정상적인 숫자가 들어온 경우 - 0이하인 경우 --> Plan A
		p1 = Integer.parseInt(request.getParameter("p1"));
		if(p <= 0)	throw new Exception();
	}
	catch(Exception e){//p가 없거나 숫자가 아닌 경우 + 0이하인 경우 --> Plan B
		p1 = 1;
	}
	
	int s1;
	try {
		s1 = Integer.parseInt(request.getParameter("s1"));
		if(s1 <= 0) throw new Exception();
	}
	catch(Exception e){
		s1 = 10;
	}
%>

<%
	boolean search1 = type != null && keyword != null;
	BoardDao boardDao1 = new BoardDao();
	List<BoardDto> list1;
		list1 = boardDao.productqnaselectList(productNo);
%>    

<!-- 숫자(페이지네이션) 링크 -->
<%
	int count1;
	if(search){//검색 결과 수 카운트
		count1 = boardDao.countByPaging_review(type1, keyword1);
	}
	else{//목록 결과 수 카운트
		count1 = boardDao.countByPaging_review();
	}
	
	//마지막 페이지 번호 계산
	int lastPage1 = (count + s1 - 1) / s;
	
	//블록 크기
	int blockSize1 = 10;
	
	//시작블록 혹은 종료 블록 중 하나만 계산하면 반대편은 계산이 가능하다.
	//종료블록에 영향을 미치는 데이터는 현재 페이지(p) 이다.
	//하단 블록에는 반드시 현재페이지 번호가 포함되어야 하므로 이 번호를 기준으로 시작과 종료를 계산한다!
	int endBlock1 = (p1 + blockSize1 - 1) / blockSize1 * blockSize1;
	int startBlock1 = endBlock - (blockSize1 - 1);
	
	//범위를 초과하는 문제를 해결(endBlock > lastPage)
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>




	<div class="row center">
		<h1>상품 문의</h1>
	</div>
	
	<div class="row right">
		<a href="/semi2/board/write_productqna.jsp?productNo=<%=productNo%>" class="link link-btn">글쓰기</a>
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
				<%for(BoardDto boardDto : list1){ %>
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
						<a href="/semi2/board/detail_productqna.jsp?boardNo=<%=boardDto.getBoardNo()%>">
							<%=boardDto.getBoardTitle()%>
						</a>
						
						<!-- 댓글 수 출력 -->
						<%if(boardDto.getBoardReplycount() > 0){ %>
						[<%=boardDto.getBoardReplycount()%>]
						<%} %>
					</td>
<%
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.selectOne(boardDto.getBoardWriter());//작성자 모든 정보 조회
%>
					<td><%=memberDto.getMemberNick()%></td>
<%-- 				<td><%=boardDto.getBoardWriter()%></td>--%>
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
		
		<%if(p1 > 1){ %>
			<%if(search){ %>
			<a href="/board/productqna_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="/board/productqna_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock1 > 1){ %>
			<%if(search){ %>
			<a href="/semi2/board/productqna_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="/semi2/board/productqna_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="/semi2/board/productqna_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="/semi2/board/productqna_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="/semi2/board/productqna_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="/semi2/board/productqna_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 영역 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="/semi2/board/productqna_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="/semi2/board/productqna_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p1 < lastPage){ %>
			<%if(search){ %>
			<a href="/semi2/board/productqna_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="/semi2/board/productqna_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>

	</div>
	</div>
	

<<<<<<< HEAD
<button class="btn btn-primary"><a href="productqna_list.jsp">상품 문의하러 가기</</a></button><br><br>
<button class="btn btn-primary "><a href="product_user_list.jsp">상품 목록 가기</</a></button><br><br>
=======
<button class="btn "><a href="product_user_list.jsp">상품 목록 가기</</a></button><br><br>
>>>>>>> refs/remotes/origin/main
<jsp:include page="/template/footer.jsp"></jsp:include>