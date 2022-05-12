<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  double basal1 = Double.parseDouble(request.getParameter("basal1"));
	   double basal2 = Double.parseDouble(request.getParameter("basal2"));
	   double kcal= Double.parseDouble(request.getParameter("kcal"));
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%=basal1 %>
<%=basal2 %>
<%=kcal %>
<jsp:include page="/template/footer.jsp"></jsp:include>