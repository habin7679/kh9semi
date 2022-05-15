<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%String memerId=(String) session.getAttribute("member"); 
		
		MemberDao memberDao=new MemberDao();
		MemberDto memberDto= memberDao.selectOne(memerId);
		
	%>
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
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>