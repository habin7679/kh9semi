<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	String memberId=(String) session.getAttribute("member");
  	
	MemberDao memberDao= new MemberDao();
	MemberDto memberDto= memberDao.selectOne(memberId);
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		 $("input[name=memberPw]").blur(function (){
				var regex =/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
				var memberPw=$(this).val();
				var span=$(this).next("span");
				
				var judge= regex.test(memberPw);
				if(!judge){
					$(this).next().css("color", "red");
					$(this).next("span").text("비밀번호를 형식에 맞게 작성하세요")
					return false;
				}
				else{
					$(this).next().css("color", "green");
					span.text("사용가능한 비밀번호 입니다");
					return true;
				}
			
	        });
				
	     $("input[name=memberPw2]").blur(function (){
	         var span = $(this).next("span");
	         var judge1= $("input[name=memberPw]").val().length>0;
	         var judge2=$("input[name=memberPw]").val()==$(this).val();
	         if(judge1&&judge2){
	         	$(this).next().css("color", "green");
	             $(this).next("span").text("비밀번호가 일치합니다");
	             return true;
	         }
	         else{
	         	$(this).next().css("color", "red");
	         	$(this).next("span").text("비밀번호가 일치하지 않습니다");
	             return false;
	         }
			});
	});
</script>

<form action="edit.ez" method="post">
	<div>
	    <div class="row center">
	        <h1>개인정보 변경</h1>
	    </div>
	    <div class="row">
	        <label>닉네임</label>
	        <input type="text" name="memberNick" autocomplete="off" value="<%=memberDto.getMemberNick()%>">
	    </div>
	    <div class="row">
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" value="<%=memberDto.getMemberBirth()%>">
	    </div>
	    <div class="row">
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" value="<%=memberDto.getMemberPhone()%>">
	    </div>
	    <div class="row">
	        <label>이메일</label>
	        <input type="email" name="memberEmail" autocomplete="off" value="<%=memberDto.getMemberEmail()%>">
	    </div>
	    <div class="row">
	        <label>주소</label><br>
	        <input type="text" name="memberPost" autocomplete="off" placeholder="우편번호" value="<%=memberDto.getMemberPost()%>">
	        <a href="#" class="link link-btn">검색</a>
	    </div>
	    <div class="row">
	        <input type="text" name="memberBasicAddress" autocomplete="off" placeholder="기본주소" value="<%=memberDto.getMemberBasicAddress()%>">
	    </div>
	    <div class="row">
	        <input type="text" name="memberDetailAddress" autocomplete="off" placeholder="상세주소" value="<%=memberDto.getMemberDetailAddress()%>">
	    </div>
	     <div class="row">
	        <label>비밀번호</label>
	        <input type="password" name="memberPw">
	        <span></span>
	    </div>
	    <div class="row">
	        <label>비밀번호 확인</label>
	        <input type="password" name="memberPw2">
	        <span></span>
	    </div>
	    <div class="row">
	        <button type="submit">정보 변경하기</button>
	    </div>
	    
		<% if(request.getParameter("error") != null){ %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		<%} %>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>