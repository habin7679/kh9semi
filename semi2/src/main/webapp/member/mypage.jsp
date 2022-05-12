<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
	
	%>
	 <div class="container w500">
		  <div class="row center">
		  	<h1><%=memberDto.getMemberNick()%><h3>님 반갑습니다</h3></h1>
		  	<%=memberDto.getMemberPoint() %>point
		  </div>
		  <table class="table">
		  	<tr><a href="edit.jsp">내 정보 변경하기</a></td>
		  	<tr><a href="<%=request.getContextPath() %>/buy/list.jsp">구매내역</a></tr>
		  	<tr><a href="#">최근 본 상품</a></tr>
		  	<tr><a href="<%=request.getContextPath() %>/delivery/delivery_list.jsp">배송지 관리</a></tr>
		  	<tr><a href="<%=request.getContextPath()%>/board/my_review_list.jsp">내 후기내역</a></tr>
		  	<tr><a href="<%=request.getContextPath()%>/board/my_qna_list.jsp">내 문의내역</a>	</tr>  
		  	<tr><a href="exit.jsp">회원 탈퇴하기</a></tr>
		</table>
	  
	 </div>
	
	

<jsp:include page="/template/footer.jsp"></jsp:include>