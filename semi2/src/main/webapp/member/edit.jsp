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

<style>
.layer2{
	width: 50%;
}
</style>

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
    

<div class="row float-container">
<div class="float-left layer-3">
<jsp:include page="/template/menu.jsp"></jsp:include>
</div>
<div class="float-left layer-2 ">
<form action="edit.ez" method="post">
	    <div class="row center">
	        <h1>개인정보 변경</h1>
	    </div>
	    <div class="row">
	        <label>닉네임</label>
	        <input type="text" name="memberNick" autocomplete="off" value="<%=memberDto.getMemberNick()%>" class="form-input fill">
	    </div>
	    <div class="row">
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" value="<%=memberDto.getMemberBirth()%>" class="form-input fill">
	    </div>
	    <div class="row">
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" value="<%=memberDto.getMemberPhone()%>" class="form-input fill">
	    </div>
	    <div class="row">
	        <label>이메일</label>
	        <input type="email" name="memberEmail" autocomplete="off" value="<%=memberDto.getMemberEmail()%>" class="form-input fill">
	    </div>
	    <div class="row">
	        <label>주소</label><br>
                <input type="text" name="memberPost" placeholder="우편번호" autocomplete="off" class="form-input " width="65%" value="<%=memberDto.getMemberPost()%>" >
                 <input type="button" class="address-find-btn btn" value="우편번호 찾기" width="35%"><br>
            </div>
            <div class="row">
                <input type="text" name="memberBasicAddress" placeholder="기본주소" autocomplete="off" class="form-input fill" value="<%=memberDto.getMemberBasicAddress()%>" >
            </div>
            <div class="row">
                <input type="text" name="memberDetailAddress" placeholder="상세주소" autocomplete="off" class="form-input fill" value="<%=memberDto.getMemberDetailAddress()%>" >
	    </div>
	     <div class="row">
	        <label>비밀번호</label>
	        <input type="password" name="memberPw" class="form-input fill">
	    </div>
	    <div class="row">
	        <label>비밀번호 확인</label>
	        <input type="password" name="memberPw2" class="form-input fill">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn fill btn-primary">정보 변경하기</button>
	    </div>
	    
		<% if(request.getParameter("error") != null){ %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		<%} %>
</form>
</div>
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>