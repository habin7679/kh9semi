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

<div class="row float-container">
<div class="float-left layer-3">
<jsp:include page="/template/menu.jsp"></jsp:include>
</div>
<div class="float-left layer-2 ">
		<form action="delivery_insert.jsp">
		<div class="row center">
		<h1>배송지 관리</h1>
	<div class="row center">
		<button type="submit" class="btn">+ 신규배송지 추가</button>
	</div>
	</div>
	</form>
		<table class="table">
			<thead style="border: 1px">
				<tr>
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
					<td><%=deliveryDto.getDeliveryName() %></td><hr>
					<td>[대표배송지]<%=deliveryDto.getDeliveryPost() %>/<%=deliveryDto.getDeliveryBasicAddress() %><%=deliveryDto.getDeliveryDetailAddress() %></td>
					<td><%=deliveryDto.getDeliveryPhone() %></td>
					<td>
					<a href="<%=request.getContextPath()%>/delivery/delete.ez?deliveryPost=<%=deliveryDto.getDeliveryPost() %>" class="link link-btn">삭제</a>
					</td>
				</tr>
				<%} else{%>
				<tr>
					<td><%=deliveryDto.getDeliveryName() %></td>
					<td><%=deliveryDto.getDeliveryPost() %>/<%=deliveryDto.getDeliveryBasicAddress() %><%=deliveryDto.getDeliveryDetailAddress() %></td>
					<td><%=deliveryDto.getDeliveryPhone() %></td>
					<td>
					<a href="<%=request.getContextPath()%>/delivery/delete.ez?deliveryPost=<%=deliveryDto.getDeliveryPost() %>" class="link link-btn">삭제</a>
					<a href="<%=request.getContextPath()%>/delivery/update.ez?deliveryPost=<%=deliveryDto.getDeliveryPost()%>" class="link link-btn btn-primary">대표배송지로 설정</a>
					</td>
				</tr>
				<%} %>
				<%} %> 
			</tbody>
		</table>
	</div>

</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>