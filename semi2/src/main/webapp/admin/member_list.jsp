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
<%
	request.setCharacterEncoding("UTF-8");
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
boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
	MemberDao memberDao = new MemberDao();
	List<MemberDto> list;
		if (isSearch) {
			list = memberDao.selectListByPaging(p, s, type, keyword);
		} else {
			list = memberDao.listAllByPaging(p, s);
		}
%>
<%
	int count;
	if(isSearch){
		count = memberDao.countByPaging(type, keyword);
	}
	else{
		count = memberDao.countByPaging();
	}
	
	int lastPage = (count + s - 1) / s;
	
	int blockSize = 10;
	
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>

<%-- ?????? --%>
	<div>
		<div class="row center">
			<h1>?????? ??????</h1>
		</div>
		<form action="member_list.jsp" method="get">
	
			<%
			if (type == null || type.equals("member_id")) {
			%>
			<select name="type" class="form-input input-round">
				<option value="member_id" selected>?????????</option>
				<option value="member_grade">????????????</option>
			</select>
			<%
			} else {
			%>
			<select name="type" class="form-input input-round">
				<option value="member_id">?????????</option>
				<option value="member_grade" selected>????????????</option>
			</select>
			<%
			}
			%>
	
			<%
			if (isSearch) {
			%>
			<input type="search" name="keyword" class="form-input input-round"
				placeholder="?????????" value="<%=keyword%>">
			<%
			} else {
			%>
			<input type="search" name="keyword" class="form-input input-round"
				placeholder="?????????">
			<%
			}
			%>
	
			<input type="submit" value="??????" class="btn btn-primary">
		</form>
	</div>


<!-- ???????????? -->
	<%
	if (list.isEmpty()) {
	%>
	<div class="row center"><br><br>
		<h2>??????????????? ???????????? ????????????!</h2><br><br>
	</div>
	<div class="link link-btn">
	 <a href="member_list.jsp">???????????? ????????????</a>
	 </div>
	<%
	} else {
	%>
	<div class="row right">
		<a href="member_insert.jsp" class="link link-btn">????????????</a>
	</div>
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>?????????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>????????????</th>
					<th>???????????????</th>
					<th>??????</th>
					<th>??????</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (MemberDto memberDto : list) {
				%>
				<tr>
					<td><%=memberDto.getMemberId()%></td>
					<td><%=memberDto.getMemberName()%></td>
					<td><%=memberDto.getMemberNick()%></td>
					<td><%=memberDto.getMemberPhone()%></td>
					<td><%=memberDto.getMemberPoint()%></td>
					<td><%=memberDto.getMemberGrade()%></td>
					
					<td><a href="member_detail.jsp?memberId=<%=memberDto.getMemberId()%>" class="link">
					<img src="<%=request.getContextPath()%>/image/detail.png" width="20" height="20">
					</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div>
	<%
	}
	%>
	</div>
	<br>
	<div class="row center pagination">
		<%if(p > 1){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="member_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="member_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(isSearch){ %>
				<%if(i == p){ %>
				<a class="active" href="member_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="member_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="member_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="member_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<%if(endBlock < lastPage){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="member_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(isSearch){ %>
			<a href="member_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="member_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
</div>
</article>
</section>
</body>
<footer>
<jsp:include page="/template/footer.jsp"></jsp:include>
</footer>