<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style> 
.side_nav ul li a{
  color: black;
  text-decoration: none;
  display: inline-block;
  position: relative;
}
.side_nav ul li a:after {    
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 1px;
  left: 50%;
  position: absolute;
  background: black;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
.side_nav ul li a:hover:after { 
  width: 100%; 
  left: 0; 
}
</style>
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
                    <li><a href=" <%=request.getContextPath() %>/Customer/Register">Register</a></li>
                    <li><a href=" <%=request.getContextPath() %>/Customer/cartList">Cart</a></li>
                    <li><a href=" <%=request.getContextPath() %>/Customer/OrderHistory">Order</a></li>
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
                <form action=" <%=request.getContextPath() %>/Customer/login_ok" method="post">
                    <div class="login_content">
                        <div class="input_box">
                            <input type="text" placeholder="ID" name="c_Id">
                            <input type="password" placeholder="PASSWORD" name="c_Password">
                        </div>
	                <input type="submit" value="로그인">
                    </div>
                </form>
                
                <div class="login_forgot">
                    <a href=" <%=request.getContextPath() %>/Customer/findID">아이디 찾기</a>
                    <a href=" <%=request.getContextPath() %>/Customer/findPWD">비밀번호 찾기</a>
                </div>
                <div class="join">
                    <div class="join_txt">
                        회원가입을 하시면 다양하고 특별한<br>
                        혜택이 준비되어 있습니다
                    </div>
                    <div class="join_btn">
                        <a href=" <%=request.getContextPath() %>/Customer/Register">회원가입</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../footer.jsp"%>