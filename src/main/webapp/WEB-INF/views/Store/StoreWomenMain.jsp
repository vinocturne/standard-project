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
width:300px;
margin-right: 60px;
}

.content_wrap {
   margin-left: 100px;
   margin-right: 7%;
}

.table {
   width: 1200px;
}

.card {
	height:390px;
	width:350px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 7px;
	margin-right:2px;
	margin-bottom: 3px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	overflow: hidden;
}
.card-header {
    width:100%; 
    position: center;
	height:310px;
	display: inline-block;
	overflow: hidden;
	display:relative;
}

.card-header img{vertical-align:middle; width:370px; margin-top: -12px; margin-left:-20px;}
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
input[type=text] {
  border: none;
  border-bottom: 2px solid black;
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
               <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain" class="side_nav_title">Women</a></li>
               <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Top">TOP</a></li>
               <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Bottom">BOTTOM</a></li>
               <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Dress">DRESS</a></li>
               <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=Shoes">SHOES</a></li>
               <li><a href="<%=request.getContextPath() %>/shop/StoreWomenMain?category=ACC">ACC</a></li>
            </ul>
         </div>
      </div>
   </div>
<div>

<form action="/project/shop/StoreWomenMain" method="get" enctype="multipart/form-data">
<input type="hidden" id="category" name="category" value="${category}">
제품명 검색: 
<input type="text" value="${search}" name="s_pp_Name">
<input type="image" src="<%=request.getContextPath()%>/ResourcesFile/img/search.svg"  alt="search" width="20" height="20">
</form>
<br><br>
 <c:set var="i" value="0" />
 <c:set var="j" value="4" />

  <c:choose>
   <c:when test="${fn:length(list)>0}">
   <table border=0>
    <c:forEach var="productParent" items="${list}">
     <c:if test="${i%j == 0}">
    <tr>
    </c:if>
    <td>
     <div class="secondbody"> 
     <div class="mainbody"> 
        <div class="card">
          <a href="<%=request.getContextPath() %>/shop/product?p_id=${productParent.parent_p_Id }"class="card-header"><img src="${pageContext.request.contextPath}${productParent.pp_thumb}" alt="Card image"  ></a>
           <div class="card-body" >
            <h4 class="card-title">${productParent.pp_Name}</h4>
            <p class="card-text">${productParent.pp_Price}</p>
            <p></p>
          </div>
        </div>
     </div>
     </div>
   </td>
     <c:if test="${i%j == j-1 }">
     </c:if>
     <c:set var="i" value="${i+1 }"/>
    </c:forEach>
    </table>
   </c:when>
  <c:otherwise>
  <div class="secondbody" style="padding-left:100px">
   검색하신 상품이 없습니다.
   </div>   
  </c:otherwise>
  </c:choose>


</div>
</div> <!--content_wrap 끝  -->



<%@ include file="../footer.jsp"%>