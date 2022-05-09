<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
%>

<%-- 처리 --%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>정보 수정 완료!</h1>
<h2><a href="detail.jsp?no=<%=no%>">상세보기</a></h2>
<h2><a href="list.jsp">목록보기</a></h2>

<jsp:include page="/template/footer.jsp"></jsp:include>