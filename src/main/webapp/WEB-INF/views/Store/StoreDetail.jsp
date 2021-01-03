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

     padding-left:30px;
     margine:0;

    }
    
    .listclass{

    padding-left:30px;
    margine:0;

    }
    
    .buyclass:hover {
     background-color:black;
     color:white;
     
    }
    
    .listclass:hover {
	    background-color:black;
	    color:white;
    }
    
    #topMenu ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	}

	#topMenu ul li {
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	position: relative;
	}

.menuLink, .submenuLink {
display: block; 
width: 150px;
font-weight: bold; 
font-family: "Trebuchet MS", Dotum;
}



.topMenuLi:hover .menuLink {
color: white; 
background-color: grey;
}


.submenuLink {
color: #2d2d2d;
background-color: white;
border: solid 1px black;
margin-top: -1px;
}

/* .longLink {
width: 190px;
} */

.submenu {
position: absolute;
height: 0px;
overflow: hidden;
transition: height .2s;
webkit-transition: height .2s;
-moz-transition: height .2s;
-o-transition: height .2s;
}

.topMenuLi:hover .submenu {
height: 93px;
}

.submenuLink:hover {

background-color: #grey;

}
    
    </style>
    
</head>
<%@ include file="../header.jsp" %> 


<div class="content_wrap inner">

<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">Store</p>

					<a href="/project/shop/StoreManMain" 
						 class="side_nav_title" id="topMenu">Man</a>
						
					<a href="#"> <!--줄띄우기 --></a>
					 <ul>
					<li class="topMenuLi">
						<a class="menuLink" href="/project/Customer/cart">TOP</a>
							<ul class="submenu"> 
								<li><a class="submenuLink longLink">티셔츠</a></li> 
								<li><a class="submenuLink longLink">맨투맨</a></li>
								<li><a class="submenuLink longLink">셔츠</a></li> 
							</ul>
					
				
				
					<a href="/project/Customer/order">BOTTOM</a>
					<a href="/project/shop/DamStoreMain">SHOES</a>
					
					
					</li>
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
			
			<button class="buyclass"><a href=""></a>구매하기</button>
			<br>
			<button class="listclass"><a href=""></a>장바구니</button>
			
			
			
			
		</div>
		
 </div>
</div>
<%@ include file="../footer.jsp"%>