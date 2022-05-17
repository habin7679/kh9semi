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
<div id="recentProd"></div>
<div style="position:relative;height:201px;width:200px;">

<img style="position:absolute;" src="test.jsp" onload="fitImage(this)">

</div>

	<script>

	var recentProdObj = JSON.parse(localStorage.getItem("recentProdObj")); 
	var target = document.getElementById("recentProd");
    if (recentProdObj != null) {
    	recentProdObj.forEach((current, index)=>{
    		let new_div = document.createElement('div');
    		let new_a = document.createElement('a');
    		let new_img = document.createElement('img');
				
    		new_a.setAttribute('href', '../product/product_user_detail.jsp?product_no='+current.id);  
    		new_a.setAttribute('class', 'link');
    		
    		new_img.setAttribute('src', '<%=request.getContextPath()%>/file/download.ez?attachmentNo='+current.img); 
    		
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