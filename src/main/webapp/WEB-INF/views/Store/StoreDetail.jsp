<%@page import="org.standard.project.product.ProductChildVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
<style>

.secondbody{
width:300px;
margin-top: 45px;
}

.content_wrap {
   margin-left: 100px;
   margin-right: 7%;
}

.col-auto ul li a{
  color: black;
  text-decoration: none;
  display: inline-block;
  position: relative;
}
.col-auto ul li a:after {    
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
.col-auto ul li a:hover:after { 
  width: 100%; 
  left: 0; 
}

 .productside{
    display:flex;
/*     border:solid 1px red; */
    padding-left:65px;    
    padding-top:20px;
    }
    
    
     .review{
     
     width:900px;
     height:600px;
     padding-top:190px;
     margin-left:55px;
     
    }

    .picture{
     float:left;
    
    }
    
    .r_Coment{
    margin:0;
    
    }
    .review_list{
     float:left;
     padding-top:10px;
     padding-left:30px;
     vertical-align: middle;
     text-align:center;
     padding-bottom:30px;
     
   }
   .detailExplain{
    padding-top:30px;
    padding-bottom:30px;
    
    }
       
   .r_Title{
   width:86%;
   }

      
   .orderNow{
   float:right;
   background:none;
   border:none;
   padding-left:60px;
   margin-top:80px;
   }
   
   .orderNow img{
   width:30px;
   height:30px;
   }
   
   .orderList{
   float:right;
   width:30px;
   height:30px;
   margin-top:85px;
   margin-left:15px;
   }
   
   .cart_index{
       padding-bottom:20px;
   }
   
       textarea{
       height:100px;
       width:720px;
    }

</style>

</head>


<%@ include file="../header.jsp" %> 


<div class="content_wrap">

      <div class="col-auto p-0">
         <div class="side_nav">
            <div class="side_nav_item">
               <p class="side_nav_title">Store</p>
               <ul>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreManMain" class="side_nav_title">Man</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreManMain?category=Top">TOP</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreManMain?category=Bottom">BOTTOM</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreManMain?category=Shoes">SHOES</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreManMain?category=Acc">ACC</a></li>
               </ul>
               <br><br><br>
               <ul>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain" class="side_nav_title">Women</a></li>
            
                  <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Top">TOP</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Bottom">BOTTOM</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Dress">DRESS</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Shoes">SHOES</a></li>
                  <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Acc">ACC</a></li>
               </ul>
            </div>
         </div>
      </div>




   <div class="Product" style = padding:70px;>
      
         <%
         ProductParentVO pp_VO = (ProductParentVO)request.getAttribute("p_VO");
         List<String> oC = (List<String>)request.getAttribute("optionColor");
         List<String> oS = (List<String>)request.getAttribute("optionSize");
         
         %>
      
      <div class="image">
         <img src = "${pageContext.request.contextPath}<%=pp_VO.getPp_thumb() %>" 
         style="width:500px; height:570px" class="picture">
      </div>
      
      <form id="frm" name="frm" method="POST" onchange="changeForm()">
      <div class="productside">
         <div class="explain">
            <h1><%=pp_VO.getPp_Name() %></h1><br>
               
            
            <h4><%=pp_VO.getPp_Price() %></h4>
            
            <br>
            <h2 class="detailExplain">상품 상세정보 <br></h2>
            
            
               <h4>Color</h4><br>
               <select id="p_Color" name="p_Color">         
               <%
                  for(int i=0; i<oC.size(); i++) {
               %>
                  <option value="<%=oC.get(i)%>"> <%=oC.get(i) %></option>
               <%
               }
               %>
               </select><br><br>
               
               <h4>Size</h4><br>
               <select id="p_Size" name="p_Size">
         
               <%
                  for(int i=0; i<oS.size(); i++) {
               %>
                  <option value="<%=oS.get(i)%>"> <%=oS.get(i) %></option>
               <%
               }
               %>
               </select><br><br>
               <h4><span id="stack">재고 : </span></h4><br>
               <h4>수량</h4><br>
               <table>
                    <tr style="border: 1px solid black; width:30px; height:20px;">
                       <td>
                          <input type="text" id="w_Quantity"name="w_Quantity" size="2" value=1 maxlength=2 onblur="numcheck(this.form.w_Quantity.value,10)" onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};"
                          style="margin-top:7px;margin-left:10px; width:30px; height:18px; border:none; vertical-align: middle;">
                       </td>
                       
                       <td valign=top  style="border: 1px solid black" >
                          <input type=button value="▲" onclick="up(this.form.w_Quantity.value,10)" 
                          STYLE="background-color:white;border:none; width:30px; height:10px; font-size:12px; vertical-align: top;" name=plus>
                          <br>
                          <input type=button value="▼" onclick="down(this.form.w_Quantity.value)" 
                          STYLE="margin-bottom:5px; background-color:white;border:none; width:30px; height:10px; font-size:12px; vertical-align: middle;" name=minus>
                       </td>
                    </tr>
               </table>
               <script> 
               
                 function numcheck(val,able){
                        if (val>able-1){
                                alert("최대 주문 가능 수량은 10개입니다.")
                                document.frm.w_Quantity.value=able}
                        else if (val<2){
                              alert("1개 이상의 제품을 선택해주세요.")
                                document.frm.w_Quantity.value=1        }
                   }
               function up(val,able){
                        if (val>able-1){
                                alert("1회 주문량을 초과했습니다.")
                                document.frm.w_Quantity.value=able}
                        else{
                                document.frm.w_Quantity.value=(val/1)+1}
               }
                                                         
               function down(val){
                        if (val<2){
                               alert("1개 이상의 제품을 선택해주세요.")
                                document.frm.w_Quantity.value=1}
                        else{
                                document.frm.w_Quantity.value=val-1}
                  }
               </script>
         </div>
      </div>
      
      
         <br>
         
      <div class="buttonClass">   
         <!-- 장바구니 필요 데이터 -->
         <input type="hidden" id="p_Id" name="p_Id" value="<%=pp_VO.getParent_p_Id()%>">
         <input type="hidden" id="p_Price" name="p_Price" value="<%=pp_VO.getPp_Price() %>">
<!--          <input type="hidden" id="w_Quantity" name="w_Quantity" value="1">
 -->         <!-- 구매 필요 데이터 -->
         <input type="hidden" id="pp_Name" name="pp_Name" value="<%=pp_VO.getPp_Name() %>">
         <input type="hidden" id="p_Brand" name="p_Brand" value="<%=pp_VO.getPp_Brand() %>">
         <input type="hidden" id="pp_thumb"name="pp_thumb" value="<%=pp_VO.getPp_thumb()%>">

         
         <!-- <input type="submit" value="장바구니" formaction="/project/wishList/addWishList"> -->
         <input type="image" class="orderList" src="<%=request.getContextPath()%>/ResourcesFile/img/cart.svg" formaction="<%=request.getContextPath() %>/wishList/addWishList"
           >
      <%--    <input type="image" src="<%=request.getContextPath()%>/ResourcesFile/img/buy-button.png"
         width="25" height="25" class="orderNow" > --%>
         <button type="button" class="orderNow"><img src="<%=request.getContextPath()%>/ResourcesFile/img/buy-button.png">
         </button>         
      </div>
         
      </form>   
        <div class="image" >
         <img src = "${pageContext.request.contextPath}<%=pp_VO.getPp_image() %>" 
         style="width:1000px;padding-top:40px;padding-bottom:40px;" class="picture">
      </div>
      <script>
      var list = [];
      var stack = "";
      <c:forEach items="${stockCheck}" var="item">

      list.push("${item}");

      </c:forEach>
      /* 창 열릴때 처음으로 재고 표시해주는 기능 */
      var ppId =$("#p_Id").val();
         var pColor=$("#p_Color option:selected").val();
         var pSize=$("#p_Size option:selected").val();
         var PID= ppId+pColor+pSize;
         for(var i=0; i<list.length; i++) {
            if(list[i].includes(PID)) {
               console.log(list[i]);
               var stackArr = list[i].split('=');
               stack = stackArr[1];
               break;
            }
         }
      document.getElementById('stack').innerHTML="재고 : "+stack;
      
      /* form내 option 변경시 실시간 재고 변경해주는 기능 */
      function changeForm() {
         var ppId =$("#p_Id").val();
         var pColor=$("#p_Color option:selected").val();
         var pSize=$("#p_Size option:selected").val();
         var PID= ppId+pColor+pSize;
         for(var i=0; i<list.length; i++) {
            if(list[i].includes(PID)) {
               console.log(list[i]);
               var stackArr = list[i].split('=');
               stack = stackArr[1];
               break;
            }
         }
         document.getElementById('stack').innerHTML="재고 : "+stack;
         
      }
      /* console.log("존망");
      console.log($("#p_Id").val());
      console.log("선택된 색 옵션 : "+$("#p_Color option:selected").val());
      console.log("선택된 싸이즈 옵션: "+$("#p_Size option:selected").val()); */
      
      
      
      
      
      /* 
      console.log("${stockCheck}"); */
      //var pid = $("#p_Id").val()+$("#p_Color option:selected").val()+$("#p_Size option:selected").val();
      //var stockCheck = ${stockCheck};
      

      </script>
      <script>
         $(".orderNow").click(function() {
                     var jsonArr = new Array();
                     var jsonP_Id = $("#p_Id").val()+$("#p_Color option:selected").val()+$("#p_Size option:selected").val();
                     var jsonStr = {
                           pp_Name : $("#pp_Name").val(), p_Brand : $("#p_Brand").val(), w_Quantity:$("#w_Quantity").val(), p_Price:$("#p_Price").val(),
                           pp_thumb:$("#pp_thumb").val(), p_Id : $("#p_Id").val()+$("#p_Color option:selected").val()+$("#p_Size option:selected").val(), 
                           p_Color:$("#p_Color option:selected").val(),p_Size:$("#p_Size option:selected").val(), parent_p_Id : $("#p_Id").val()
                     }
                     jsonArr.push(jsonStr);
                     
                     jsonStringfied = JSON.stringify(jsonArr);
                     
                      if (!(jsonStringfied == "")) {
                        
                         var form = document.createElement('form');
                         form.setAttribute('method', 'post'); //GET 전환 가능
                         form.setAttribute('action', getContextPath()+'/wishList/order');
                         document.charset = "utf-8";
                         
                             var hiddenField = document.createElement('input');
                             hiddenField.setAttribute('type', 'hidden'); //값 입력
                             hiddenField.setAttribute('name', "data");
                             hiddenField.setAttribute('value', jsonStringfied);
                             form.appendChild(hiddenField);
                         
                         document.body.appendChild(form);
                         form.submit();
                     }else{
                        alert("주문할 상품을 선택해주세요");
                     }
               }); 
            </script>
      
   
   <div class="review">
   
            <div class="title_area" >
               <div class="title_area1">
                  <h1>Review</h1>
               </div>
            </div>
            
      <table class="table table-hover" style="height:100px; width:800px; ">
         <thead>
            <tr>
               <th style="width:5%; height:10%">작성일</th>
               <th style="width:5%; height:10%">글쓴이</th>
               <th style="width:5%; height:10%">제목</th>
               <th style="width:5%; height:10%">내용</th>
               <th style="width:5%; height:10%">답변</th>
               
            </tr>
         </thead>
         
         <tbody >
            <c:choose>
               <c:when test="${fn:length(reviewList)>0}">
                  <c:forEach var="review" items="${reviewList}">
                     <!-- <form action="/project/Seller/ModifyParentProduct" method="POST" enctype="multipart/form-data"> -->
                     <tr>
                        <td><input name="p_Color" type="text" value="${review.r_Date}" style="background-color:transparent;border:0 solid black;text-align:center;" disabled></td>
                        <td><input name="p_Size" type="text" value="${review.r_Writer}"style="background-color:transparent;border:0 solid black;text-align:center;" disabled></td>
                        <td><input name="p_Stack" type="text" value="${review.r_Title}"style="background-color:transparent;border:0 solid black;text-align:center;" disabled></td>
                        <td><input name="p_Stack" type="text" value="${review.r_Coment}"style="background-color:transparent;border:0 solid black;text-align:center;" disabled></td>
                        <td><input name="p_Stack" type="text" value="${review.r_ComentRe}"style="background-color:transparent;border:0 solid black;text-align:center;" disabled></td>
                        
                     </tr>
                     <!-- </form> -->
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td colspan="4" style="text-align:center">여러분의 고마운 리뷰를 기다립니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>
         </tbody>
      </table>
      
      
         <form action="<%=request.getContextPath() %>/shop/WriteReview" method="POST" enctype="multipart/form-data">
            <input type="hidden" id="parent_p_Id" name="parent_p_Id" value="<%=pp_VO.getParent_p_Id()%>">
            <input type="hidden" id="brandId" name="brandId" value="<%=pp_VO.getPp_Brand()%>">
            <input type="hidden" id="pp_Name" name="pp_Name" value="<%=pp_VO.getPp_Name()%>">
            <%-- <input type="hidden" id="p_Id" name="p_Id" value="<%=vo.getPp_Brand()%>"> --%>
         
         
            <table class="review_list" >
               
                  <tr>
                     <th style="width:8%; height:10%">제목</th>
                     <th style="width:18%; height:10%"><input type="text"  class="r_Title" name="r_Title">
                     <button type="submit" style= "width:12%; height:25px">리뷰등록</button></th>
                  </tr>
                  <tr>
                     <th style="width:8%; height:10%">내용</th>
                     <th style="margin:0;">
                     <textarea class="r_Coment" name="r_Coment" cols="90" rows="5" style="width:812px; height:100px;"></textarea>
                     </th>
                  </tr>
               
            </table>
            <br>
            <br>
            <br>
      
         </form>
            
            <div class="cart_index">
                          <button type="button" class="incart" onclick=""><button> << </button></a>
                          <button type="button" class="incart" onclick=""><button> < </button></a>
                          <button type="button" class="incart" onclick=""><button> 1 </button></a>
                          <button type="button" class="incart" onclick=""><button> > </button></a>
                          <button type="button" class="incart" onclick=""><button> >> </button></a>
              </div>
            
              
       
   </div><!--review class 끝  -->
   
   
 
</div><br>

             
</div>

</div>
<%@ include file="../footer.jsp"%>