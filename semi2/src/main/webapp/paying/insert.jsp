<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi2.beans.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.OrderDao"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.PayingDto"%>
<%@page import="semi2.beans.PayingDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String memberId = (String) session.getAttribute("member");

int orderNo = Integer.parseInt(request.getParameter("orderNo"));

PayingDao payingDao = new PayingDao();
PayingDto payingDto = new PayingDto();

MemberDao mDao = new MemberDao();
MemberDto mDto = mDao.selectOne(memberId);

int totalPrice = payingDao.totalPrice(orderNo);

OrderDao orderDao = new OrderDao();
List<OrderDto> list = orderDao.selectAll(orderNo);

ProductDao productDao = new ProductDao();

List<Integer> falseList = new ArrayList<>();
ProductDto productDto = new ProductDto();
int deliveryFee = 0;
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {

		var b = parseInt($(".pPrice").val());
		$(".total").val(b);
		$(".deliveryFee").val(3000);
		
		$(".inclusion").on("input", function() {

			if ($(this).prop("checked")) {
				
				var fee = document.querySelectorAll(".fee");
				
				for (var v = 0; v < fee.length; v++) {
					fee[v].hidden = false;
				}
				$(".deliveryFee").val(3000);
				var a = parseInt($(".deliveryFee").val());
				$(".total").val(a+b);

				$(".expensive").on("input", function() {

					if ($(this).prop("checked")) {
						$(".deliveryFee").val(5000);
					}else{
						$(".deliveryFee").val(3000);
					}

					var a = parseInt($(".deliveryFee").val());

					$(".total").val(a + b);
				});

			} else {
				var fee = document.querySelectorAll(".fee");
				for (var v = 0; v < fee.length; v++) {
					fee[v].hidden = true;
				}
					$(".deliveryFee").val(0);
					$(".total").val(b);
			}
		});
	});
</script>

<%
for (int i = 0; i < list.size(); i++) {
	int orderAmount = list.get(i).getOrderCount();
	int productNo = list.get(i).getProductNo();
	boolean is = productDao.stockCheck(productNo, orderAmount);
	if (!is) {
		falseList.add(productNo);
	}
}
if (falseList.size() == 0) {
%>

<form action="paying.ez" method="post">
	<div class="container w450">
		<div class="row center">
			<input type="hidden" name="orderNo" value="<%=orderNo%>">
		</div>
			<div class="row">
				<label>수령인 </label>
				<input type="text" name="payingName"
					value="<%=mDto.getMemberName()%>" class="form-input fill form-round">
			</div>
			<div class="row">
				<label>연락처</label> 
				<input type="tel" name="payingPhone"
					value="<%=mDto.getMemberPhone()%>" class="form-input fill form-round">
			</div>
			<div class="row">
				<label>우편번호</label> 
				<input type="text" name="payingPost"
					value="<%=mDto.getMemberPost()%>" class="form-input fill form-round">
			</div>
			<div class="row">
				<label>기본주소</label> 
				<input type="text" name="payingBasicAddress"
					value="<%=mDto.getMemberBasicAddress()%>" class="form-input fill form-round">
			</div>
			<div class="row">
				<label>상세주소</label> 
				<input type="text" name="payingDetailAddress"
					value="<%=mDto.getMemberDetailAddress()%>" class="form-input fill form-round">
			</div>
			<div class="row">
				<input type="date" name="payingDeliveryDate" class="form-input fill form-round"> 원하는 시간대 <select
					name="payingDeliveryTime">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
					<option>13</option>
					<option>14</option>
					<option>15</option>
					<option>16</option>
					<option>17</option>
					<option>18</option>
					<option>19</option>
					<option>20</option>
					<option>21</option>
					<option>22</option>
					<option>23</option>
					<option>24</option>
				</select>
			</div>
			<div class="row">
				<span>배송비 선불</span> 
				<input type="checkbox" class="inclusion">
			</div>
			<div class="row">
				<span class="fee" hidden>제주도, 산간지역 체크</span>
				<input type="checkbox" name="payingDeliveryFee" class="expensive fee" hidden>
			</div>
			<div class="row">
				<span class="fee" hidden>배송비</span>
				<input type="number" hidden name="deliveryFee" class="deliveryFee fee" readonly>
			</div>

			<div class="row">
				<label>상품 총 가격</label> 
				<input type="number" name="payingTotal" value="<%=payingDao.totalPrice(orderNo)%>" class="pPrice form-input fill form-round" readonly>
			</div>
			<div class="row">
				<label>총 결제 금액</label> 
				<input type="number" class="total form-input fill form-round" readonly>
			</div>
			<div class="row">
				<input type="submit" value="구매하기" class="btn btn-primary fill">
			</div>
			</div>
</form>
<%
} else {
for (int i = 0; i < falseList.size(); i++) {
	int falseProductNo = falseList.get(i);
	productDto = productDao.selectOne(falseProductNo);
%>
<div class="container">
	<%=productDto.getProductName()%>
	<%
	if (i < falseList.size() - 1) {
	%>
	,
	<%
	}
	%>
</div>
<%
}
%>
<div class="container">
<label>재고가 부족합니다.</label>
</div>
<%
}
%>
<jsp:include page="/template/footer.jsp"></jsp:include>
