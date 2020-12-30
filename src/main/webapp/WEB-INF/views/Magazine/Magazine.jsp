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
				<p class="side_nav_title">Store</p>
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

	<div class="row" style="width: 1000px">
		<div class="col-lg-9">
			<div class="card bg-light mt-3">
				<div class="card-body">
					<div class="row">
						<div class="col-3">
							<img src="<%=request.getContextPath()%>/ResourcesFile/img/Magazin/1.jpg" width="150px" height="100px">
						</div>
						<div class="col-9">
							<h5 class="card-title">토끼귀여웡</h5>
							<p class="card-text">
								<a href="#">내일은 뭐입을까</a>
							</p>
							<br>
							<div class="row">
								<div class="col-9 text-left">
									금액<span style="color: red;">1</span>
									추천<span style="color: red;">2</span> 
									댓글<span style="color: red;">3</span>
									감사<span style="color: red;">4</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>












</div>
</div>
<%@ include file="../footer.jsp"%>