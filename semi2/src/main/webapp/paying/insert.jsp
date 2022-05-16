<%@page import="semi2.beans.DeliveryDto"%>
<%@page import="semi2.beans.DeliveryDao"%>
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
DeliveryDao dDao = new DeliveryDao();
List<DeliveryDto> listD = dDao.select(memberId);
DeliveryDto dDtoOri = dDao.represent(memberId);

%>

<jsp:include page="/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(".listD tr").click(function(){
			var str = "";
			var tdarr = new Array();
			
			var tr = $(this);
			var td = tr.children();
			
			td.each(function(i){
				tdarr.push(td.eq(i).text());
			});
			
			console.log(tr.text());
			
			var name = td.eq(0).text();
			var phone = td.eq(1).text();
			var post = td.eq(2).text();
			var basic = td.eq(3).text();
			var detail = td.eq(4).text();
			
			$("input[name=payingName]").val(name);
			$("input[name=payingPhone]").val(phone);
			$("input[name=payingPost]").val(post);
			$("input[name=payingBasicAddress]").val(basic);
			$("input[name=payingDetailAddress]").val(detail);
		});

		$(".regist").on("input", function(){
			var register = document.querySelector(".registed");
			
			if($(this).prop("checked")){
				register.hidden = false;
			}else{
				register.hidden = true;
			}
			
			
		});
		
		
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

	<!-- Kakao 우편 API-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                    
                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    $("input[name=payingPost]").val(data.zonecode);
                    $("input[name=payingBasicAddress]").val(addr);

                    $("input[name=payingDetailAddress]").focus();
                }
            }).open();
        }
    </script>
    
    <script type="text/javascript">
        $(function(){
            $(".address-find-btn").click(findAddress);
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
				<input type="checkbox" class="regist">
				<label>등록된 배송정보 사용</label>
		</div>
		<div class="row registed " hidden>
				<table class="table table-border layer-2 listD container w400 m50">
					<thead >
					<tr>
						<th >수령인</th>
						<th>연락처</th>
						<th>우편번호</th>
						<th>기본주소</th>
						<th>상세주소</th>
					</tr>
					</thead>
					<tbody>
					<%for(int i =0; i<listD.size(); i++) {
							DeliveryDto dDto =	listD.get(i);
					%>
					
					<tr>
						<td><%=dDto.getDeliveryName()%></td>
						<td><%=dDto.getDeliveryPhone()%></td>
						<td><%=dDto.getDeliveryPost()%></td>
						<td><%=dDto.getDeliveryBasicAddress()%></td>
						<td><%=dDto.getDeliveryDetailAddress()%></td>
					</tr>
					<%} %>
					</tbody>
				</table>
		</div>
			<div class="row">
				<label>수령인 </label>
				<input type="text" name="payingName"
					value="<%=dDtoOri.getDeliveryName()%>" class="form-input fill form-round" required>
			</div>
			<div class="row">
				<label>연락처</label> 
				<input type="tel" name="payingPhone"
					value="<%=dDtoOri.getDeliveryPhone()%>" class="form-input fill form-round" required>
			</div>
			<div class="row">
				<label>우편번호</label> 
				<input type="text" name="payingPost"
					value="<%=dDtoOri.getDeliveryPost()%>" class="form-input fill form-round" required>
				<input type="button" class="address-find-btn" value="우편번호 찾기"><br>
			</div>
			<div class="row">
				<label>기본주소</label> 
				<input type="text" name="payingBasicAddress"
					value="<%=dDtoOri.getDeliveryBasicAddress()%>" class="form-input fill form-round" required>
			</div>
			<div class="row">
				<label>상세주소</label> 
				<input type="text" name="payingDetailAddress"
					value="<%=dDtoOri.getDeliveryDetailAddress()%>" class="form-input fill form-round" required>
			</div>
			<div class="row">
				<input type="date" name="payingDeliveryDate" class="form-input fill form-round" required> 원하는 시간대 <select
					name="payingDeliveryTime">
					<option>0</option>
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
				<label>상품 총 가격</label><br><br>
				<%if(mDto.getMemberGrade().equals("일반회원")) {%>
				<input type="number" name="payingTotal" value="<%=payingDao.totalPrice(orderNo)%>" class="pPrice form-input fill form-round" readonly>
				<%} else if(mDto.getMemberGrade().equals("우수회원")) {%>
				<label>우수회원 할인 적용</label>
				<input type="number" name="payingTotal" value="<%=(int)(payingDao.totalPrice(orderNo)*0.9)*10/10 %>" class="pPrice form-input fill form-round" readonly>
				<%} else { %>
				<label>VIP 할인 적용</label><br><br>
				<input type="number" name="payingTotal" value="<%=(int)(payingDao.totalPrice(orderNo)*0.8)*10/10%>" class="pPrice form-input fill form-round" readonly>
				<%} %>			
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
