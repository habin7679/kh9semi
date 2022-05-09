<%@page import="semi2.beans.DeliveryDto"%>
<%@page import="semi2.beans.DeliveryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String memberId=(String)session.getAttribute("member"); 

DeliveryDao delivaeryDao= new DeliveryDao();
DeliveryDto delivaryDto=delivaeryDao.selectOne(memberId);
%>
<form action="delivery_insert.jsp">
<div>
	<div>
		<button type="submit">+ 신규배송지 추가</button>
	</div>
</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>