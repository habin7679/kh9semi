<%@page import="semi2.beans.PayingDao"%>
<%@page import="semi2.beans.PayingDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	int p;
		try {
			p = Integer.parseInt(request.getParameter("p"));
			if(p <= 0)	throw new Exception();
		}
		catch(Exception e){
			p = 1;
		}
	
	int s;
		try {
			s = Integer.parseInt(request.getParameter("s"));
			if(s <= 0) throw new Exception();
		}
		catch(Exception e){
			s = 10;
		}
%>

<%
	boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
	PayingDao payingDao = new PayingDao();
	List<PayingDto> list;
		if (isSearch) {
			list = payingDao.selectListByPaging(p, s, type, keyword);
		} else {
			list = payingDao.listAllByPaging(p, s);
		}
%>
<%
	int count;
	if(isSearch){
		count = payingDao.countByPaging(type, keyword);
	}
	else{
		count = payingDao.countByPaging();
	}
	
	int lastPage = (count + s - 1) / s;
	
	int blockSize = 10;
	
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<div class="container w1000 m30">
		<div class="row center">
			<h1>
				<a href="order_list.jsp">주문 목록</a>
			</h1>
		</div>
		<form action="order_list.ez" method="get">
	
			<%
			if (type == null || type.equals("member_id")) {
			%>
			<select name="type" class="form-input input-round">
				<option value="member_id" selected>아이디</option>
				<option value="order_no">주문번호</option>
			</select>
			<%
			} else {
			%>
			<select name="type" class="form-input input-round">
				<option value="member_id">아이디</option>
				<option value="order_no" selected>주문번호</option>
			</select>
			<%
			}
			%>
	
			<%
			if (isSearch) {
			%>
			<input type="search" name="keyword" class="form-input input-round"
				placeholder="검색어" value="<%=keyword%>">
			<%
			} else {
			%>
			<input type="search" name="keyword" class="form-input input-round"
				placeholder="검색어">
			<%
			}
			%>
	
			<input type="submit" value="검색" class="btn btn-primary">
		</form>
	</div>


<!-- 검색결과 -->
	<%
	if (list.isEmpty()) {
	%>
	<div class="row center">
		<h2>결과가 존재하지 않습니다</h2>
	</div>
	<%
	} else {
	%>
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>회원아이디</th>
					<th>주문일</th>
					<th>배송희망일</th>
					<th>배송예정시간</th>
					<th>상세</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (PayingDto payingDto : list) {
				%>
				<tr>
					<td><%=payingDto.getOrderNo()%></td>
					<td><%=payingDto.getMemberId()%></td>
					<td><%=payingDto.getPayingDate()%></td>
					<td><%=payingDto.getPayingDeliveryDate()%></td>
					<td><%=payingDto.getPayingDeliveryTime()%></td>
					<td><a href="order_detail.jsp?orderNo=<%=payingDto.getOrderNo()%>" class="link">상세보기</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div>
	<%
	}
	%>
	</div>
	<div class="row center pagination">
		<%if(p > 1){ %>
			<%if(isSearch){ %>
			<a href="order_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="order_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
			<a href="order_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="order_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(isSearch){ %>
				<%if(i == p){ %>
				<a class="active" href="order_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="order_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="order_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="order_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<%if(endBlock < lastPage){ %>
			<%if(isSearch){ %>
			<a href="order_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="order_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(isSearch){ %>
			<a href="order_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="order_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
		
	</div>
	

<jsp:include page="/template/footer.jsp"></jsp:include>