<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  double basal1 = Double.parseDouble(request.getParameter("basal1"));
	   double basal2 = Double.parseDouble(request.getParameter("basal2"));
	   double kcal= Double.parseDouble(request.getParameter("kcal"));
	   double oneEat=Double.parseDouble(request.getParameter("oneEat"));
	   double protein=Double.parseDouble(request.getParameter("protein"));
	   double carbo=Double.parseDouble(request.getParameter("carbo"));
	   double fat=Double.parseDouble(request.getParameter("fat"));
	   
	   
%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/kal1.css">
	
<jsp:include page="/template/header.jsp"></jsp:include>

<table class="kal">
<thead>
<tr>
<th scope="row"> 회원님의 기초대사량</th>
<td> <%=basal1 %>kcal </td>
</tr>

<tr>
<th scope="row"> 활동대사량</th>
<td> <%=basal2 %>kcal </td>
</tr>

<tr>
<th scope="row"> 다이어트시 하루 권장섭취량</th>
<td> <%=kcal %>kcal </td>
</tr>

<tr>
<th scope="row"> 단백질</th>
<td> <%=protein %>g </td>
</tr>

<tr>
<th scope="row"> 탄수화물</th>
<td> <%=carbo %>g </td>
</tr>

<tr>
<th scope="row"> 지방</th>
<td> <%=fat %>g 입니다 </td>
</tr>

<tr>
<th scope="row"> 1일3식 기준 한끼 권장섭취량</th>
<td> <%=oneEat %>kcal </td>
</tr>

</table>
	<a href="" class="link link-btn">쇼핑하러가기</a>
</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>