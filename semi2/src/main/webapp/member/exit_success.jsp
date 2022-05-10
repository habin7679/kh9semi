<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<h1>그 동안 이지어트를 이용해주셔서 감사합니다.</h1>
	<a href="<%=request.getContextPath() %>">메인페이지으로 이동하기</a>
<jsp:include page="/template/footer.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        article {
            flex: 7;
            background-color: white;
            padding: 20px;
            justify-content: center;
        }

        .fakeimg{
            background: #aaaaaa;
            width: 100%;
            padding: 20px;
            justify-content: center;
        }

    </style>

</head>
<body>
    <jsp:include page="/template/header.jsp"></jsp:include>
    <div id="container">
<article>
    <div class="fakeimg" style="height: 200px; justify-content: center;">그 동안 이지어트를 이용해주셔서 감사합니다.</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</div>
</body>
</html>

