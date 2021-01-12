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
<div class="content_wrap inner">
       
        <!-- side_nav -->
       
        <div class="side_nav">
            <div class="side_nav_item">
                <p class="side_nav_title">My page</p>
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="<%=request.getContextPath() %>/Customer/Register">Register</a></li>
                    <li><a href="<%=request.getContextPath() %>/Customer/cart">Cart</a></li>
                    <li><a href="<%=request.getContextPath() %>/Customer/OrderHistory">Order</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                </ul>
            </div>
        </div>
        
        <!-- Find Id : 아이디 찾기-->
        <div class="order_wrap">
            
            <form action="<%=request.getContextPath() %>/Customer/findId" method="POST">
            <div class="title_area">
              <div class="title_area1">
                  <h1>아이디 찾기</h1>
              </div>
              <div class="title_area3">
                  <p>가입하신 정보에 따라 아이디 찾기가 가능합니다.</p>
                  <p>가입하실 때 입력하신 이름과 이메일, 휴대전화 번호를 입력해주세요.</p>
              </div>
              </div>
              <div id="findIdForm" name="findIdForm" action="" method="post"  > 
            <div class="findId">
                <div class="findId_field">
                <p id="c_Name" class="c_Name" ><strong id="name_lable">이름</strong> 
                <input id="Name" name="c_Name" fw-filter="" fw-label="이름" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>  
                
                <p id="c_Email" class="c_Ema il" ><strong>이메일 입력</strong> 
                <input id="Email" name="c_Email" fw-filter="isEmail" fw-label="이메일" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p> 
                
     <!--           <p id="c_Phone1" class="c_Phone1" ><strong>휴대전화 번호 입력</strong> 
                    <input id="c_Phone1" name="c_Phone1" fw-filter="c_Phone1" fw-label="" fw-msg="" class="lostInput" placeholder="" value="" type="text">
                    <input type="button" onClick="" class="Address_btn" name="Address_btn" value="인증번호 보내기"><br></p>        
 -->
        <div class="findID_confirm">
            <input type ="button" value="확인"  class="findID_btn" onclick="fn_findID()">
            <span id="IdResult"></span>
        </div>
        	</div>		
        
        </div>
        </div>
    </form>
    </div>
    </div>
    <script>
        function fn_findID(){
            console.log("getContextPath : "+getContextPath());
            console.log("확인버튼 눌림");
            var resultStr = document.getElementById("IdResult");
            var requestedName = document.getElementById("Name");
            var requestedEmail = document.getElementById("Email");
            var requestedNameVal = requestedName.value;
            var requestedEmailVal = requestedEmail.value;
            var requestFindId ={"NAME": requestedNameVal, "EMAIL":requestedEmailVal};
            console.log(requestFindId);
            
            $.ajax({
                    type: "POST",
                    async :"false" ,
                    url: "findID",
                    data :{ "data" : JSON.stringify(requestFindId) },
                    success: function(data,textStatus){
                       //성공시
                       resultStr.innerHTML =data;
                    },
                    error : function(data,textStatus){
                       //에러발생시
                       console.log("ajax 에러발생");
                    },
        
                });

            }

    </script>
    



<%@ include file="../footer.jsp"%>