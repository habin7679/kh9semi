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
<div id="recentProd"></div>
<div style="position:relative;height:200px;width:200px;">

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
    		
    		<div class="recent">
    		<img class="recentp"
				width="200" height="200"
				style="vertical-align: top; margin-top: 35px;">
				
    		new_a.setAttribute('href', '../product/product_user_detail.jsp?product_no='+current.id);  
    		new_a.setAttribute('class', 'link');
    		
    		new_img.setAttribute('src', '/semi2/file/download.ez?attachmentNo='+current.img); 
    		
    		new_a.appendChild(new_img);
    		new_div.appendChild(new_a);
    		
    		target.appendChild(new_div);
    	})
    }
</div>
    
	</script>

	
		<style>
		.ha{
	min-height : 100px;
	}
.table{
	border=1px;
	
}
</style>
<div class="ha">
<div class="recentById">
<div>
	<h1>최근 본 상품</h1>
	<div id='recentById'>
</div>

	<div class="row center">
	  <div class="container w1000">
		<table class="table">
			<thead>
				<tr>
					<th>1</th>
					<th>2</th>
					<th>3</th>
				</tr>
			</thead>
</table>
</div>
</div>
</div>
</div>
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>