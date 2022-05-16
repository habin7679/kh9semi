	<%@page import="semi2.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.MemberDao"%>
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
		</aside>
		
<article class= "float-left layer-2">
	<div class="row center"><br><br>
		<h1>삭제 실패</h1>
	</div>
	<div class="row center"><br><br>
		<h2>회원 삭제에 실패했습니다!</h2><br><br>
	</div>
	<div class="link link-btn">
	 <a href="member_list.jsp">돌아가기</a>
	 </div>
	 </article>
	 </section>
	 </div>