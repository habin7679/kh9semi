<%@page import="semi2.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi2.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 준비 --%>
<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");

int p;
try {
	p = Integer.parseInt(request.getParameter("p"));
	if (p <= 0)
		throw new Exception();
} catch (Exception e) {
	p = 1;
}

int s;
try {
	s = Integer.parseInt(request.getParameter("s"));
	if (s <= 0)
		throw new Exception();
} catch (Exception e) {
	s = 10;
}
%>
<%
boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
ProductDao productDao = new ProductDao();
List<ProductDto> list;
if (isSearch) {
	list = productDao.selectListByPagingForAdmin(p, s, type, keyword);
} else {
	list = productDao.listByPagingForAdmin(p, s);
}
%>
<%
int count;
if (isSearch) {
	count = productDao.countByPaging(type, keyword);
} else {
	count = productDao.countByPaging();
}

int lastPage = (count + s - 1) / s;

int blockSize = 10;

int endBlock = (p + blockSize - 1) / blockSize * blockSize;
int startBlock = endBlock - (blockSize - 1);

if (endBlock > lastPage) {
	endBlock = lastPage;
}
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="row center">
		<h1>
			<a href="product_admin_list.jsp">상품 목록</a>
		</h1>
	</div>
	<div class="container w600 m30">
		<form action="product_admin_list.jsp" method="get">

			<%
			if (type == null || type.equals("product_name")) {
			%>
			<select name="type" class="form-input input-round">
				<option value="product_name" selected>이름</option>
				<option value="product_sort">분류</option>
			</select>
			<%
			} else {
			%>
			<select name="type" class="form-input input-round">
				<option value="product_name">이름</option>
				<option value="product_sort" selected>분류</option>
			</select>
			<%
			}
			%>

			<%
			if (isSearch) {
			%>
			<input type="search" name="keyword" class="form-input input-round"
				placeholder="검색어" value="<%=keyword%>">
			<%
			} else {
			%>
			<input type="search" name="keyword" class="form-input input-round"
				placeholder="검색어">
			<%
			}
			%>

			<input type="submit" value="검색" class="btn btn-primary">
		</form>
	</div>


	<!-- 검색결과 -->
	<%
	if (list.isEmpty()) {
	%>
	<div class="row center">
		<h2>결과가 존재하지 않습니다</h2>
	</div>
	<%
	} else {
	%>
	<div class="container center w900 m30">
	<div class="row right">
		<a href="product_insert.jsp" class="link link-btn">생성</a>
	</div>
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>상품번호</th>
					<th class="w300">제품명</th>
					<th>분류</th>
					<th>제품 가격</th>
					<th>재고</th>
					<th>제조일</th>
					<th class="w50">행사 여부</th>
					<th>기타</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (ProductDto productDto : list) {
				%>
				<tr>
					<td><%=productDto.getProductNo()%></td>
					<td><%=productDto.getProductName()%></td>
					<td><%=productDto.getProductSort()%></td>
					<td><%=productDto.getProductPrice()%></td>
					<td><%=productDto.getProductStock()%></td>
					<td><%=productDto.getProductMade()%></td>
					<td><%=productDto.getProductEvent()%></td>
					<td><a
						href="product_admin_detail.jsp?product_no=<%=productDto.getProductNo()%>"
						class="link">상세보기</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div>
		<%
		}
		%>
	</div>
	<div class="row center pagination">
		<%
		if (p > 1) {
		%>
		<%
		if (isSearch) {
		%>
		<a
			href="product_admin_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
		<%
		} else {
		%>
		<a href="product_admin_list.jsp?p=1&s=<%=s%>">&laquo;</a>
		<%
		}
		%>
		<%
		}
		%>

		<%
		if (startBlock > 1) {
		%>
		<%
		if (isSearch) {
		%>
		<a
			href="product_admin_list.jsp?p=<%=startBlock - 1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
		<%
		} else {
		%>
		<a href="product_admin_list.jsp?p=<%=startBlock - 1%>&s=<%=s%>">&lt;</a>
		<%
		}
		%>
		<%
		}
		%>

		<%
		for (int i = startBlock; i <= endBlock; i++) {
		%>
		<%
		if (isSearch) {
		%>
		<%
		if (i == p) {
		%>
		<a class="active"
			href="product_admin_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
		<%
		} else {
		%>
		<a
			href="product_admin_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
		<%
		}
		%>
		<%
		} else {
		%>
		<%
		if (i == p) {
		%>
		<a class="active" href="product_admin_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
		<%
		} else {
		%>
		<a href="product_admin_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
		<%
		}
		%>
		<%
		}
		%>
		<%
		}
		%>

		<%
		if (endBlock < lastPage) {
		%>
		<%
		if (isSearch) {
		%>
		<a
			href="product_admin_list.jsp?p=<%=endBlock + 1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
		<%
		} else {
		%>
		<a href="product_admin_list.jsp?p=<%=endBlock + 1%>&s=<%=s%>">&gt;</a>
		<%
		}
		%>
		<%
		}
		%>

		<%
		if (p < lastPage) {
		%>
		<%
		if (isSearch) {
		%>
		<a
			href="product_admin_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
		<%
		} else {
		%>
		<a href="product_admin_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
		<%
		}
		%>
		<%
		}
		%>

	</div>


<jsp:include page="/template/footer.jsp"></jsp:include>





