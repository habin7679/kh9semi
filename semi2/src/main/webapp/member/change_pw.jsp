<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	String memberId=request.getParameter("memberId");
%>
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
					return;
				}
				else{
					$(this).next().css("color", "green");
					span.text("사용가능한 비밀번호 입니다");
				}
			
	        });
				
	     $("input[name=memberPw2]").blur(function (){
	         var span = $(this).next("span");
	         var judge1= $("input[name=memberPw]").val().length>0;
	         var judge2=$("input[name=memberPw]").val()==$(this).val();
	         if(judge1&&judge2){
	         	$(this).next().css("color", "green");
	             $(this).next("span").text("비밀번호가 일치합니다");
	         }
	         else{
	         	$(this).next().css("color", "red");
	         	$(this).next("span").text("비밀번호가 일치하지 않습니다");
	             return;
	         }
			});
	});
</script>

	<form action="change_pw.ez" method="post">
	<div>
		<div>
			<h1>비밀번호 변경</h1>
		</div>
		
		<div>
			<input type="hidden" name="memberId" value="<%=memberId %>">
		</div>
		
		<div>
			<label>새 비밀번호</label>
			<input type="text" name="memberPw" placeholder="첫자 영어 대문자,영어, 숫자, 특수문자 8~16자로 작성">
			<span></span>
		</div>
		
		<div>
			<label>새 비밀번호 확인</label>
			<input type="text" name="memberPw2" placeholder="첫자 영어 대문자,영어, 숫자, 특수문자 8~16자로 작성">
			<span></span>
		</div>
		
		<div>
			<input type="submit" value="비밀번호  변경하기">
		</div>
	</div>
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>