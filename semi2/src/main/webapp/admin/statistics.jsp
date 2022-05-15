<%@page import="semi2.beans.YearStatusDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.YearStatusDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	YearStatusDao yearStatusDao = new YearStatusDao();
	List<YearStatusDto> yearlyList = yearStatusDao.selectList(); 
%>
    
    
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
    p { width: 100px; /* 정렬하려는 요소의 넓이를 반드시 지정 */ margin: 0 auto; }
    </style>
</head>
<body>
	<section class="p">
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
<h1>관리자 대시보드</h1>

	<h2>연도별 현황</h2>
	<table border="1" width="500">
		<thead>
			<tr>
				<th>연도</th>
				<th>가입 인원 수</th> 
				<th>최소포인트</th>
				<th>최대포인트</th>
				<th>포인트합계</th>
				<th>포인트평균</th>
			</tr>
		</thead>
		<tbody align="center">
			<%for(YearStatusDto yearStatusDto : yearlyList){ %>
			<tr>
				<td><%=yearStatusDto.getYear()%></td>
				<td><%=yearStatusDto.getCnt()%></td>
				<td><%=yearStatusDto.getMin()%></td>
				<td><%=yearStatusDto.getMax()%></td>
				<td><%=yearStatusDto.getSum()%></td>
				<td><%=yearStatusDto.getAvg()%></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</article>
</section>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>





