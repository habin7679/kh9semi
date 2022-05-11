<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String memberId=(String)session.getAttribute("member");
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
                    $("input[name=deliveryPost]").val(data.zonecode);
                    //document.getElementById("sample6_address").value = addr;
                    $("input[name=deliveryBasicAddress]").val(addr);

                    // 커서를 상세주소 필드로 이동한다.
                    //document.getElementById("sample6_detailAddress").focus();
                    $("input[name=deliveryDetailAddress]").focus();
                }
            }).open();
        }
    </script>
    
     <script type="text/javascript">
        $(function(){
            $(".address-find-btn").click(findAddress);
        });
    </script>
<form action="<%=request.getContextPath() %>/delivery/insert.ez" method="post">   
<div>
	<div>
		<h1>배송지 추가</h1>
	</div>
	
	<div>
		<input type="hidden" name=memberId value="<%=memberId %>">
	</div>
	
	<div>
		<label>받는분</label>
		<input type="text" name="deliveryName" placeholder="이름" autocomplete="off">
	</div>
	
	<div>
	        <label>주소</label><br>
                <input type="text" name="deliveryPost" placeholder="우편번호" autocomplete="off">
                 <input type="button" class="address-find-btn" value="우편번호 찾기"><br>
            </div>
            <div>
                <input type="text" name="deliveryBasicAddress" placeholder="기본주소" autocomplete="off">
            </div>
            <div>
                <input type="text" name="deliveryDetailAddress" placeholder="상세주소" autocomplete="off">
	    </div>
	
	<div>
		<label>휴대폰 번호</label>
		<input type="tel" name="deliveryPhone" placeholder="숫자만 입력하세요" autocomplete="off">
	</div>
	
	
	<div>
		<input type="submit" value="확인">
	</div>
</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>