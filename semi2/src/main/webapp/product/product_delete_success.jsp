<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w600 m30">
<h1>삭제가 완료되었습니다</h1>

<h2><a href="<%=request.getContextPath()%>/product/product_admin_list.jsp">목록보기</a></h2><br>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>