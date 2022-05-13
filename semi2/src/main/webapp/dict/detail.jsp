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
<jsp:include page="/template/header.jsp"></jsp:include>
<div>
회원님의 기초대사량 : <%=basal1 %>kcal,
활동대사량 : <%=basal2 %>kcal,
다이어트시 하루 권장섭취량 : <%=kcal %>kcal<br>
단백질:<%=protein %>g,
탄수화물:<%=carbo %>g,
지방:<%=fat %>g 입니다. <br>
1일3식 기준 한끼 권장섭취량 :<%=oneEat %>kcal

<div>
	<a href="" class="link link-btn">쇼핑하러가기</a>
</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>