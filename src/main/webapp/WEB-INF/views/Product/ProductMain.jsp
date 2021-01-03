<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>MagazineMain</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" media="(max-width:1024px)" href="../css/main_medium.css">
    <link rel="stylesheet" media="(max-width:768px)" href="../css/main_small.css">

    <script defer src="../js/main.js"></script>
</head>


<!-- HEADER -->
<header class="section">
    <div class="inner clearfix">
        <div class="menu-group float--left">
            <!-- <div class="logo"> -->
            <a href="../views/index.html" class="logo"><img src="../img/logo2.png" width="60" height="40"></a>
            <!-- </div> -->
            <ul class="main-menu toggle">
                <li><a href="../views/StoreMain.html">Store</a></li>
                <li><a href="../views/MagazinePages/Magazine.html">Magazine</a></li>
                <li><a href="../views/login_form.html">My page</a></li>
            </ul>
        </div>
        <div class="sign-group float--right toggle">
            <ul class="sub-menu">
                <li><a href="../views/login_form.html">Login</a></li>
                <li><a href="">Register</a></li>
            </ul>
            <a href="#">
                <input type="text">
                <img src="../img/search.svg" alt="search" height="20" width="20">
            </a>
            <a href="#">
                <img src="../img/cart.svg" alt="cart" height="25" width="25">
            </a>
        </div>
        <div id="toggle-btn">Header Menu Toggle Button</div>
    </div>
</header>
 <!-- CONTENT :사이드바 필요하면 넣기 (default:Mypage) -->
<body class="">
    <div class="content_wrap inner">
        <div class="col-auto p-0">
            <div class="side_nav">
                <div class="side_nav_item">
                    <p class="side_nav_title">Shop</p>
                    <ul>
                        <li><a href="#">Men`s</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#">Cart</a></li>
                        <li><a href="../views/order.html">Order</a></li>
                        <li><a href="#">Wish list</a></li>
                        <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="container">
                <div id="Magazine" class="row no-collapse-1"></div>
            </div>
        </div>
    </div>
</body>
<!-- FOOTER -->
<footer class="section">
    <div class="inner clearfix">
        <ul class="site-links float--right">
            <li><a href="#">API</a></li>
            <li><a href="#">Training</a></li>
            <li><a href="#">Shop</a></li>
            <li><a href="#">About</a></li>
        </ul>
        <ul class="site-links float--left">
            <li>© 2020 STANDARD Inc.</li>
            <li><a href="#">Terms</a></li>
            <li><a href="#">Status</a></li>
            <li><a href="#">Help</a></li>
        </ul>
    </div>
</footer>
</html>


<script>
 
    function likeClick(val)
    {
        //like = 하트 표시를 위함 0 이면 안누른거, 1 이면 누른거
        var like = document.getElementById("like" + val).getAttribute('data-value');
        
        //likeCount = (eval : 숫자변환), 좋아요 개수
        var likeCount = eval(document.getElementById("likeCount" + val).getAttribute('data-value'));
        if(like == 0)
        {
            //하트
            var html = '<i class="fas fa-heart text-danger m-1"></i>';
            document.getElementById("like" + val).innerHTML = html;
            document.getElementById("like" + val).setAttribute('data-value', 1);

            //하트 카운트
            likeCount += 1;
            document.getElementById("likeCount" + val).innerHTML = likeCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("likeCount" + val).setAttribute('data-value', likeCount);
            
        }
        else
        {
            //하트
            var html = '<i class="far fa-heart text-danger m-1"></i>';
            document.getElementById("like" + val).innerHTML = html;
            document.getElementById("like" + val).setAttribute('data-value', 0);
            
            //하트 카운트
            likeCount -= 1;
            document.getElementById("likeCount" + val).innerHTML = likeCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("likeCount" + val).setAttribute('data-value', likeCount);
        }
    }

   window.onload = function() {
        var html = '';
        var step;
        var likeCount = "";
        html += '<div class="row align-items-start" >';
          for (step = 1; step < 25; step++) {
            var title = "";
            var contents = "";
            var img = "";

            // 좋아요 값
            var testLikeCountValue = Math.floor( Math.random() * 100000 ) ;
            var testLikeCount = testLikeCountValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            img = "../img/Product/" + step + ".jpg";
            title = "상품" + step;
            
            // 카드 스타일
                html += '<div class="card m-1 align-items-start" style="width:210px;height:300px;">';
                    html += '<a href="../magazineIn.html?index=' + step + '"">';
                        html += '<img class="card-img-top" src=' + img + ' style="width:100%;height:230px" alt="Card image cap">';        
                  html += '</a>';
                    html += '<div class="card-body p-0">';
                        html += '<p class="card-text text-dark text-bold Zp-1">' + title + '</p>';
                        html += '<p class="card-text text-secondary p-1" style="font-size: small;">' + contents + '</p>';
                    html += '</div>';
                    html += '<div class="row align-items-center">';
                        html += '<div id="like' + step + '" class="col-auto" data-value="0" onclick =likeClick("' + step + '")><i class="far fa-heart text-danger m-1"></i></div>';
                        html += '<div id="likeCount' + step + '" class="col-auto m-0 p-0" data-value="' + testLikeCountValue +'">' + testLikeCount + '</div>';
                    html += '</div>';
                html += '</div>';
          }

          html += '</div>';
          document.getElementById("Magazine").innerHTML = html;
    }



</script>
</body>
</html>