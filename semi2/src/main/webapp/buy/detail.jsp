<%@page import="semi2.beans.PayingDto"%>
<%@page import="semi2.beans.PayingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("member");
	int oNo = Integer.parseInt(request.getParameter("orderNo"));
	PayingDao payingDao = new PayingDao();
	PayingDto payingDto = payingDao.selectOne(oNo);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div>
	주문일: <%=payingDto.getPayingDate() %>
</div>
<div>
	수령인: <%=payingDto.getPayingName() %>
</div>
<div>
	연락처: <%=payingDto.getPayingPhone() %>
</div>
<div>
	우편변호: <%=payingDto.getPayingPost() %>
</div>
<div>
	기본주소: <%=payingDto.getPayingBasicAddress() %>
</div>
<div>
	상세주소: <%=payingDto.getPayingDetailAddress() %>
</div>
<div>
	배송희망일: <%=payingDto.getPayingDeliveryDate() %>
	배송희망시간: <%=payingDto.getPayingDeliveryTime()%>시
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>