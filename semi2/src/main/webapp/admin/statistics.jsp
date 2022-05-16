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
        width:80%;
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
        padding-right:130px;
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
     <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        $(function () {
            //label : X축에 표시될 항목들
            var labels = [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
            ];

            //data : 차트에 표시될 데이터
            var data = {
                labels: labels,
                datasets: [{
                    label: 'My First dataset',//범례
                    backgroundColor: 'rgb(255, 99, 132)',//배경색
                    borderColor: 'rgb(255, 99, 132)',//테두리색
                    data: [0, 10, 5, 2, 20, 30, 45],//데이터
                }]
            };

            //차트의 형태 등을 설정(옵션, 환경설정)
            var config = {
                type: 'bar',//차트의 모양
                data: data,//차트 데이터
                options: {}
            };

            //차트 생성 구문
            var myChart = new Chart(
                document.querySelector('#myChart'),//차트 적용 대상
                config//차트 옵션
            );
        });
    </script>
</head>
<body>
<div class="container w1000 m30">
	<section class="p">
		<aside class="float-left layer-5">
		<label><a href="<%=request.getContextPath()%>/admin/admin.jsp">Member</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/product/product_admin_list.jsp">Product</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/buy_list.jsp">Order</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/order_list.jsp">Delivery</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/board_list.jsp">Board</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/board_write.jsp">Write</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/banner.jsp">Banner</a></label><br><br><br><br>
		<label><a href="<%=request.getContextPath()%>/admin/statistics.jsp">Statistics</a></label><br><br><br><br>	
		</aside>
		
<article class= "float-left layer-2">
   <div class="container w500 m30">
        <div class="row center m30">
            <h1>상반기 판매 현황</h1>
        </div>
        <div class="row">
            <canvas id="myChart"></canvas>
        </div>
    </div>
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





