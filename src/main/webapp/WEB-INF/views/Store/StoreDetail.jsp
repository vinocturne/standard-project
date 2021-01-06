<%@page import="org.standard.project.product.ProductChildVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
<style>
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
    padding-left:40px;    
    padding-top:20px;
    }
    
    
     .review{
     width:800px;
     height:450px;
     padding-top:190px;
     
    }

    .picture{
     float:left;
    
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

</style>

</head>


<%@ include file="../header.jsp" %> 


<div class="content_wrap inner">

		<div class="col-auto p-0">
			<div class="side_nav">
				<div class="side_nav_item">
					<p class="side_nav_title">Store</p>
					<ul>
						<li><a href="/project/shop/StoreManMain" class="side_nav_title">Man</a></li>
						<li><a href="#"> <!--줄띄우기 -->
						</a></li>
						<li><a href="/project/shop/StoreManMain">TOP</a></li>
						<li><a href="/project/shop/StoreManMain">BOTTOM</a></li>
						<li><a href="/project/shop/StoreManMain">SHOES</a></li>
					</ul>
				</div>
			</div>
		</div>




	<div class="Product" style = padding-top:57px;>
		
			<%
			ProductParentVO pp_VO = (ProductParentVO)request.getAttribute("p_VO");
			List<String> oC = (List<String>)request.getAttribute("optionColor");
			List<String> oS = (List<String>)request.getAttribute("optionSize");
			
			%>
		
		<div class="image">
			<img src = "${pageContext.request.contextPath}<%=pp_VO.getPp_thumb() %>" 
			style="width:500px; height:500px" class="picture">
		</div>
		
		<form id="frm" name="frm" method="POST">
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
<!-- 			<input type="hidden" id="w_Quantity" name="w_Quantity" value="1">
 -->			<!-- 구매 필요 데이터 -->
			<input type="hidden" id="pp_Name" name="pp_Name" value="<%=pp_VO.getPp_Name() %>">
			<input type="hidden" id="p_Brand" name="p_Brand" value="<%=pp_VO.getPp_Brand() %>">
			<input type="hidden" id="pp_thumb"name="pp_thumb" value="<%=pp_VO.getPp_thumb()%>">

			
			<!-- <input type="submit" value="장바구니" formaction="/project/wishList/addWishList"> -->
			<input type="image" class="orderList" src="<%=request.getContextPath()%>/ResourcesFile/img/cart.svg" formaction="/project/wishList/addWishList"
			  >
		<%-- 	<input type="image" src="<%=request.getContextPath()%>/ResourcesFile/img/buy-button.png"
			width="25" height="25" class="orderNow" > --%>
			<button type="button" class="orderNow"><img src="<%=request.getContextPath()%>/ResourcesFile/img/buy-button.png">
			</button>			
		</div>
			
		</form>	
			
		<script>

		console.log("존망");
		var pid = $("#p_Id").val()+$("#p_Color option:selected").val()+$("#p_Size option:selected").val();
		var stockCheck = ${stockCheck};
		

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
                         form.setAttribute('action', '/project/wishList/order');
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
				
		<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th style="width:5%; height:10%">작성일</th>
					<th style="width:5%; height:10%">글쓴이</th>
					<th style="width:5%; height:10%">제목</th>
					<th style="width:5%; height:10%">내용</th>
					<th style="width:5%; height:10%">답변</th>
				</tr>
			</thead>
			
			<tbody>
				<c:choose>
					<c:when test="${fn:length(reviewList)>0}">
						<c:forEach var="review" items="${reviewList}">
							<!-- <form action="/project/Seller/ModifyParentProduct" method="POST" enctype="multipart/form-data"> -->
							<tr>
								<td><input name="p_Color" type="text" value="${review.r_Date}"></td>
								<td><input name="p_Size" type="text" value="${review.r_Writer}"></td>
								<td><input name="p_Stack" type="text" value="${review.r_Title}"></td>
								<td><input name="p_Stack" type="text" value="${review.r_Coment}"></td>
								<td><input name="p_Stack" type="text" value="${review.r_ComentRe}"></td>
							</tr>
							<!-- </form> -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" style="text-align:center">여러분의 고마운 리뷰를 기다립니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		
			<form action="/project/shop/WriteReview" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="parent_p_Id" name="parent_p_Id" value="<%=pp_VO.getParent_p_Id()%>">
				<input type="hidden" id="brandId" name="brandId" value="<%=pp_VO.getPp_Brand()%>">
				<input type="hidden" id="pp_Name" name="pp_Name" value="<%=pp_VO.getPp_Name()%>">
				<%-- <input type="hidden" id="p_Id" name="p_Id" value="<%=vo.getPp_Brand()%>"> --%>
			
			
				<table class="review_list" >
					
						<tr>
							<th style="width:8%; height:10%">제목</th>
							<th style="width:18%; height:10%"><input type="text"  class="r_Title">
							<button type="submit" style= "width:12%; height:25px">리뷰등록</button></th>
						</tr>
						<tr>
							<th style="width:8%; height:10%">내용</th>
							<th style="margin:0;">
							<textarea class="r_Coment" cols="90" rows="5" style="width:100; height:100;"></textarea>
							</th>
						</tr>
					
				</table>
		
			</form>
				
				
		        
	    
	</div><!--review class 끝  -->
	
	
				 <div class="cart_index">
		                    <button type="button" class="incart" onclick=""><button> << </button></a>
		                    <button type="button" class="incart" onclick=""><button> < </button></a>
		                    <button type="button" class="incart" onclick=""><button> 1 </button></a>
		                    <button type="button" class="incart" onclick=""><button> > </button></a>
		                    <button type="button" class="incart" onclick=""><button> >> </button></a>
		        </div>
 
</div><br>

</div>

</div>
<%@ include file="../footer.jsp"%>