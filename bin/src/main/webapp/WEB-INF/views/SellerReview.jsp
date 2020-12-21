<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/seller.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/SellerReview.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
<title>셀러 페이지</title>
</head>
<body>
    
     <header class="section">
        <div class="inner clearfix">
            <div class="menu-group float--left">
                <!-- <div class="logo"> -->
                    <a href="#" class="logo"><img src="../img/logo2.png" width="60" height="40"></a>
                <!-- </div> -->
                <ul class="main-menu toggle">
                    <li><a href="#">Store</a></li>
                    <li><a href="#">Magazine</a></li>
                    <li><a href="#">My page</a></li>
                    
                </ul>
            </div>
            
            <div class="sign-group float--right toggle">
                <ul class="sub-menu">
                    <li><a href="">Login</a></li>
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


    <div class="frame">
        <div class="container">
        <div class="nav">
            <ul class="nav-list">
                <li>관리자페이지</li>
                <br>
                <li clas="nav-item"><a href ="seller.html" class="nav-link">상품 관리</a></li>
                <li clas="nav-item"><a href ="" class="nav-link">배송 관리</a></li>
                <li clas="na`v-item"><a href ="" class="nav-link">리뷰 관리</a></li>
            </ul>
        </div>
        <div class="content">
            <h3>리뷰관리</h3>
            <br>
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th>번호</th>
                    <th>상품명</th>
                    <th>글 내용</th> 
                    <th>재고현황</th>
                    <th>평점</th>

                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td><a href="">후드</a></td>
                    <td>내용</td>
                    <td>100</td>
                    <td>
                        <div class="starRev">
                            <span class="starR1 on">별1_왼쪽</span>
                            <span class="starR2">별1_오른쪽</span>
                            <span class="starR1">별2_왼쪽</span>
                            <span class="starR2">별2_오른쪽</span>
                            <span class="starR1">별3_왼쪽</span>
                            <span class="starR2">별3_오른쪽</span>
                            <span class="starR1">별4_왼쪽</span>
                            <span class="starR2">별4_오른쪽</span>
                            <span class="starR1">별5_왼쪽</span>
                            <span class="starR2">별5_오른쪽</span>
                          </div>
                  <script>
                    $('.starRev span').click(function(){
                    $(this).parent().children('span').removeClass('on');
                    $(this).addClass('on').prevAll('span').addClass('on');
                    return false;
                    });

                  </script>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>바지</td>
                    <td>내용</td>
                    <td>200</td>
                    <td>별별별별별</td>
                
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>티셔츠</td>
                    <td>내용</td>
                    <td>10</td>
                    <td>별별별별별</td>
                 
                  </tr>
                </tbody>
              </table>
          
        </div>
        
        </div>

        <footer class="section">
            <div class="inner clearfix">
        
                <ul class="site-links float--right">
                    <li><a href="#">Contact GitHub</a></li>
                    <li><a href="#">API</a></li>
                    <li><a href="#">Training</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">About</a></li>
                </ul>
        
                <ul class="site-links float--left">
                    <li>© 2020 STANDARD Inc.</li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Security</a></li>
                    <li><a href="#">Status</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
        
                <a href="#" class="logo">
                    <img src="../img/logo2.png" width=60 height="40">   
                </a>
            </div>
        </footer> 
    </div>
</body>
</html>