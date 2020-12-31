<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
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
</style>

</head>
<%@ include file="../header.jsp"%>

<div class="content_wrap">

	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">Magazine</p>
				<ul>
					<li><a href="#">Men`s</a></li>
					<li><a href="#"> <!--줄띄우기 -->
					</a></li>
					<li><a href="/project/Customer/cart">Cart</a></li>
					<li><a href="/project/Customer/order">Order</a></li>
					<li><a href="Wishlist.html">Wish list</a></li>
					<!--a태그는 wishList 수정되면 링크고쳐야함  -->
					<li><a
						href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
				</ul>
			</div>
		</div>
	</div>
	


<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">모레는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>

    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/3.jpg" alt="Card image" style="width:100%"></a>
  </div>

<div class="card" style="width:300px">
    <a href="magazine"><img class="card-img-top" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/1.jpg"  alt="Card image" style="width:100%"></a>
    <div class="card-body">
	  <h4 class="card-title">내일 뭐입을까 </h4>
      <p class="card-text">내일 뭐 입어야 하는지 모르겠다면 봐야하는 기사</p>
    </div>
  </div>

<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">모레는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/2.jpg" alt="Card image" style="width:100%"></a>
  </div>

<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">4는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/4.jpg" alt="Card image" style="width:100%"></a>
  </div>

<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">5는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
      
    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/5.jpg" alt="Card image" style="width:100%"></a>
  </div>
  
  <br><br>
  
  <div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">모레는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>

    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/3.jpg" alt="Card image" style="width:100%"></a>
  </div>

<div class="card" style="width:300px">
    <a href="magazine"><img class="card-img-top" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/1.jpg"  alt="Card image" style="width:100%"></a>
    <div class="card-body">
	  <h4 class="card-title">내일 뭐입을까 </h4>
      <p class="card-text">내일 뭐 입어야 하는지 모르겠다면 봐야하는 기사</p>
    </div>
  </div>

<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">모레는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/2.jpg" alt="Card image" style="width:100%"></a>
  </div>

<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">4는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/4.jpg" alt="Card image" style="width:100%"></a>
  </div>

<div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">5는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
      
    </div>
    <a href="#"><img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/5.jpg" alt="Card image" style="width:100%"></a>
  </div>
  
  
  
  
  
  
  
</div><!--content_wrap 끝  -->


<%@ include file="../footer.jsp"%>