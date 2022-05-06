<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
test-

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
 <style>
        /* 중간 사이드 바!! */
        ul.bar,
        ul.bar ul {
            list-style: none;

            padding: 0;
            margin: 0;
        }

        /* ul의 마지막 clear / li는 float로 배치 */
        ul.bar::after {
            content: "";
            display: block;
            clear: both;
        }

        ul.bar>li {
            float: left;
            width: 300px;
        }

        /* 2차 이상의 메뉴 숨김 */
        ul.bar ul {
            display: none;
        }

        /* 바 항목에 마우스가 올라가면 하위 메뉴를 표시 */
        ul.bar li:hover>ul {
            display: block;
        }

        ul.bar li {
            position: relative;
        }

        ul.bar ul {
            position: absolute;
            top: 100%;
            left: 0%;
        }

        ul.bar ul {
            width: 100%;
        }

        ul.bar {
            font-size: 16px;
        }

        ul.bar,
        ul.bar ul {
            background-color: #2ecc71;
        }

        ul.bar li {
            padding: 0.35em;
            text-align: center;
        }

        ul.bar a {
            text-decoration: none;
            color: white;
        }

        /*커서 올리면 바뀌는 색*/
        ul.bar li:hover {
            background-color: #326339;
        }

        ul.bar a {
            display: block;
            /*width: 150%;*/
        }

        /* 3차메뉴 이상 선택 */
        ul.bar>li>ul ul {
            top: 0%;
            left: 100%;
        }

        ul.bar a {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body>
    
    <div class="wrap">
        <div class="intro_bg">
            <div class="header">
                <div class="searchArea">
                    <form>
                        <input type="search" placeholder="Search">
                        <button>검색</button>
                    </form>
                </div>
                <ul>
                    <ul class="nav">
                        <li><a href="#">로그인</a></li> 
                        <li><a href="#">장바구니</a></li>
                        <li><a href="#">마이페이지</a></li>
                        <li><a href="#">주문/배송조회</a></li>
                    </ul>
                </ul>
            </div>
        </div>
        <div class="content" style="height:100px;justify-content:space-around;">
            <img src="img.jpg" style="width:100px;height:100px;">
        </div>
        <div class="content">
            <ul class="bar" style="width:100%;display:flex;justify-content:space-between;">
                <li>
                    <a href="#">PRODUCT</a>
                    <ul style="z-index: 100;">

                        <li><a href="#">정기배송</a></li>
                        <li><a href="#">닭가슴살</a></li>
                        <li><a href="#">샐러드</a></li>
                        <li><a href="#">소고기</a></li>
                        <li><a href="#">간식</a></li>
                        <li><a href="#">도시락</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">칼로리사전</a>
                    <ul style="z-index: 100;">
                        <li><a href="#">음식칼로리</a></li>
                        <li><a href="#">운동칼로리</a></li>
                        <li><a href="#">칼로리처방</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul style="z-index: 100;">
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">팁 노하우</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">고객센터</a>
                    <ul style="z-index: 100;">
                        <li><a href="#">자주찾는질문</a></li>
                        <li><a href="#">1:1 고객문의</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="content">
            <div class="swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="./image/img.jpg" style="width:100%;"></div>
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

    <footer style="text-align: center;">
        문의: 010-1234-5678<br>
        CONTACT:<br>
        개발:
    </footer>
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

