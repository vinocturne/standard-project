<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Standard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" media="(max-width:1024px)" href="../css/main_medium.css">
    <link rel="stylesheet" media="(max-width:768px)" href="../css/main_small.css">

    <script defer src="../js/main.js"></script>
    
</head>
<%@ include file="../header.jsp"%>
<body class="">
    
    <!-- HEADER -->
    
    <header class="section">
        <div class="inner clearfix">
            <div class="menu-group float--left">
                <!-- <div class="logo"> -->
                <a href="../views/index.html" class="logo"><img src="../img/logo2.png" width="60" height="40"></a>
                <!-- </div> -->
                <ul class="main-menu toggle">
                    <li><a href="../views/StoreMain.html">Store</a></li>
                    <li><a href="../views/Magazin.html">Magazine</a></li>
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
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <!-- CONTENT :사이드바 필요하면 넣기 (default:Mypage) -->
    <div class="content_wrap inner">
        <div class="col-auto p-0">
            <div class="side_nav">
                <div class="side_nav_item">
                    <a href="../views/index.html" class="logo"><img src="../img/logo2.png" width="60" height="40"></a>
                    <p class="side_nav_title">Shop</p>
                    <ul>
                        <li><a href="#">Men`s</a></li>
                        <li><a href="#">Woman`s</a></li>
                        <li><a href="../views/login_form.html">Cart</a></li>
                        <li><a href="../views/order.html">Order</a></li>
                        <li><a href="../views/login_form.html">Wish list</a></li>
                        <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="container">
                <div id="test" class="row no-collapse-1"></div>
            </div>
        </div>
    </div>
    
a    <!-- FOOTER -->
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
    
</body>

<script>
    window.onload = function() {
         var html = '';
         var step;
           for (step = 0; step < 2; step++) {
             
             var title = "";
             var contents = "";
             var img = "";
 
             if(step == 0)
             {
                //  title = "";
                //  contents = "";
                 img = "../img/StoreMain/Man.png";
             }
             else if(step == 1)
             {
                //  title = "";
                //  contents = "";
                 img = "../img/StoreMain/Woman.png";
             }
            
 
              html += '<section class="4u"> <a href="#" class="image featured"><img style="width:400px;height:350px" class="img-thumbnail" src=' + img + ' alt=""></a>';
               html += '<div class="box">';
          
               ;
               html += '</section>';
           }
           
           
           document.getElementById("test").innerHTML = html;
     }
 </script>

</html>