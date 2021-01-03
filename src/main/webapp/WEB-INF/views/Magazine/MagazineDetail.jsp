<%@page import="org.standard.project.magazine.MagazineVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
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
		

		<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="magazine" items="${list}">
							<tr>
								<td name="m_Seq">${magazine.m_Seq}</td>
						
								<td><img src ="${pageContext.request.contextPath}${magazine.m_Thumb}" id="Mag_thumbnail"></td>
								<td>${magazine.m_Title}</td>
								<td>${magazine.m_Content}</td>
								<td>${magazine.m_Date}</td>
								<td>${magazine.m_Hit}</td>
								<td>${magazine.m_Like}</td>
								
							</tr>
						</c:forEach>
					</c:when>


				</c:choose>
		
		
				
				
				<div class="detailExplain">
					여기엔 상품 설명이 들어갈거에요 
				</div>
				
			</div>


		</div>







</div>

<%@ include file="../footer.jsp"%>