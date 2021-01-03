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
     float:left;
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
     padding-top:100px;
     padding-left:30px;
     padding-bottom:70px;
    }
    
    .choiceButton1{
 	 padding-top:50px;
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
			List<ProductChildVO> c_VO = (List<ProductChildVO>)request.getAttribute("c_VO");
			%>
		
		<div class="image">
		<img src = "${pageContext.request.contextPath}<%=p_VO.getPp_thumb() %>" 
		style="width:500px; height:500px" class="picture">
		</div>
		
		
		<div class="productside">
			<div class="explain">
				<h1>StoreDetail 테스트</h1><br>
					
				
				<h4><%=p_VO.getParent_p_Id() %></h4>
				<%
				for(int i=0; i<c_VO.size(); i++) {
				%>
				<h4><%=c_VO.get(i) %></h4>
				<%
				}
				%>
				
				
				<div class="detailExplain">
					여기엔 상품 설명이 들어갈거에요 
				</div>
				
			</div>
			
			<div class="choiceButton1">
				<button class="buyclass"><a href="/project/Customer/cart">구매하기</a></button>
			
		
			
			
				<button class="listclass"><a href="/project/Customer/cart">장바구니</a></button>
			</div>

		</div>
		
	 <div class="review">
	 
				<div class="title_area">
					<div class="title_area1">
						<h1>Review</h1>
					</div>
				</div>
				<div class="order_table">
					<table class="type15">
						<thead>
							<tr>
								<th style="width:10%">No.</th>
								<th style="width:60%">질문</th>
								<th style="width:15%">문의유형</th>
								<th style="width:15%">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- 샘플  -->
								<td>1</th>
								<td>환불 부탁드립니다 </th>
								<td>결제/환불 </th>
								<td>2020-12-25</td> 
							</tr>
						</tbody>
					</table>
				</div>
				
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