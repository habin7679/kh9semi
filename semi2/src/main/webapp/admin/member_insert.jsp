<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지어트</title>
</head>
<body>
	<form action="insert.ez" method="post">
	<div>
		<div>
			<h1>회원추가</h1>
		</div>
		<div>
			<label>아이디</label>
			<input type="text" name="memberId" placeholder="영문 소문자/숫자 8~20자" autocomplete="off" required>
		</div>
		<div>
			<label>비밀번호</label>
	        <input type="password" name="memberPw" placeholder="영문대문자로 시작하여 영어, 숫자, 특수문자 8~16자" required>
	    </div>
	    <div>
	        <label>닉네임</label>
	            <input type="text" name="memberNick" placeholder="한글 10자 이내" autocomplete="off" required>
	    </div>
	    <div>
	    	<label>이름</label>
	    		<input type="text" name="memberName" placeholder="이름" autocomplete="off" required>
	    </div>
	    <div>
	        <label>생년월일</label>
	        <input type="date" name="memberBirth" autocomplete="off" required>
	    </div>
	    <div>
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" placeholder="숫자만 입력" autocomplete="off" required>
	    </div>
	    <div>
	        <label>이메일</label>
	        <input type="email" name="memberEmail" autocomplete="off" required>
	    </div>
	    <div>
	        <label>주소</label><br>
                <input type="text" name="memberPost" placeholder="우편번호" autocomplete="off" required>
                <button>검색</button>
       </div>
       <div>
       		<input type="text" name="memberBasicAddress" placeholder="기본주소" autocomplete="off" required>
       </div>
       <div>
            <input type="text" name="memberDetailAddress" placeholder="상세주소" autocomplete="off" required>
	    </div>
	    <div>
	    		<label>회원포인트</label>
	    		<input type="number" name="memberPoint" required min="0" step="100" required>
	    </div>
	    <div>
	    		<label>회원등급</label>
	    		<select name="memberGrade" required>
	    			<option value="">선택</option>
	    			<option>일반회원</option>
	    			<option>우수회원</option>
	    			<option>vip</option>
	    			<option>관리자</option>
	    		</select>
	    </div>
	    <div>
	    		<label>회원가입일</label>
	    		<input type="date" name="memberJoindate">
	    </div>
	    
		<div>
	        <button type="submit">회원추가</button>
	    </div>
	</div>
	</form>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>