<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="head.jsp"%>
</head>

<!-- HEADER -->
<%@ include file="header.jsp"%>

<!-- CONTENT : MAIN -->
<div class="container mt-3">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active"></div>
			<div class="carousel-item"></div>
			<div class="carousel-item"></div>
			<div class="carousel-item"></div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

</div>

<!-- FOOTER -->
<%@ include file="footer.jsp"%>