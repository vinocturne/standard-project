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


 <c:set var="i" value="0" />
 <c:set var="j" value="3" />

  <c:choose>
   <c:when test="${fn:length(list)>0}">
    <c:forEach var="productParent" items="${list}">
     
     <div class="secondbody"> 
     <div class="mainbody"> 
    	 <div class="card" style="width:350px; height:370px">
		    <a href="/project/shop/product?p_id=${productParent.parent_p_Id }"><img class="card-img-bottom" src="${pageContext.request.contextPath}${productParent.pp_thumb}" alt="Card image" style="width:100%"></a>
  			<div class="card-body">
		      <h4 class="card-title">${productParent.pp_Name}</h4>
		      <p class="card-text">${productParent.pp_Price}</p>
		      <p></p>
		    </div>
  		</div>
     </div>
     </div>
    
    <c:if test="${i%j == j-1}">
     </tr>
     넘어가라 넘어가라
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