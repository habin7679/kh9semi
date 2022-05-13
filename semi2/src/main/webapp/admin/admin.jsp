<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
	<div>
		<label>Member</label><br>	
			<a href="<%=request.getContextPath()%>/admin/member_list.jsp">회원관리</a> &nbsp;&nbsp;&nbsp;<br><br>
		<label>Product</label><br>	
			<a href="<%=request.getContextPath()%>/product/product_admin_list.jsp">상품관리</a>&nbsp;&nbsp;&nbsp;<br><br>
		<label>Order</label><br>		
			<a href="<%=request.getContextPath()%>/admin/order_list.jsp">주문관리</a>&nbsp;&nbsp;&nbsp;<br><br>
			<a href="<%=request.getContextPath()%>/admin/buy_list.jsp">배송관리</a>&nbsp;&nbsp;&nbsp;<br>
		<label>Notice</label><br>		
			<a href="<%=request.getContextPath()%>/board/list.jsp">게시글관리</a>&nbsp;&nbsp;&nbsp;<br>
			<a href="<%=request.getContextPath()%>/board/write.jsp">게시글작성</a>&nbsp;&nbsp;&nbsp;<br><br>
		<label>Banner</label><br>		
			<a href="<%=request.getContextPath()%>/admin/banner.jsp">배너관리</a>&nbsp;&nbsp;&nbsp;<br><br>
		<label>Statistics</label><br>	
		<a href="<%=request.getContextPath()%>/admin/statistics.jsp">통계</a>&nbsp;&nbsp;&nbsp;<br><br>	
	</div>
</body>
</html>
	<jsp:include page="/template/footer.jsp"></jsp:include>