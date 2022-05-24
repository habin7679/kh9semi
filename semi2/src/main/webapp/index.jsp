<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="semi2.beans.*"%>
<%@page import="java.util.*"%>

<%
ProductDao pDao = new ProductDao();
List<ProductDto> list = pDao.eventOutput();
List<ProductDto> list2 = pDao.categorie("샐러드");
List<ProductDto> list3 = pDao.categorie("간식");
List<ProductDto> list4 = pDao.categorie("닭가슴살");
ProductAttachmentDao paDao = new ProductAttachmentDao();    
%>


<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">
<title>이지어트 메인 페이지</title>
<!-- 스와이퍼 슬라이드 CDN 시작-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 스와이퍼 슬라이드 CDN 끝-->
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

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>서둘러요! 지금은 할인중!</th>
			</tr>
		</div>
		<div style="display: flex;">
			<%
			for (int i = 0; i < 5; i++) {
				ProductDto pDto = list.get(i);

				ProductAttachmentDto paDto = paDao.selectOne(pDto.getProductNo());
			%>
			<div
				style="text-align: center; display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<a
					href="<%=request.getContextPath()%>/product/product_user_detail.jsp?product_no=<%=pDto.getProductNo()%>">
					<img class="wid"
					src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  
					width="200" height="200"
					style="vertical-align: top; margin-top: 35px;"><br>
				</a> <label> <%=pDto.getProductName()%>
				</label>  
			</div>
			<%
			}
			%>
		</div>
	</div>
</div>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>세상 쉬운 야채 챙기기</th>
			</tr>
		</div>
		<div style="display: flex;">
			<%
			for (int i = 0; i < 5; i++) {
				ProductDto pDto = list2.get(i);

				ProductAttachmentDto paDto = paDao.selectOne(pDto.getProductNo());
			%>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<a
					href="<%=request.getContextPath()%>/product/product_user_detail.jsp?product_no=<%=pDto.getProductNo()%>">
					<img class="wid"
					src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  
					width="200" height="200"
					style="vertical-align: top; margin-top: 35px;"><br>
				</a>  <label> <%=pDto.getProductName()%>
				</label> 
			</div>
			<%
			}
			%>
		</div>
	</div>
</div>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>지금 잘 팔려요</th>
			</tr>
		</div>
		<div style="display: flex;">
			<%
			for (int i = 0; i < 5; i++) {
				ProductDto pDto = list3.get(i);

				ProductAttachmentDto paDto = paDao.selectOne(pDto.getProductNo());
			%>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<a
					href="<%=request.getContextPath()%>/product/product_user_detail.jsp?product_no=<%=pDto.getProductNo()%>">
					<img class="wid"
					src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  
					width="200" height="200"
					style="vertical-align: top; margin-top: 35px;"><br>
				</a> <label> <%=pDto.getProductName()%>
				</label> 
			</div>
			<%
			}
			%>
		</div>
	</div>
</div>

<div class="content">
	<div style="display: flex; flex-direction: column;">
		<div
			style="display: block; position: relative; padding: 10px 0px; margin: 0px 0px; text-align: left; color: #222; font-size: 27px; font-weight: 500; letter-spacing: -0.09em;">
			<tr>
				<th>닭가슴살!</th>
			</tr>
		</div>
		<div style="display: flex;">
			<%
			for (int i = 0; i < 5; i++) {
				ProductDto pDto = list4.get(i);
				ProductAttachmentDto paDto = paDao.selectOne(pDto.getProductNo());
			%>
			<div
				style="display: block; width: 256px; height: 256px; border: none; overflow: hidden; border-radius: 8px;">
				<a
					href="<%=request.getContextPath()%>/product/product_user_detail.jsp?product_no=<%=pDto.getProductNo()%>">
					<img class="wid"
					src="<%=request.getContextPath()%>/file/download.ez?attachmentNo=<%=productattachmentDto.getAttachmentNo()%>"  
					width="200" height="200"
					style="vertical-align: top; margin-top: 35px;"><br>
				</a> <label> <%=pDto.getProductName()%>
				</label>
				
			</div>
			<%
			}
			%>
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


