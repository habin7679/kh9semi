<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<title>이지어트</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String memberId = request.getParameter("memberId");
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectOne(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script type="text/javascript">
        $(function(){

     
            var status = {
              
                id : false , 
                nickname : false
            };


            $("input[name=memberId]").blur(function(){
                
                var regex = /[a-z][a-z0-9]{7,19}/;
                var memberId = $(this).val();

                var judge = regex.test(memberId);
                if(!judge) {
                	$(this).next().css("color","red");
                    $(this).next("span").text("아이디를 형식에 맞게 작성하세요");
                    status.id = false;
                    return;
                }

                var that = this;

                $.ajax({
                    url:"http://localhost:8080/semi2/ajax/id.ez?memberId="+memberId,
                    type:"get",
                    success:function(resp) {
                        //resp는 "NNNNN" 또는 "NNNNY"일 것이다
                        if(resp == "N"){
                        	$(that).next().css("color", "red");
                        	$(that).next("span").text("이미 사용중인 아이디입니다");
                            status.id = false;
                        }
                        else if(resp == "Y"){
                            $(that).next().css("color", "green");
                        	$(that).next("span").text("사용 가능한 아이디입니다");
                            status.id = true;
                        }
                    }
                });
            });
            
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

            $("input[name=memberNick]").blur(function(){
                var regex = /[가-힣0-9]{2,10}/;
                var memberNick = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(memberNick);
                if(!judge){
                    span.css("color","red");
                	span.text("형식에 맞는 닉네임을 사용하세요");
                    status.nickname = false;
                    return;
                } 

                $.ajax({
                    url:"http://localhost:8080/semi2/ajax/nick.ez?memberNick="+memberNick,
                    type:"post",
                    data:{
                        memberNick : memberNick
                    },
                    success:function(resp) {
                        if(resp === "NY") {
                        	span.css("color","green");
                        	span.text("사용 가능한 닉네임입니다");
                            status.nickname = true;                       
                        }
                        else if(resp === "NN") {
                            span.text("사용 불가능한 닉네임입니다");
                            status.nickname = false;
                        }
                    }
                });
            });

        });
    </script>
	
	<!-- Kakao 우편 API-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById('sample6_postcode').value = data.zonecode;
                    $("input[name=memberPost]").val(data.zonecode);
                    //document.getElementById("sample6_address").value = addr;
                    $("input[name=memberBasicAddress]").val(addr);

                    // 커서를 상세주소 필드로 이동한다.
                    //document.getElementById("sample6_detailAddress").focus();
                    $("input[name=memberDetailAddress]").focus();
                }
            }).open();
        }
    </script>
    
    <script type="text/javascript">
        $(function(){
            $(".address-find-btn").click(findAddress);
        });
    </script>
<h1> 회원 정보 수정 </h1>
<form action = "member_update.ez" method="post">
	<div class="container w500 m30">
		<div class="row">
			<label>아이디</label>
			<input type="text" name="memberId" value="<%=memberDto.getMemberId()%>" autocomplete="off" class="form-input fill input-round" required readonly>
		</div>
		<div class="row">
			<label>비밀번호</label>
	        <input type="text" name="memberPw" value="<%=memberDto.getMemberPw()%>" class="form-input fill input-round" required>
	    </div>
	    <div class="row">
	        <label>닉네임</label>
	            <input type="text" name="memberNick" value="<%=memberDto.getMemberNick()%>" class="form-input fill input-round" required>
	    </div>
	    <div class="row">
	    	<label>이름</label>
	    		<input type="text" name="memberName" value="<%=memberDto.getMemberName()%>" class="form-input fill input-round" required>
	    </div>
	    <div class="row">
	        <label>생년월일</label>
	        <input type="date" name="memberBirth" value="<%=memberDto.getMemberBirth()%>" class="form-input fill input-round" required>
	    </div>
	    <div class="row">
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" value="<%=memberDto.getMemberPhone()%>" class="form-input fill input-round"  required>
	    </div>
	    <div class="row">
	        <label>이메일</label>
	        <input type="email" name="memberEmail"  value="<%=memberDto.getMemberEmail()%>" class="form-input fill input-round" required>
	    </div>
	    <div class="row">
	        <label>주소</label><br>
                <input type="text" name="memberPost" value="<%=memberDto.getMemberPost()%>" width="65%" class="form-input input-round" required>
       			 <input type="button" class="address-find-btn btn" value="우편번호 찾기" width="35%"><br>
       </div>
       <div class="row">
       		<input type="text" name="memberBasicAddress" value="<%=memberDto.getMemberBasicAddress()%>" class="form-input fill input-round" required>
       </div>
       <div class="row">
            <input type="text" name="memberDetailAddress" value="<%=memberDto.getMemberDetailAddress()%>" class="form-input fill input-round" required>
	    </div>
	    <div class="row">
	    		<label>회원포인트</label>
	    		<input type="number" name="memberPoint"  value="<%=memberDto.getMemberPoint()%>" class="form-input fill input-round" required min="0" step="100">
	    </div>
	    <div class="row">
	    		<label>회원등급</label>
	    		<select name="memberGrade" class="form-input fill" required>
	    			<%if(memberDto.getMemberGrade().equals("일반회원")){ %>
					<option selected>일반회원</option>
					<%}else{ %>
					<option>일반회원</option>
					<%} %>
					
	    			<%if(memberDto.getMemberGrade().equals("우수회원")){ %>
					<option selected>우수회원</option>
					<%}else{ %>
					<option>우수회원</option>
					<%} %>
					
	    			<%if(memberDto.getMemberGrade().equals("vip")){ %>
					<option selected>vip</option>
					<%}else{ %>
					<option>vip</option>
					<%} %>					
					
	    			<%if(memberDto.getMemberGrade().equals("관리자")){ %>
					<option selected>관리자</option>
					<%}else{ %>
					<option>관리자</option>
					<%} %>
					
	    		</select>
	    </div>
	    <div class="row">
	    		<label>회원가입일</label>
	    		<input type="date" name="memberJoindate" value="<%=memberDto.getMemberJoindate()%>"  class="form-input fill input-round" >
	    </div>
	    
		<div class="row">
			  <a href="member_detail.jsp?memberId=<%=memberDto.getMemberId()%>"class ="link fill link-btn">취소</a>
	    </div>
	    <div class="row">
	        <button type="submit" class ="btn fill btn-primary">수정</button>
	    </div>
	    <div class="row">
	        <a href="member_delete.ez?memberId=<%=memberDto.getMemberId()%>"class ="link fill link-btn-green">회원탈퇴</a>
	    </div>
	</div>
	</form>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>