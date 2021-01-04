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
			List<ProductChildVO> c_VO = (List<ProductChildVO>)request.getAttribute("c_VO");
			%>
		
		<div class="image">
		<img src = "${pageContext.request.contextPath}<%=p_VO.getPp_thumb() %>" 
		style="width:500px; height:500px" class="picture">
		</div>
		
		
		<div class="productside" style = border : solid 1px red;>
			<div class="explain">
				<h1><%=p_VO.getPp_Name() %></h1><br>
					
				
				<h4><%=p_VO.getPp_Price() %></h4>
				<%
				for(int i=0; i<c_VO.size(); i++) {
				%>
				<br>
				<h2 class="detailExplain">상품 상세정보 <br></h2>
					<h4> 브랜드  :  <%=p_VO.getPp_Brand() %></h4>
					<br>
					<h4> 상품종류 :  <%=p_VO.getPp_Category2() %></h4>
		
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
				<table class="table table-hover">
					<thead>
				<tr>
					<th style="width:10%; height:10%">No.</th>
					<th style="width:10%; height:10%">제목</th>
					<th style="width:10%; height:10%">내용</th>
					<th style="width:10%; height:10%">글쓴이</th>
					<th style="width:10%; height:10%">작성일</th>
					<th style="width:10%; height:10%">평점</th>
					
				</tr>
			</thead>
				<!-- <script>
				window.onload(function(){
					var r_Seq = ${r_Seq}
					var r_Title = ${r_Title}
					
					var listclass = document.getElementById("listclass");
					listclass.onclick = function(){
				
					}
				}
				</script> -->
				<tbody>
				
				<tr>
								<td>1 ${review.r_Seq}</td>
								<td>추천합니다.${review.r_Title}</td>
								<td>좋아요 ${review.r_Content}</td>
								<td>담${review.r_Writer}</td>
								<td>2021.01.04${review.r_Date}</td>
								<td>${review.r_Star}</td>
				</tr>
				
				<tr>
								<td>2 ${review.r_Seq}</td>
								<td>이쁘네요.${review.r_Title}</td>
								<td>괜찮아요 ${review.r_Content}</td>
								<td>비트${review.r_Writer}</td>
								<td>2021.01.04${review.r_Date}</td>
								<td>${review.r_Star}</td>
				</tr>
				<%-- <c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="review" items="${list}">
							<tr>
								<td>1 ${review.r_Seq}</td>
								<td>추천합니다.${review.r_Title}</td>
								<td>좋아요 ${review.r_Content}</td>
								<td>담${review.r_Writer}</td>
								<td>2021.01.04${review.r_Date}</td>
								<td>${review.r_Star}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">등록된 리뷰가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose> --%>
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