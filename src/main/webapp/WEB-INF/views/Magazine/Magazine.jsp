<%@page import="org.standard.project.magazine.MagazineVO"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

.card :hover{
opacity:90%;
}

.secondbody{
width:1200px;
margin-top: 45px;
}

.content_wrap {
	margin-left: 100px;
	margin-right: 7%;
	flex-wrap:rap;

}

.table {
	width: 1200px;
	
}

/* .magazine {
	flex-wrap:rap;
} */

.card{
margin-left:7px;
margin-right:2px;
margin-top:7px;
margin-bottom:3px;

}

.line{
margin-top:73px;
}


.mainbody{
display : grid;

}
 
.card-body{
flex-wrap:rap;
}


/* SIDE BAR*/

.col-auto ul li a{
  color: black;
  text-decoration: none;
  display: inline-block;
  position: relative;
}
.col-auto ul li a:after {    
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 1px;
  left: 50%;
  position: absolute;
  background: black;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
.col-auto ul li a:hover:after { 
  width: 100%; 
  left: 0; 
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
					
					<li><a href="/project/Customer/cart">Cart</a></li>
					<li><a href="/project/Customer/order">Order</a></li>
					<li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
				</ul>
			</div>
		</div>
	</div>

			 
	

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

 <c:set var="i" value="1" />
 <c:set var="j" value="5" />

  <c:choose>
   <c:when test="${fn:length(list)>0}">
    <c:forEach var="magazine" items="${list}">


     <div class="secondbody"> 
     
	    	 <div class="card" style="width:280px">
			    <div class="card-body">
			      <h4 class="card-title">${magazine.m_Title}</h4>
			      <p class="card-text">${magazine.m_Content}</p>
			      
			    </div>
			    <a href="/project/magazine/MagazineDetail?m_Seq=${magazine.m_Seq }"><img class="card-img-bottom" src="${pageContext.request.contextPath}${magazine.m_Thumb}" alt="Card image" style="width:100%"></a>
			    
	  		</div>
     </div>

  	<c:if test="${i%j == j-1}">
<!-- 여기서 엔터가 들어가야함 -->
	</c:if>

   <c:set var="i" value="${i+1}" />


   </c:forEach>


   </c:when>
  <c:otherwise>
   <div class="secondbody" style="padding-left:100px">
    게시글이 존재하지 않습니다.
  </div>   
  </c:otherwise>
  </c:choose>


<%-- 

<c:set var="i" value="0" />
<c:set var="j" value="4" />
 
<div id="magazineList" class="bg-1">
    <div class="container">
        <c:forEach var="magazine" items="${list}" varStatus="status">
            
            <c:if test="{i%j == 0}">
            
           	</c:if>
            
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <h4 class="card-title">${magazine.m_Title}</h4>
			     			<p class="card-text">${magazine.m_Content}</p>
			     		    <p>하트하트</p>
			    		</div>
			    		<a href="/Admin/MagazineIn">
			    		<img class="card-img-bottom" src="${pageContext.request.contextPath}${magazine.m_Thumb}" alt="Card image" style="width:100%"></a>
                        </div>
                   
            <c:if test="${i%j == j-1}">
    		
            </c:if>        
              </div>    
        </c:forEach>
   </div>
 </div>     --%>





</div> <!--content_wrap 끝  -->

<%@ include file="../footer.jsp"%>