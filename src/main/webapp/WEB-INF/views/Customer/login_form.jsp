<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
</head>
<%@ include file="../header.jsp" %> 
    <!-- CONTENT -->
    <div class="content_wrap inner">
        <!-- side_nav -->
        <div class="side_nav">
            <div class="side_nav_item">
                <p class="side_nav_title">My page</p>
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="Register.html">Register</a></li>
                    <li><a href="cart.html">Cart</a></li>
                    <li><a href="order.html">Order</a></li>
                    <li><a href="Wishlist.html">Wish list</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                </ul>
            </div>
        </div>
        <!-- Login -->
        <div class="login_wrap">
            <div class="login_box">
                <div class="title_box">
                    <p class="login_title">Member Login</p>
                    <p>가입 시 입력하신 아이디와 비밀번호로 로그인이 가능합니다.</p>
                </div>
                <form action="/project/Customer/login_ok" method="post">
                    <div class="login_content">
                        <div class="input_box">
                            <input type="text" placeholder="ID" name="c_Id">
                            <input type="password" placeholder="PASSWORD" name="c_Password">
                        </div>
	                <input type="submit" value="로그인">
                    </div>
                </form>
                
                <div class="login_forgot">
                    <a href="#">아이디 찾기</a>
                    <a href="#">비밀번호 찾기</a>
                </div>
                <div class="join">
                    <div class="join_txt">
                        회원가입을 하시면 다양하고 특별한<br>
                        혜택이 준비되어 있습니다
                    </div>
                    <div class="join_btn">
                        <a href="/WEB-INF/views/Customer/Register">회원가입</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp"%>