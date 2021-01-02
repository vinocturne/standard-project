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
    
    .buyclass{

     border: solid 1px black;
      padding-left:30px;

          margine:0;
    }
    
    .listclass{

    border: solid 1px black;
     padding-left:30px;

         margine:0;
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
					<li><a href="/project/Customer/cart">TOP</a></li>
					<li><a href="/project/Customer/order">BOTTOM</a></li>
					<li><a href="/project/shop/DamStoreMain">SHOES</a></li>
				</ul>
			</div>
		</div>
	</div>





<div class="Product">
		
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
			</div>
			<br>
			
			<div class="buyclass">
			구매하기
			</div>
			
			<br>
			<div class="listclass">
			장바구니
			</div>
			
		</div>
		
 </div>
</div>
<%@ include file="../footer.jsp"%>