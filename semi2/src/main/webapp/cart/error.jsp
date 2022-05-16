<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="row container center">
	<label>장바구니는 최대 10개 상품까지 저장 가능합니다.</label>
</div>
<br><br>
<div class="row container center">
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn">홈 화면으로 가기</a>
		<a href="<%=request.getContextPath() %>/cart/list.jsp" class="btn">장바구니 목록보기</a>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
