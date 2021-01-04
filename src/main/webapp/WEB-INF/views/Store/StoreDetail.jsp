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
		
		
		<div class="productside" style = border : solid 1px red;>
			<div class="explain">
				<h1>StoreDetail 테스트</h1><br>
					
				
				<h4><%=p_VO.getParent_p_Id() %></h4>
				<%
				for(int i=0; i<c_VO.size(); i++) {
				%>
				<br>
				<h4 class="detailExplain">상품 상세정보 <br>
					<%=c_VO.get(i) %></h4>
					<%
					}
					%>
				
			</div>
			
			

		</div>
		
		<div class="choiceButton1">
				<button class="buyclass"><a href="/project/Customer/cart">구매하기</a></button>
				

			
				<button class="listclass"><a href="/project/Customer/cart">장바구니</a></button>
			</div>
		
		
	 <div class="review">
	 
				<div class="title_area">
					<div class="title_area1">
						<h1>Review</h1>
					</div>
				</div>
				<table class="table table-hover" height="100" width="1100">
					<thead>
				<tr>
					<th style="width:5%; height:10%">No.</th>
					<th style="width:5%; height:10%">제목</th>
					<th style="width:5%; height:10%">내용</th>
					<th style="width:5%; height:10%">글쓴이</th>
					<th style="width:5%; height:10%">작성일</th>
					
				</tr>
			</thead>
				
				<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="product" items="${list}">
							<tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-parent_p_Id="${product.parent_p_Id}" />
										<script>
											$(".chBox").click(
													function() {
														$("#allCheck").prop(
																"checked",
																false);
													});
										</script>
									</div>
								</td>
								<td><a href="project/Seller/ProductAddChild" name="pp_Name">${product.pp_Name}</a></td>
								<td>${product.parent_p_Id}</td>
								<td>${product.pp_Category1}</td>
								<td>${product.pp_Category2}</td>
								<td><img src ="${pageContext.request.contextPath }${product.pp_thumb}" id="product_thumbnail"></td>
								<td><%=customer.getBrandName()%></td>
								<td>${product.pp_Price}</td>
								<td>
								<button onclick="window.location.href='ModifyParentProduct?seq=${product.parent_p_Id}'">수정</button>
								<button onclick="window.location.href='ProductAddChild?seq=${product.parent_p_Id}'">옵션</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="9">조회된 결과가 없습니다.</td>
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