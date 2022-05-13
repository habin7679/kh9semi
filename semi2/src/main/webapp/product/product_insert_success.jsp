<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공</title>
<jsp:include page="/template/header.jsp"></jsp:include>
</head>
<body>
  <div class="row center m30">
<h1>입력 성공 열심히 파세요</h1>
<h2><a href="<%=request.getContextPath()%>/product/product_admin_list.jsp">목록보기</a></h2>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>