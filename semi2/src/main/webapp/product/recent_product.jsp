<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/recent.css">

<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
	%>
	
	<div class="row float-container">
<div class="float-left layer-3">
<jsp:include page="/template/menu.jsp"></jsp:include>
</div>

<div class="float-left layer-2">
<div id="recentProd"></div> <%-- 원래는 빈 div 였다가 자바스크립트가 동적으로 넣어줌--%>
<div style="position:relative;height:201px;width:200px;">

<img style="position:absolute;" src="test.jsp" onload="fitImage(this)">

</div>

	<script>

	var recentProdObj = JSON.parse(localStorage.getItem("recentProdObj")); //로컬스토리지에서 아이템 가져오기 
	var target = document.getElementById("recentProd"); //recentProd 라는 id를 html 에서 찾아서 target 에 넣어두고
    if (recentProdObj != null) { //밑 if 문 = 이미지들 다 html 화 시켜서 target 이란 div 안에 넣는 동작
    	recentProdObj.forEach((current, index)=>{
    		let new_div = document.createElement('div');
    		let new_a = document.createElement('a');
    		let new_img = document.createElement('img');
				
    		new_a.setAttribute('href', '../product/product_user_detail.jsp?product_no='+current.id);  
    		new_a.setAttribute('class', 'link');
    		
    		new_img.setAttribute('src', '/semi2/file/download.ez?attachmentNo='+current.img); 
    		
    		new_div.setAttribute('class', 'recentp');
    		
    		new_a.appendChild(new_img);
    		new_div.appendChild(new_a);
    		
    		target.appendChild(new_div);
    	})
    }
    
	</script>
	</div>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>