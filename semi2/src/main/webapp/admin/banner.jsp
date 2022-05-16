<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이지어트</title>
</head>
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
    </style>
</head>
<body>
	<div class="container w1000 m30 ">
	<section>
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
	
		<div class="row center">
		<h1>배너 업로드</h1><br><br><br>
		</div>
		<div class="row center">
			<img src="<%=request.getContextPath()%>/image/Banner1.png"
			style="width: 400px; height: 150px; text-align: center; display: block; margin-left: auto; margin-right: auto;">
		</div>
		<div class="row center">
			<img src="<%=request.getContextPath()%>/image/Banner2.png"
			style="width: 400px; height: 150px; text-align: center; display: block; margin-left: auto; margin-right: auto;">
		</div>
		<div class="row center">
			<img src="<%=request.getContextPath()%>/image/Banner3.png"
			style="width: 400px; height: 150px; text-align: center; display: block; margin-left: auto; margin-right: auto;">
		</div>
	<form action="add.ez" method="post"  enctype="multipart/form-data">
					<input type="file" name="bannerImg">
				
					<input type="submit" value="등록" class="btn btn-primary">
	</form>
	</div>

</article>
</section>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>

