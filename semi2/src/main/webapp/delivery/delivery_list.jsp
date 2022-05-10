<%@page import="java.util.List"%>
<%@page import="semi2.beans.DeliveryDto"%>
<%@page import="semi2.beans.DeliveryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String memberId=(String)session.getAttribute("member"); 

DeliveryDao delivaeryDao= new DeliveryDao();
List<DeliveryDto> list=delivaeryDao.select(memberId);
%> 
<form action="delivery_insert.jsp">
<div>
	<h1>배송지 관리</h1>
	<div>
		<button type="submit">+ 신규배송지 추가</button>
	</div>
	
	<div>
		<table>
			<thead>
				<tr>
					<th>선택</th>
					<th>받는분</th>
					<th>배송주소</th>
					<th>연락처</th>
					<th>관리</th>
				</tr>
			</thead>
			
			<tbody>
				<%for(DeliveryDto deliveryDto :list){ %>
				
				<%if(deliveryDto.getDeliveryMenu().equals("대표배송지")){ %>
				<tr>
					<td><input type="checkbox"></td>
					<td><%=deliveryDto.getDeliveryName() %></td>
					<td>[대표배송지]<%=deliveryDto.getDeliveryPost() %><%=deliveryDto.getDeliveryBasicAddress() %><%=deliveryDto.getDeliveryDetailAddress() %></td>
					<td><%=deliveryDto.getDeliveryPhone() %></td>
					<td><a href="#">삭제</a></td>
				<hr>
				</tr>
				<%} else{%>
				<tr>
					<td><input type="checkbox"></td>
					<td><%=deliveryDto.getDeliveryName() %></td>
					<td><%=deliveryDto.getDeliveryPost() %><%=deliveryDto.getDeliveryBasicAddress() %><%=deliveryDto.getDeliveryDetailAddress() %></td>
					<td><%=deliveryDto.getDeliveryPhone() %></td>
					<td><a href="#">삭제</a></td>
				<hr>
				</tr>
				<%} %>
				<%} %> 
			</tbody>
		</table>
	</div>
</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>