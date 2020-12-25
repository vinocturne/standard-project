<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/head.jsp"%>
<style>
.side_nav{
margin : 0;
}

.container .card{
display : grid;

}
.card{
margin:0;
}
.btn-primary {
    color: #fff;
    background-color: grey;
    border-color: black;
}

.btn btn-primary{
float : left;

}

</style>


</head>

<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="content_wrap inner">

	<div class="side_nav">
		<p class="side_nav_title">Men`s</p>
			<ul>
			<li ><a href="/project/cart">Cart</a></li>
			<li ><a href="/project/order" >Order</a></li>
			<li ><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
			</ul>
	</div>
	
<div class="container">

  <div class="card" style="width:300px">
    <img class="card-img-top" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/1.jpg"  alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">내일 뭐입을까 </h4>
      <p class="card-text">내일 뭐 입어야 하는지 모르겠다면 봐야하는 기사</p>
      <a href="#" class="btn btn-primary">자세히 보기</a>
    </div>
  </div>
  
  <br> 
  

  <div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">모레는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
      <a href="#" class="btn btn-primary">자세히 보기</a>
    </div>
    <img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/2.jpg" alt="Card image" style="width:100%">
  </div>
</div>
 <br> 
 
  <div class="card" style="width:300px">
    <div class="card-body">
      <h4 class="card-title">모레는 뭐 입을까</h4>
      <p class="card-text">모레 뭐 입어야 할지 모르겠다면 보는 기사</p>
      <a href="/project/magazine/MagazineDetail" class="btn btn-primary">자세히 보기</a>
    </div>
    <img class="card-img-bottom" src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/3.jpg" alt="Card image" style="width:100%">
  </div>
  
</div>



<%@ include file="../footer.jsp"%>