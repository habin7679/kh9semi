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
		  <div><a href="<%=request.getContextPath() %>/buy/list.jsp">구매내역</a></div>
		  <div>
		  	<div class="content" style="margin: 0px; width:100%;">
				<div style="display: flex; width: 100%; flex-direction: column;">
					<div><a href="<%=request.getContextPath() %>/product/recent_product.jsp">최근 본 상품</a></div>
				
					<div id="recentProd" style="display: flex; width:100%; justify-content: space-around; ">
					
						<%-- <div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/sample.png"
					style="vertical-align: top;">
			</div> --%>
		
					</div>
				</div>
		  </div>
		  
		  <div><a href="<%=request.getContextPath() %>/delivery/delivery_list.jsp">배송지 관리</a></div>
		  <div><a href="#">정기배송 신청하기</a></div>
		  <div><a href="<%=request.getContextPath()%>/board/review_list.jsp?type=board_writer&keyword=<%=memberDto.getMemberId()%>">내 후기내역</a></div>
		  <div><a href="<%=request.getContextPath()%>/board/qna_list.jsp?type=board_writer&keyword=<%=memberDto.getMemberId()%>">내 문의내역</a></div>
		  
		  <div><a href="exit.jsp">회원 탈퇴하기</a></div>
	  

		  <table class="table">
		  	<tr><a href="edit.jsp">내 정보 변경하기</a></td>
		  	<tr><a href="<%=request.getContextPath() %>/buy/list.jsp">구매내역</a></tr>
		  	<tr><a href="<%=request.getContextPath() %>/product/recent_product.jsp">최근 본 상품</a></tr>
		  	<tr><a href="<%=request.getContextPath() %>/delivery/delivery_list.jsp">배송지 관리</a></tr>
		  	<tr><a href="<%=request.getContextPath()%>/board/review_list.jsp?type=board_writer&keyword=<%=memberDto.getMemberId()%>">내 후기내역</a></tr>
		  	<tr><a href="<%=request.getContextPath()%>/board/qna_list.jsp?type=board_writer&keyword=<%=memberDto.getMemberId()%>">내 문의내역</a>	</tr>  
		  	<tr><a href="exit.jsp">회원 탈퇴하기</a></tr>
		</table>

	  
	 </div>
	 </div>

	</div>


<jsp:include page="/template/footer.jsp"></jsp:include>