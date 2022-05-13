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
		<lavel>Member</lavel><br>	
			<a href="<%=request.getContextPath()%>/admin/member_list.jsp">회원관리</a> &nbsp;&nbsp;&nbsp;<br><br>
		<lavel>Product</lavel><br>	
			<a href="<%=request.getContextPath()%>/product/product_admin_list.jsp">상품관리</a>&nbsp;&nbsp;&nbsp;<br><br>
		<lavel>Order</lavel><br>		
			<a href="<%=request.getContextPath()%>/admin/buy_list.jsp">주문관리</a>&nbsp;&nbsp;&nbsp;<br><br>
		<lavel>Notice</lavel><br>		
			<a href="<%=request.getContextPath()%>/board/write.jsp">게시판관리</a>&nbsp;&nbsp;&nbsp;<br><br>
		<lavel>Banner</lavel><br>		
			<a href="<%=request.getContextPath()%>/admin/banner.jsp">배너관리</a>&nbsp;&nbsp;&nbsp;<br><br>
		<lavel>Statistics</lavel><br>	
		<a href="<%=request.getContextPath()%>/admin/statistics.jsp">통계</a>&nbsp;&nbsp;&nbsp;<br><br>	
	</div>
</body>
</html>
	<jsp:include page="/template/footer.jsp"></jsp:include>