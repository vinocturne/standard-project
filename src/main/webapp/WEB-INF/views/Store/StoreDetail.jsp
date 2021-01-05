<%@page import="org.standard.project.product.ProductChildVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
    
    <style>
    
    .productside{
     display:flex;
    }
    
    .image{
     float:left;
    
    }
    .explain {

    padding-left:30px;
    padding-top:50px;
    
    }
    
    .review{
     float:left;
     padding-top:30px;
     padding-left:30px;
     padding-bottom:70px;
     width:800px;
     height:350px;
     
    }
    
    .choiceButton1{
 	 padding-top:260px;
     padding-left:40px;
     margine:0;
	 float:right;
    }
    
    .buyclass:hover {
     background-color:black;
     color:white;
     
    }
    
    .listclass:hover {
	    background-color:black;
	    color:white;
    }
    

    .detailExplain{
    padding-top:30px;
    padding-bottom:30px;
    
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
			ProductParentVO p_VO = (ProductParentVO)request.getAttribute("p_VO");
			List<String> oC = (List<String>)request.getAttribute("optionColor");
			List<String> oS = (List<String>)request.getAttribute("optionSize");
			%>
		
		<div class="image">
		<img src = "${pageContext.request.contextPath}<%=p_VO.getPp_thumb() %>" 
		style="width:500px; height:500px" class="picture">
		</div>
		
		
		<div class="productside" style = border : solid 1px red;>
			<div class="explain">
				<h1><%=p_VO.getPp_Name() %></h1><br>
					
				
				<h4><%=p_VO.getPp_Price() %></h4>
				
				<br>
				<h2 class="detailExplain">상품 상세정보 <br></h2>
					<h4>Color</h4><br>
					<select id="ColorSelect">
			
					<%
						for(int i=0; i<oC.size(); i++) {
					%>
						<option value="<%=oC.get(i)%>"><%=oC.get(i) %></option>
					<%
					}
					%>
					</select><br><br>
					<h4>Size</h4><br>
					<select id="SizeSelect">
			
					<%
						for(int i=0; i<oS.size(); i++) {
					%>
						<option value="<%=oS.get(i)%>"><%=oS.get(i) %></option>
					<%
					}
					%>
					
				
			</div>
			
			

		</div>
		
		<div class="choiceButton1">
				<button class="buyclass"><a href="/project/Customer/OrderForm">구매하기</a></button>
			

			
				<button class="listclass"><a href="/project/Customer/cart">장바구니</a></button>
		</div>
		
		
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
							<td colspan="7">여러분의 고마운 리뷰를 기다립니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
				
				<div class="cart_index">
		                    <button type="button" class="" onclick=""><button> << </button></a>
		                    <button type="button" class="" onclick=""><button> < </button></a>
		                    <button type="button" class="" onclick=""><button> 1 </button></a>
		                    <button type="button" class="" onclick=""><button> > </button></a>
		                    <button type="button" class="" onclick=""><button> >> </button></a>
		        </div>
		        
		        
	</div><!--review class 끝  -->
				 

 </div>  <!-- Product class 끝 -->
 
 
 

 
</div>
<%@ include file="../footer.jsp"%>