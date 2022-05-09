<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>존재하지 않는 상품번호입니다</h1>
<h2><a href="list.jsp">목록보기</a></h2>
<h2><a href="<%=request.getContextPath()%>/product/list.jsp">목록보기</a></h2>

<jsp:include page="/template/footer.jsp"></jsp:include>