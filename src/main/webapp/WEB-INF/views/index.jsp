<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INDEX</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../ResourcesFile/css/style.css">
    <link rel="stylesheet" media="(max-width:1024px)" href="../css/main_medium.css">
    <link rel="stylesheet" media="(max-width:768px)" href="../css/main_small.css">

    <script defer src="../js/main.js"></script>
</head>

<body class="index!!">
    <!-- HEADER -->
    <%@ include file="/webapp/WEB-INF/views/header" %> 

    <!-- CONTENT :사이드바 필요하면 넣기 (default:Mypage)
    <div class="content_wrap inner">
        <!-- side_nav -->
        <!-- <div class="side_nav">
            <div class="side_nav_item">
                <p class="side_nav_title">My page</p>
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Register</a></li>
                    <li><a href="#">Cart</a></li>
                    <li><a href="../views/order.html">Order</a></li>
                    <li><a href="#">Wish list</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                </ul>
            </div>
        </div>
    </div>  -->

    <!-- FOOTER -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>