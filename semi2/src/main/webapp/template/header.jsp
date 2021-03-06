<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	//세션에 login 이라는 이름으로 저장된 데이터를 꺼낸다
	String memberId = (String) session.getAttribute("member");
	//memberId가 있으면 로그인 상태라고 판정하고 없으면 로그아웃 상태라고 판정
	boolean login = memberId != null;
	
	
	MemberDao memberDao=new MemberDao();
	MemberDto memberDto=memberDao.selectOne(memberId);
	
	//관리자 검사
		String admin = (String)session.getAttribute("admin");
		boolean auth = admin != null && memberDto.getMemberGrade().equals("관리자");
%>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/reset1.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/commons.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css">


<%-- 
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/test/commons.css">
    --%>
<title>이지어트 메인 페이지</title>

<style>
/* 중간 사이드 바!! */
ul.bar, ul.bar ul {
	list-style: none;
	padding: 0;
	margin: 0;
}
ul.bar::after {
	content: "";
	display: block;
	clear: both;
}
ul.bar>li {
	float: left;
	width: 300px;
}
ul.bar ul {
	display: none;
}
ul.bar li:hover>ul {
	display: block;
}
ul.bar li {
	position: relative;
}
ul.bar ul {
	position: absolute;
	top: 100%;
	left: 0%;
}
ul.bar ul {
	width: 100%;
}
ul.bar {
	font-size: 16px;
}
ul.bar, ul.bar ul {
	background-color: #009432;
}
ul.bar li {
	padding: 0.35em;
	text-align: center;
}
ul.bar a {
	text-decoration: none;
	color: white;
}
/*커서 올리면 바뀌는 색*/
ul.bar li:hover {
	background-color: #007D2A;
}
ul.bar a {
	display: block;
	/*width: 150%;*/
}
/* 3차메뉴 이상 선택 */
ul.bar>li>ul ul {
	top: 0%;
	left: 100%;
}
ul.bar a {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
		<!-- 정보 확인용 공간 -->
		<table>
		<tr>
			<td>
				memberId = <%=memberId%> , login = <%=login%> , Session ID = <%=session.getId()%>,
				auth = <%=auth%> , admin = <%=admin%>
			</td>
		</tr>
		</table>

		<!-- 헤더(header) -->
		  <div class="wrap">
        <div class="intro_bg">
            <div class="header">
                <div >
                  
                </div>
                <ul>

                <ul class="nav">

				<%-- 관리자라면 관리 메뉴를 출력 --%>
						<div>
							<% if(login){ %>
							<%=memberDto.getMemberNick()%>님 환영합니다! &nbsp;&nbsp;&nbsp;
				</div>
				
				<%if(auth){ %>
				<a href="<%=request.getContextPath()%>/admin/admin.jsp">관리자페이지</a>&nbsp;&nbsp;&nbsp;
				
				<%} %>
						<a href="<%=request.getContextPath()%>/member/logout.ez">로그아웃</a>
						&nbsp;&nbsp;&nbsp;
				
						<% } else { %>

						<a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
						&nbsp;&nbsp;&nbsp;
						<a href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a>
						&nbsp;&nbsp;&nbsp;
						<% } %>
						<a href="<%=request.getContextPath()%>/member/mypage.jsp">마이페이지</a>
						&nbsp;&nbsp;&nbsp;
						<a href="<%=request.getContextPath()%>/buy/list.jsp">주문/배송조회</a>
						&nbsp;&nbsp;&nbsp;
					<br><br>
					</ul>
					<ul class="nav">
					<a href="<%=request.getContextPath()%>/buy/list.jsp">찜목록</a>	&nbsp;&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>/buy/list.jsp">장바구니</a>
				</ul>
			</div>
		</div>	
		</div>
		<a href="<%=request.getContextPath()%>/index.jsp">
			<div class="content" style="height: 100px; justify-content: center;">
				<br><img src="<%=request.getContextPath()%>/image/logo.png"
					style="width: 250px; height: 100px;">
		</a> &nbsp;&nbsp;&nbsp;
      </div>
		<br><br>
        </div>
          <div class="content">
            <ul class="bar" style="width:100%;display:flex;justify-content:space-between;">
                <li>
                    <a href="<%=request.getContextPath()%>#">PRODUCT</a>
                    <ul style="z-index: 100;">
						
        				<li><a href="<%=request.getContextPath()%>/product/product_user_list.jsp?product_sort=닭가슴살">닭가슴살</a></li>
        				<li><a href="<%=request.getContextPath()%>/product/product_user_list.jsp?product_sort=샐러드">샐러드</a></li>
        				<li><a href="<%=request.getContextPath()%>/product/product_user_list.jsp?product_sort=소고기">소고기</a></li>
        				<li><a href="<%=request.getContextPath()%>/product/product_user_list.jsp?product_sort=간식">간식</a></li>
        				<li><a href="<%=request.getContextPath()%>/product/product_user_list.jsp?product_sort=도시락">도시락</a></li>
                    </ul>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>#">칼로리사전</a>
                    <ul style="z-index: 100;">
        				<li><a href="<%=request.getContextPath()%>/dict/main.jsp">칼로리처방</a></li>
                    </ul>
                </li>
                <li>
        			<a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a>
        			 <ul>
        				<li><a href="<%=request.getContextPath()%>/board/notice_list.jsp">공지게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/free_list.jsp">자유게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/review_list.jsp">후기게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/tip_list.jsp">팁게시판</a></li>
        			</ul>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>#">고객센터</a>
                    <ul style="z-index: 100;">
        				<li><a href="<%=request.getContextPath()%>/board/qna_list.jsp">1:1 고객문의</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/productqna_list.jsp">상품문의</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        


			</td> 
		</tr>
		
		<!-- 섹션(section) or 컨테이너(container) -->
		<tr height="450">
			<td align="center" valign="top">
				<br><br><br><br>