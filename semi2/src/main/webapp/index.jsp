<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="semi2.beans.*"%>

<%@page import="java.util.*"%>

<%
ProductDao pDao=new ProductDao();
List<ProductDto> list=pDao.eventOutput();
List<ProductDto> list2=pDao.categorie("샐러드");

List<ProductDto> list4=pDao.categorie("닭가슴살");
//ProductAttachmentDao paDao=new 
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="content">
	<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/image/Banner1.png"
					style="width: 50%; text-align: center; display: block; margin-left: auto; margin-right: auto;">
			</div>
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/image/Banner2.png"
					style="width: 880px; height: 280px; text-align: center; display: block; margin-left: auto; margin-right: auto;">
			</div>
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/image/Banner3.png"
					style="width: 50%; height: 250px; text-align: center; display: block; margin-left: auto; margin-right: auto;">
			</div>
		</div>
		<div class="swiper-pagination"></div>

		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>

		<div class="swiper-scrollbar"></div>
	</div>
</div>
<br>
<br>
<br>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>서둘러요! 지금은 할인중</th>
				<br>
				<br>

			</tr>
		</div>
		<div style="display: flex;">
						<%
				for(int i=0; i<4; i++) {
					ProductDto pDto = list.get(i);
		
				%>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/
					style="vertical-align: top; margin-top: 35px; ">
					<br>
					<br>
					<label>
				<%= pDto.getProductName() %>
				</label>
				<br>
				<br>
				<label>
				<%= pDto.getProductPrice() %>
				</label>
			</div>
		<%} %>
		</div>
	</div>
</div>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>세상 쉬운 야채 챙기기</th>
								<br>
				<br>

			</tr>
		</div>
		<div style="display: flex;">
						<%
				for(int i=0; i<2; i++) {
					ProductDto pDto = list2.get(i);
		
				%>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/
					style="vertical-align: top; margin-top: 35px; ">
					<br>
					<br>
					<label>
				<%= pDto.getProductName() %>
				</label>
				<br>
				<br>
				<label>
				<%= pDto.getProductPrice() %>
				</label>
			</div>
		<%} %>
		</div>
		</div>
	</div>
</div>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>지금 잘 팔려요</th>
				<br>
				<br>

			</tr>
		</div>
		<div style="display: flex;">

			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/곤약 쫀득이.png"
					style="vertical-align: top; margin-top:19px;">
			</div>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/doublechoco.png"
					style="vertical-align: top; margin-top:8px;">
			</div>
			<div
				style="transition-duration: .0s; transform: scale(1.05); display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/본갈비살 로스.png"
					style="vertical-align: top; margin-top: 35px; ">
			</div>
			<div
				style="transition-duration: .0s; transform: scale(1.05); display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/whitechocoorange.png"
					style="vertical-align: top;">
			</div>
		</div>
	</div>
</div>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>닭가슴살!</th>
<br>
				<br>

			</tr>
		</div>
		<div style="display: flex;">
						<%
				for(int i=0; i<1; i++) {
					ProductDto pDto = list4.get(i);
		
				%>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<img class="wid"
					src="<%=request.getContextPath()%>/image/
					style="vertical-align: top; margin-top: 35px; ">
					<br>
					<br>
					<label>
				<%= pDto.getProductName() %>
				</label>
				<br>
				<br>
				<label>
				<%= pDto.getProductPrice() %>
				</label>
			</div>
		<%} %>
		</div>
	</div>
</div>
</div>




<style>
.swiper {
	width: 100%;
	height: 300px;
}

.wid {
	width: 80%;
}
</style>
<script>
	const swiper = new Swiper('.swiper', {
		loop : true,

		pagination : {
			el : '.swiper-pagination',
		},

		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},

		scrollbar : {
			el : '.swiper-scrollbar',
		},
	});
</script>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>

