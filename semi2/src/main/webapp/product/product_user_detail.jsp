<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@page import="semi2.beans.AttachmentDto"%>
<%@page import="semi2.beans.AttachmentDao"%>
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
    <div class="container w800 m30">

        <div class="row center m30">
   <h1>후기보기</h1>
        </div>

        <div class="row">

            <table class="table table-border">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th width="40%">제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody id="table-body">
                    
                </tbody>
            </table>

        </div>

        <!-- 더보기 버튼 -->
        <div class="row">
            <button class="btn btn-primary fill btn-more">더보기</button>
        </div>

    </div>
</body>


<h2><a href="product_user_list.jsp">목록으로 돌아가기</a></h2>

<h2><a href="#">상품 문의</a></h2>
		
<jsp:include page="/template/footer.jsp"></jsp:include>