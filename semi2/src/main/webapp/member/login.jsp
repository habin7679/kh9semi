<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	String referer=request.getHeader("Referer");
%>



	 <div class="container w500 m30">
            <div class="login-form">
                <form action="login.ez" method="post">
                <h1>LOGIN</h1>
            <%if(referer !=null){%>
                <input type="hidden" name="referer" value="<%=referer %>">
            <%}%>
            
            <div class="input-area">
                <input type="text" name="memberId" autocomplete="off"  id="id" required>
                <label for="id">ID</label>
            </div>
            
            <div class="input-area">
                <input type="password" name="memberPw" pw="pw" required>
                <label for="pw">PASSWORD</label>
            </div>
            
            <div class="row">
                <input type="submit" value="로그인" class="btn fill btn-primary">
            </div>
            <% if(request.getParameter("error") !=null){ %>
            <div class="row center">
                <span style="color:red;">로그인 정보가 일치하지 않습니다</span>
            </div>
            <%} %>
            
            <div class="row">
                <a href="find_id.jsp" class=" link link-btn fill" style="width:49.5%">아이디 찾기</a>
                <a href="Change_pw.jsp" class=" link link-btn fill" style="width:49.5%">비밀번호 찾기</a>
            </div>
    
            
             <div>
                <a href="join.jsp" class=" link link-btn fill">회원가입</a>
            </div>
        </div>
        </form>
        </div>

	<form action="login.ez" method="post">
	<div class="container w500 m40">
		<div class="row">
			<h1>LOGIN</h1>
		</div>
		<%if(referer !=null){%>
			<input type="hidden" name="referer" value="<%=referer %>">
		<%}%>
		
		<div class="row">
			<input type="text" name="memberId" autocomplete="off" placeholder="아이디" class="form-input fill input-underline">
		</div>
		
		<div class="row">
			<input type="password" name="memberPw" placeholder="비밀번호" class="form-input fill input-underline">
		</div>
		
		<div class="row">
			<input type="submit" value="로그인" class="btn fill btn-primary">
		</div>
		<% if(request.getParameter("error") !=null){ %>
		<div class="row">
			<span style="color:red;">로그인 정보가 일치하지 않습니다</span>
		</div>
		<%} %>
		
		<div class="row">
			<a href="find_id.jsp" class=" link link-btn fill" style="width:49.5%">아이디 찾기</a>
			<a href="Change_pw.jsp" class=" link link-btn fill" style="width:49.5%">비밀번호 찾기</a>
		</div>

		
		 <div>
			<a href="join.jsp" class=" link link-btn fill">회원가입</a>
		</div>
	</div>
	</form>

	
<jsp:include page="/template/footer.jsp"></jsp:include>