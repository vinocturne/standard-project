<%@page import="org.standard.project.magazine.MagazineVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 

<style>

.explain{
padding-top:50px;
padding-bottom:50px;
}

</style>
</head>

<%@ include file="../header.jsp" %>



<div class="content_wrap inner">
    
	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">Magazine</p>
				<ul>
					<li><a href="/project/Customer/myPage">My page</a></li>
					<li><a href="#"> <!--줄띄우기 -->
					</a></li>
					<li><a href="/project/Customer/cart">Cart</a></li>
					<li><a href="/project/Customer/order">Order</a></li>
					<li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
				</ul>
			</div>
		</div>
	</div>

<div class="Product" style = padding-top:57px;>
		
			<%
			MagazineVO m_Seq = (MagazineVO)request.getAttribute("m_Seq");
			
			%>
		
		<div class="image">
		<img src = "${pageContext.request.contextPath}<%=m_Seq.getM_Thumb() %>" 
		style="width:700px; height:500px" class="picture">
		</div>
		
		
		<div class="productside">
			<div class="explain">
				<h1><%=m_Seq.getM_Title() %></h1><br>
					
				<h1><%=m_Seq.getM_Content() %></h1><br>

			</div>

		</div>

</div>


</div>


<%@ include file="../footer.jsp"%>