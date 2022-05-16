<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
	
	%>
<style>
.menu{
	float: left;
	width:"20%";
	height: 1000px;
	border: 1px;
}

</style>
	
    <div class="menu row w300">
            <h1> 마이페이지</h1>
                <div class="row center">
                	<a href="<%=request.getContextPath() %>/buy/list.jsp?<%=memberDto.getMemberId()%>">구매내역</a></div>
                	  <div class="row center"><a href="<%=request.getContextPath()%>/dict/main.jsp">칼로리 처방받기</a></div>

                <h2>활동관리</h2>
                <div class="row center"><a href="#">최근 본 상품</a></div>
                <div class="row center"><a href="<%=request.getContextPath()%>/board/review_list.jsp?type=board_writer&keyword=<%=memberDto.getMemberId()%>">내 후기내역</a></div>
                <div class="row center"><a href="<%=request.getContextPath()%>/board/productqna_list.jsp?type=board_writer&keyword=<%=memberDto.getMemberId()%>">내 상품문의내역</a></div>
            
              
               <h2>내 정보관리</h2>
               <div class="row center"><a href="<%=request.getContextPath() %>/member/edit.jsp">내 정보 변경하기</a></div>
               <div class="row center"><a href="<%=request.getContextPath() %>/delivery/delivery_list.jsp">배송지 관리</a></div>
               <div class="row center"><a href="<%=request.getContextPath() %>/member/exit.jsp">회원 탈퇴하기</a></div>
               <div class="row center"><a href="<%=request.getContextPath() %>/board/qna_list.jsp" class="link link-btn"><h1>1:1문의하기</h1></a></div>
      </div>
 
