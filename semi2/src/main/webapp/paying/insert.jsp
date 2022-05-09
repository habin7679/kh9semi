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
	String memberId = (String)session.getAttribute("member");
	
	int orderNo = Integer.parseInt(request.getParameter("orderNo"));
	
	PayingDao payingDao = new PayingDao();
	PayingDto payingDto = new PayingDto();
	
	MemberDao mDao = new MemberDao();
	MemberDto mDto = mDao.selectOne(memberId);
	
	int totalPrice=payingDao.totalPrice(orderNo);
	
	OrderDao orderDao = new OrderDao();
	List<OrderDto> list = orderDao.selectAll(orderNo);
	
	ProductDao productDao = new ProductDao();
	
	List<Integer> falseList = new ArrayList<>();
	ProductDto productDto = new ProductDto();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
for(int i =0; i<list.size(); i++){
	int orderAmount = list.get(i).getOrderCount();
	int productNo = list.get(i).getProductNo();
	boolean is = productDao.stockCheck(productNo, orderAmount);
	if(!is){
		falseList.add(productNo);
	}
}
if(falseList.size()==0) {
%>
<form action="paying.ez" method="post">
<div class="container">
<div>
	<input type="hidden" name="orderNo" value="<%=orderNo %>">
	<div>
	수령인 <input type="text" name="payingName" value="<%=mDto.getMemberName() %>">
	</div>
	<div>
	연락처 <input type="tel" name="payingPhone" value="<%=mDto.getMemberPhone() %>">
	</div>
	<div>
	우편번호 <input type="text" name="payingPost" value="<%=mDto.getMemberPost() %>">
	</div>
	<div>
	기본주소 <input type="text" name="payingBasicAddress" value="<%=mDto.getMemberBasicAddress() %>">
	</div>
	<div>
	상세주소 <input type="text" name="payingDetailAddress" value="<%=mDto.getMemberDetailAddress() %>">
	</div>
	<div>
		<input type="date" name="payingDeliveryDate">
		원하는 시간대 <select name="payingDeliveryTime">
		<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
		<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
		<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
		<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
		</select>
	</div>
	<div>
	제주도, 산간지역을 제외한 배송비<input type="checkbox" name="payingDeliveryFee" value="<%=3000 %>" >
	</div>
	<!-- 제주도, 산간지역배송비 <input type="checkbox" name="payingDeliveryFee" value="<%=5000 %>" > -->
	
	<div>
	총가격 <input type="text" name="payingTotal" value="<%=payingDao.totalPrice(orderNo) %>" readonly="readonly">
	</div>
</div>
	<input type="submit" value="구매하기">
</div>
</form>
<%} else{ 
		for(int i =0; i<falseList.size(); i++){
			int falseProductNo = falseList.get(i);
			productDto = productDao.selectOne(falseProductNo);
%>
<div>
	<%=productDto.getProductName() %> 
	<%if(i < falseList.size()-1) {%> 
		, 
	<%}%>
</div>
<%} %>
<div>
	재고가 부족합니다. 
</div>
<a href="<%=request.getContextPath()%>/product/list.jsp">다른 상품 보러가기</a>
<%} %>
<jsp:include page="/template/footer.jsp"></jsp:include>