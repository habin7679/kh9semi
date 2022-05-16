<%@page import="semi2.beans.MemberDto"%>
<%@page import="semi2.beans.MemberDao"%>
<%@page import="semi2.beans.ProductAttachmentDto"%>
<%@page import="semi2.beans.ProductAttachmentDao"%>
<%@page import="semi2.beans.ProductDto"%>
<%@page import="semi2.beans.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.CartDto"%>
<%@page import="semi2.beans.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memberId = (String)session.getAttribute("member");

	CartDao cDao = new CartDao();
	ProductDao pDao = new ProductDao();
	
	List<CartDto> list = cDao.selectAll(memberId);

	ProductAttachmentDao paDao = new ProductAttachmentDao();
	
%>    
<jsp:include page="/template/header.jsp"></jsp:include>

    <!-- jquery cdn -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <script type="text/javascript">
    $(function(){
        refreshTotal();
        $(".qty").on("input", refreshTotal());
        $(".select-item").on("input", refreshTotal);
    	
        $(".all").on("input", function(){
            $(".select-item").prop("checked", $(this).prop("checked"));
            refreshTotal();
        });
    
            function refreshTotal(){
                //(Q) .qty의 수량이 변경되면 .total에 체크된 상품의 .sub-total 금액합계를 출력
                var total = 0;
                $(".select-item").filter(":checked").each(function(){
                    //this == 해당 회차의 체크된 체크박스
                    var qty = $(this).nextAll(".qty").val();
                    var price = $(this).nextAll("input[name=price]").val();
                    var subTotal = qty * price;
                    $(this).nextAll(".sub-total").val(subTotal);
                    total += subTotal;
                });
                $(".total").text(total);
            }
        });

    </script>

<div class="row float-container">
<div class="float-left layer-3">
<jsp:include page="/template/menu.jsp"></jsp:include>
</div>
<div class="float-left layer-2">
<form action="http://localhost:8080/semi2/order/order.ez" method="post">
모두 구매하기<input type="checkbox" class="all">
<%
	for(int i =0; i<list.size(); i++) {
		CartDto cDto = list.get(i);
		int pNo = cDto.getProductNo();
		ProductDto pDto = pDao.selectOneCart(pNo);
		int price = pDto.getProductPrice();
		int amount = cDto.getCartAmount();
		int total = price*amount;
		ProductAttachmentDto paDto = paDao.selectOne(pNo);
%>
	<div class="container wz">
	<div class= "row center">
	<img src="/semi2/file/download.ez?attachmentNo=<%=paDto.getAttachmentNo()%>" width="200" height="200">
	</div>
	<div class= "row center">
	<a href="detail.jsp?productNo=<%=pNo%>"><%=pDto.getProductName() %></a>
	</div>
	
	<input type="hidden" name="productNo" value="<%=pNo %>">
	구매하기: <input type="checkbox" class="select-item ind" name="checkProduct" value="<%=pNo%>">	<br><br>
	주문 개수: <input type="number" name="cartAmount" class="qty" value="<%=amount %>"/>	<br><br>
	가격: <input type="number" name="price" value="<%=price%>" readonly>	<br><br>
	총 가격: <input type="text" readonly name="orderPrice" class="sub-total" value="<%=total%>"readonly/>	<br><br>
	<a href="delete.ez?productNo=<%=pNo %>">삭제하기</a>
	</div>
	
<%} %>
	<div class="row center">
	총 주문금액: <span class="total"></span>
	</div>
	<%if(list.size()>0) {%>
	<input type="submit" value="구매하기" class="btn btn-primary">
	<%} %>
</form>
</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
