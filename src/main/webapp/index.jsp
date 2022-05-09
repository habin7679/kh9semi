<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
    <title>이지어트 메인 페이지</title>
    <!-- 스와이퍼 슬라이드 CDN 시작-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <!-- 스와이퍼 슬라이드 CDN 끝-->
 <jsp:include page="/template/header.jsp"></jsp:include>
 
        <div class="content">
            <div class="swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="<%=request.getContextPath()%>/image/chicken.jpg" style="width:100%;"></div>
                    <div class="swiper-slide"><img src="img02.jpg" style="width:100%;"></div>
                    <div class="swiper-slide"><img src="img02.jpg" style="width:100%;"></div>
                </div>
                <div class="swiper-pagination"></div>
            
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            
                <div class="swiper-scrollbar"></div>
            </div>
        </div>


  
        <div class="content">
            <div style="display: flex;">
                <div style="margin-right: 10px;">
                    <img class="wid" src="img02.jpg">
                </div>
                <div style="margin-left: 10px; ">
                    <img class="wid" src="img02.jpg">
                </div>
            </div>
        </div>

        <div class="content">
            <div style="display: flex;">
                <div style="margin-right: 10px;">
                    <img class="wid" src="img02.jpg">
                </div>
                <div style="margin-right: 10px; margin-left: 10px;">
                    <img class="wid" src="img02.jpg">
                </div>
                <div style="margin-left: 10px; ">
                    <img class="wid" src="img02.jpg">
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
            width:100%;
        }
    </style>
    <script>
        const swiper = new Swiper('.swiper', {
            loop: true,

            pagination: {
                el: '.swiper-pagination',
            },

            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            scrollbar: {
                el: '.swiper-scrollbar',
            },
        });
    </script>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>

