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


<%
	request.setCharacterEncoding("UTF-8");
	int productNo = Integer.parseInt(request.getParameter("product_no"));
	String memberId = (String)request.getSession().getAttribute("member");
%>


<%
ProductAttachmentDao productattachmentDao = new ProductAttachmentDao();
ProductAttachmentDto productattachmentDto = productattachmentDao.selectOne(productNo);
InfoAttachmentDao infoattachmentDao = new InfoAttachmentDao();
InfoAttachmentDto infoattachmentDto = infoattachmentDao.selectOne(productNo);
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.selectOne(productNo);
	
	OrderDao oDao = new OrderDao();
	int orderNo = oDao.reviewGetOrderNo(memberId, productNo);
	
%>


<jsp:include page="/template/header.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script type="text/javascript">
        $(function(){

            var page = 1;
            var size = 10;
            loadPage(page, size);

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
        var recentProdObj = JSON.parse(localStorage.getItem("recentProdObj"));
        if (recentProdObj == null) {
        	recentProdObj = [];    
        }
        
        newProdObj = {}; 
        newProdObj.id = <%=productNo%>;
        newProdObj.img = <%=productattachmentDto.getAttachmentNo()%>;
        recentProdObj.unshift(newProdObj); 
        _.uniqBy(recentProdObj, "id"); 
        
        localStorage.setItem("recentProdObj", JSON.stringify(recentProdObj.slice(0, 3))); 
        console.log(JSON.parse(localStorage.getItem("recentProdObj"))); 
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
				
				<form method="post">
				<select class="form-input" name = "orderAmount">
				<%int stock = productDto.getProductStock();
				for(int i = 1; i<=stock; i++){
				%>
             <option><%=i %></option>
				<%} %>
        </select><br><br>
                <input type="hidden" name="productNo" value="<%=productNo %>">
                
                <input type="submit" formaction="<%=request.getContextPath() %>/order/quickOrder.ez" value="구매하기" class="btn btn-primary"><br><br>
                <input type="submit" formaction="<%=request.getContextPath() %>/cart/insert.ez" value="장바구니에 추가하기" class="btn btn-primary"><br><br>
                <input type="submit" formaction="<%=request.getContextPath() %>/like/insert.ez" value="찜하기" class="btn btn-primary">
				</form>
            </div>
            <div class="row center">
                <img src="/semi2/file/download.ez?attachmentNo=<%=infoattachmentDto.getAttachmentNo()%>"  width="500" height="1500" class="info">
            </div>
        </div>
<%} %>


    <div class="container w800 m30">
   <%
	String type = request.getParameter("board_product_no");
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
		list = boardDao.productselectList(productNo);
%>    


<%
	int count;
	if(search){
		count = boardDao.countByPaging_review(type, keyword);
	}
	else{
		count = boardDao.countByPaging_review();
	}
	
	
	int lastPage = (count + s - 1) / s;
	
	
	int blockSize = 10;
	
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>




	<div class="row center">
		<h1>상품 후기</h1>
	</div>
	
	<div class="row right">
	<%if(orderNo>0){ %>
		<form action="<%=request.getContextPath()%>/board/write_review.jsp" method="post">
					<input type="hidden" name="productNo" value="<%=productNo %>">
					<input type="hidden" name="orderNo" value="<%=orderNo %>">
					<input type="submit" value="리뷰 작성하기" class="btn">
				</form>
		<%} %>
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

						
						
						<a href="/semi2/board/detail_review.jsp?boardNo=<%=boardDto.getBoardNo()%>">
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
		
			목록과 검색은 링크가 다르다. 이유는 유지시켜야 하는 파라미터의 개수가 다르기 때문이다.
			- 목록 = p, s
			- 검색 = p, s, type, keyword
		 --%>
		
		
		
		
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
	String type1 = request.getParameter("board_product_no");
	String keyword1 = request.getParameter("keyword");
	
	int p1;
	try {
		p1 = Integer.parseInt(request.getParameter("p1"));
		if(p <= 0)	throw new Exception();
	}
	catch(Exception e){
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


<%
	int count1;
	if(search){
		count1 = boardDao.countByPaging_review(type1, keyword1);
	}
	else{
		count1 = boardDao.countByPaging_review();
	}
	
	
	int lastPage1 = (count + s1 - 1) / s;
	
	
	int blockSize1 = 10;
	
	
	
	
	int endBlock1 = (p1 + blockSize1 - 1) / blockSize1 * blockSize1;
	int startBlock1 = endBlock - (blockSize1 - 1);
	
	
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



				</tr>
			</thead>
			<tbody align="center">
				<%for(BoardDto boardDto : list1){ %>
				<tr>
					<td><%=boardDto.getBoardHead()%></td>
					<td class="left">
						
						
						<%if(boardDto.getDepth() > 0){ %>
							<%for(int i=0; i < boardDto.getDepth(); i++){ %>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<%} %>
							<img src="<%=request.getContextPath()%>/image/reply.png" width="20" height="20">
						<%} %>

						
						
						<a href="/semi2/board/detail_productqna.jsp?boardNo=<%=boardDto.getBoardNo()%>">
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
		
			목록과 검색은 링크가 다르다. 이유는 유지시켜야 하는 파라미터의 개수가 다르기 때문이다.
			- 목록 = p, s
			- 검색 = p, s, type, keyword
		 --%>
		
		
		
		
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
	


<button class="btn btn-primary "><a href="product_user_list.jsp?product_sort=<%=productDto.getProductSort() %>">상품 목록 가기</</a></button><br><br>


<jsp:include page="/template/footer.jsp"></jsp:include>