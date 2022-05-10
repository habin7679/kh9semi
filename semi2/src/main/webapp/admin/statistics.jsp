<%@page import="semi2.beans.YearStatusDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.YearStatusDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	YearStatusDao yearStatusDao = new YearStatusDao();
	List<YearStatusDto> yearlyList = yearStatusDao.selectList(); 
%>
    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>관리자 대시보드</h1>

	<h2>연도별 현황</h2>
	<table border="1" width="500">
		<thead>
			<tr>
				<th>연도</th>
				<th>가입 인원 수</th> 
				<th>최소포인트</th>
				<th>최대포인트</th>
				<th>포인트합계</th>
				<th>포인트평균</th>
			</tr>
		</thead>
		<tbody align="center">
			<%for(YearStatusDto yearStatusDto : yearlyList){ %>
			<tr>
				<td><%=yearStatusDto.getYear()%></td>
				<td><%=yearStatusDto.getCnt()%></td>
				<td><%=yearStatusDto.getMin()%></td>
				<td><%=yearStatusDto.getMax()%></td>
				<td><%=yearStatusDto.getSum()%></td>
				<td><%=yearStatusDto.getAvg()%></td>
			</tr>
			<%} %>
		</tbody>
	</table>

<jsp:include page="/template/footer.jsp"></jsp:include>





