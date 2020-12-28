<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>
<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->
	<div class="side_nav">
		<div class="side_nav_item">
			<p class="side_nav_title">My page</p>
			<ul>
				<li><a href="#">Login</a></li>
				<li><a href="/project/Customer/Register">Register</a></li>
				<li><a href="/project/Customer/cart">Cart</a></li>
				<li><a href="/project/Customer/order">Order</a></li>
				<li><a
					href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
			</ul>
		</div>
	</div>

	<div class="frame">
		<div class="container">
			<div class="nav">
				<ul class="nav-list">
					<li>관리자페이지</li>
					<br>
					<li clas="nav-item"><a href="seller.html" class="nav-link">상품
							관리</a></li>
					<li clas="nav-item"><a href="" class="nav-link">배송 관리</a></li>
					<li clas="na`v-item"><a href="" class="nav-link">리뷰 관리</a></li>
				</ul>
			</div>
			<div class="content">
				<h3>리뷰관리</h3>
				<br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>글 내용</th>
							<th>재고현황</th>
							<th>평점</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="">후드</a></td>
							<td>내용</td>
							<td>100</td>
							<td>
								<div class="starRev">
									<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
									<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
									<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
									<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
									<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
								</div> <script>
									$('.starRev span').click(
											function() {
												$(this).parent().children(
														'span').removeClass(
														'on');
												$(this).addClass('on').prevAll(
														'span').addClass('on');
												return false;
											});
								</script>
						</tr>
						<tr>
							<td>2</td>
							<td>바지</td>
							<td>내용</td>
							<td>200</td>
							<td>별별별별별</td>

						</tr>
						<tr>
							<td>3</td>
							<td>티셔츠</td>
							<td>내용</td>
							<td>10</td>
							<td>별별별별별</td>

						</tr>
					</tbody>
				</table>

			</div>

		</div>

		<%@ include file="../footer.jsp"%>