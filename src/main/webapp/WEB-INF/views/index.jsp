<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="head.jsp"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<%@ include file="header.jsp"%>

<!-- CONTENT : MAIN -->
	<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
</head>
<body>

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
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/ResourcesFile/img/main01.jpg" alt="main01" width="850" height="450">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/ResourcesFile/img/main02.jpg" alt="main02" width="850" height="450">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/ResourcesFile/img/main03.jpg" alt="main03" width="850" height="450">
    </div>
     <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/ResourcesFile/img/main04.jpg" alt="main04" width="850" height="450">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

</div>

</body>
</html>


<!-- FOOTER -->
<%@ include file="footer.jsp"%>