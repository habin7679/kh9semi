<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
	%>
	<style>
.table{
	border=1px;
	
}

	<script>
	var recentProdArr = JSON.parse(localStorage.getItem("recentProdArr"));
	var target = document.getElementById("recentProd");
    if (recentProdArr != null) {
    	recentProdArr.forEach((current, index)=>{
    		console.log(current);
    		let new_div = document.createElement('div');
    		let new_a = document.createElement('a');
    		let new_img = document.createElement('img');
    		
    		new_a.setAttribute('href', '../product/product_user_detail.jsp?product_no='+current);  
    		new_a.setAttribute('class', 'link');
    		
    		new_img.setAttribute('src', '/semi2/file/download.ez?attachmentNo='+current); 
    		
    		new_a.appendChild(new_img);
    		new_div.appendChild(new_a);
    		
    		target.appendChild(new_div);
    	})
    }
    
	</script>
		<style>
.table{
	border=1px;
	
}
</style>

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
</div>
</div>
</div>
</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>