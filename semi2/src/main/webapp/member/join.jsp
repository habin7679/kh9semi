<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<script type="text/javascript">
        $(function(){

            //상태를 일일이 관리하기 힘드니 각각의 입력창의 상태를 저장하는 객체를 구현
            // -> form을 전송할 때 status의 모든 항목이 true라면 전송, 아니면 차단
          /*   var status = {
                //이름 : 값
                id : false , 
                pw: false,
                nickname : false
            }; */


            $("input[name=memberId]").blur(function(){
                //1. 형식 검사 ---> 2. 중복 검사
                var regex = /^[a-z][a-z0-9]{7,19}$/;
                var memberId = $(this).val();

                var judge = regex.test(memberId);
                if(!judge) {
                    $(this).next("span").text("아이디를 형식에 맞게 작성하세요");
                    status.id = false;
                }

                var that = this;

                $.ajax({
                    url:"http://localhost:8080/semi2/ajax/id.ez?memberId="+memberId,
                    type:"get",
                    success:function(resp) {
                        if(resp == "N"){
                            $(that).next("span").text("이미 사용중인 아이디입니다");
                            status.id = false;
                        }
                        else if(resp == "Y"){
                            $(that).next("span").text("사용 가능한 아이디입니다");
                            status.id = true;
                        }
                    }
                });
            });
            
            $("input[name=memberPw]").blur(function (){
				var regex =/(?=.[]*A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$]){8,16}$/;
				var memberPw=$(this).val();
				var span=$(this).next("span");
				
				var judge= regex.test(memberPw);
				if(!judge){
					span.text("비밀번호를 형식에 맞게 작성하세요")
					status.pw=false;
					return;
				}
				else{
					span.text("사용가능한 비밀번호 입니다")
					status.pw=true;
				}
			
	           });
				
            $("input[name=memberPw2]").blur(function (){
                var span = $(this).next("span");
                var judge1= $("input[name=memberPw]").val().length>0;
                var judge2=$("input[name=memberPw]").val()==$(this).val();

                if(judge1&&judge2){
                    $(this).next("span").text("비밀번호가 일치합니다")
                }
                else{
                    $(this).next("span").text("비밀번호가 일치하지 않습니다")
                }
			})
				
		

            $("input[name=memberNick]").blur(function(){
                var regex = /[가-힣0-9]{2,10}/;
                var memberNick = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(memberNick);
                if(!judge){
                    span.text("형식에 맞는 닉네임을 사용하세요");
                    status.nickname = false;
                } 

                $.ajax({
                    url:"http://localhost:8080/semi2/ajax/nick.ez",
                    type:"post",
                    data:{
                        memberNick : memberNick
                    },
                    success:function(resp) {
                        if(resp === "NY") {
                            span.text("사용 가능한 닉네임입니다");
                            status.nickname = true;                       
                        }
                        else if(resp === "NN") {
                            span.text("이미 사용중인 닉네임입니다");
                            status.nickname = false;
                        }
                    }
                });
            });

        });
    </script>
	<form action="join.ez" method="post">
	<div>
		<div>
			<h1>회원가입</h1>
		</div>
		
		<div>
			<label>아이디</label>
			<input type="text" name="memberId" placeholder="영문 소문자, 숫자 8~20자로 작성" autocomplete="off">
			<span></span>
		</div>
		
		<div>
			<label>비밀번호</label>
	        <input type="password" name="memberPw" placeholder="첫자 영어 대문자,영어, 숫자, 특수문자 8~16자로 작성">
	        <span></span>
	    </div>
	    
	    <div>
			<label>비밀번호 확인</label>
	        <input type="password" name="memberPw2" placeholder="첫자 영어 대문자,영어, 숫자, 특수문자 8~16자로 작성">
	        <span></span>
	    </div>
	    
	    <div>
	        <label>닉네임</label>
	        <input type="text" name="memberNick" placeholder="한글 10자 이내" autocomplete="off">
	        <span></span>
	    </div>
	    
	    <div>
	    	<label>이름</label>
	    		<input type="text" name="memberName" placeholder="이름" autocomplete="off">
	    </div>
	    
	    <div>
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off">
	    </div>
	    
	    <div>
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" placeholder="숫자만 입력" autocomplete="off">
	    </div>
	    
	    <div>
	        <label>이메일</label>
	        <input type="email" name="memberEmail" class="form-input fill input-round" autocomplete="off">
	    </div>
	    
	    <div>
	        <label>주소</label><br>
                <input type="text" name="memberPost" placeholder="우편번호" autocomplete="off">
                <button>검색</button>
            </div>
            <div>
                <input type="text" name="memberBasicAddress" placeholder="기본주소" autocomplete="off">
            </div>
            <div>
                <input type="text" name="memberDetailAddress" placeholder="상세주소" autocomplete="off">
	    </div>
	    
		<div>
	        <button type="submit">회원가입</button>
	    </div>
	</div>
	</form>
	<a href="https://www.naver.com">d</a>
<jsp:include page="/template/footer.jsp"></jsp:include>