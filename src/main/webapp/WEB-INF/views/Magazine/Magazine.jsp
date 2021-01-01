<%@page import="org.standard.project.magazine.MagazineVO"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.secondbody{
width:1200px;

}

body {
	margin-left: 100px;
	margin-right: 10%;
}

.table {
	width: 1200px;
}

.magazine {
	float: left;
}

.card{
margin-left:7px;
margin-right:2px;
margin-top:7px;
margin-bottom:3px;
}

.line{
margin-top:73px;
}

</style>

</head>
<%@ include file="../header.jsp"%>

<div class="content_wrap">

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
	
	<%-- <c:set var="i" value="0" /> <c:set var="j" value="4" />
	<table>
	<c:choose>
	
	<c:when test="${fn:length(list)>0}">
	  	<c:forEach var="magazine" items="${list}">
			<c:if test="${i%j == 0 }">		
			<tr>
			 </c:if>
			 <td>${magazine.m_Title}</td>
			 <td>${magazine.m_Content}</td>
			 <td>${magazine.m_Content}</td>
			  <a href="MagazineIn"><img class="card-img-bottom" src="${pageContext.request.contextPath}${magazine.m_Thumb}" alt="Card image" style="width:100%"></a>
			 <c:if test="${i%j == j-1 }">
			 </tr>
			 </c:if>
			 <c:set var="i" value="${i+1}"/>
			 </c:forEach>
			 </c:when>
			 <c:otherwise>
			 <tr>
			 <td>존재하지않습니다</td>
			 </tr>
			 </c:otherwise>
		 	 </c:choose>
			 </table> --%>
			 
	

<!--세로로 길게 나오는거  -->
<%-- <div class="first line">
	<c:set var="i" value="0" /> <c:set var="j" value="3" />
	
	<c:choose>
	<c:when test="${fn:length(list)>0}">
	  	
		<c:forEach var="magazine" items="${list}">
		
	<div class="card" style="width:280px">
	    <div class="card-body">
	      <h4 class="card-title">${magazine.m_Title}</h4>
	      <p class="card-text">${magazine.m_Content}</p>
	      <p>하트하트</p>
	    </div>
	    <a href="/MagazineIn"><img class="card-img-bottom" src="${pageContext.request.contextPath}${magazine.m_Thumb}" alt="Card image" style="width:100%"></a>
  	</div>
	
		</c:forEach>
		 
	</c:when>
			<c:otherwise>
				<tr>
					<td>조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
	</c:choose>
	
</div> --%>


 <c:set var="i" value="0" />
 <c:set var="j" value="4" />

  <c:choose>
   <c:when test="${fn:length(list)>0}">
    <c:forEach var="magazine" items="${list}">
     <c:if test="{i%j == 0}">
      <tr>
     </c:if>
     
     <div class="secondbody"> 
     <div class="mainbody"> 
    	 <div class="card" style="width:280px">
		    <div class="card-body">
		      <h4 class="card-title">${magazine.m_Title}</h4>
		      <p class="card-text">${magazine.m_Content}</p>
		      <p>하트하트</p>
		    </div>
		    <a href="/Admin/MagazineIn"><img class="card-img-bottom" src="${pageContext.request.contextPath}${magazine.m_Thumb}" alt="Card image" style="width:100%"></a>
  		</div>
     </div>
     </div>
    <c:if test="${i%j == j-1}">
     </tr>

    </c:if> 
   <c:set var="i" value="${i+1}" />
    </c:forEach>
   </c:when>
  <c:otherwise>
   <tr>
    <td>존재하지 않습니다.</td>
   </tr>
  </c:otherwise>
  </c:choose>




</div> <!--content_wrap 끝  -->

<%@ include file="../footer.jsp"%>