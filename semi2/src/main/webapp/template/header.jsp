<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//세션에 login 이라는 이름으로 저장된 데이터를 꺼낸다
	String memberId = (String) session.getAttribute("member");
	//memberId가 있으면 로그인 상태라고 판정하고 없으면 로그아웃 상태라고 판정
	boolean login = memberId != null;
	
	//관리자 검사
	String auth = (String)session.getAttribute("admin");
	boolean admin = auth != null && auth.equals("관리자");
%>    


<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글 폰트 CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css"> --%>

<!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>


    <meta charset="UTF-8">
<title>이지어트 메인 페이지</title>

</head>
<body>

	<!-- 4줄 1칸 테이블 -->
	<table border="1" width="1000" align="center">
	
		<!-- 정보 확인용 공간 -->
		<tr>
			<td>
				memberId = <%=memberId%> , login = <%=login%> , Session ID = <%=session.getId()%>,
				auth = <%=auth%> , admin = <%=admin%>
			</td>
		</tr>

		<!-- 헤더(header) -->
		<tr height="120">
			<td align="center">
				<h1>이지어트 메인 페이지</h1>
			</td>
		</tr>

		<!-- 메뉴(nav, navbar) -->
		<tr>
			<td>
				<!-- (주의) 템플릿 페이지에서는 절대 경로로 모든 것을 작성해야 한다 -->
				<a href="<%=request.getContextPath()%>">로그인</a>&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/olympic/list.jsp">장바구니</a> &nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/member/mypage.jsp">마이페이지</a> &nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/exam/list.jsp">주문/배송 조회</a> &nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/product/list.jsp">상품관리</a> &nbsp;&nbsp;&nbsp;
				<li>
        			<a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a>
        			 <ul>
        				<li><a href="<%=request.getContextPath()%>/board/notice_list.jsp">공지게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/free_list.jsp">자유게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/tip_list.jsp">팁게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/review_list.jsp">후기게시판</a></li>
        				<li><a href="<%=request.getContextPath()%>/board/qna_list.jsp">문의게시판</a></li>
        			</ul>
        		</li>
				
				<%-- 로그인 상태에 따라 다른 메뉴를 출력 --%>
				<% if(login){ %>
				<a href="<%=request.getContextPath()%>/member/mypage.jsp">내정보</a>&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/member/logout.kh">로그아웃</a> &nbsp;&nbsp;&nbsp;
				<% } else { %>
				<a href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a> &nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a> &nbsp;&nbsp;&nbsp;
				<% } %>
				
				<%-- 관리자라면 관리 메뉴를 출력 --%>
				<%if(admin){ %>
				<a href="<%=request.getContextPath()%>/admin/list.jsp">회원관리</a>&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath()%>/admin/statistics.jsp">사이트관리</a>&nbsp;&nbsp;&nbsp;
				<%} %>
			</td> 
		</tr>
		
		<!-- 섹션(section) or 컨테이너(container) -->
		<tr height="450">
			<td align="center" valign="top">
				<br><br>