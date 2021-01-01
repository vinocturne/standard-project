<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 그래프 -->
<link href="/path/to/c3.css" rel="stylesheet">
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="<%=request.getContextPath()%>/ResourcesFile/js/billboard.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/billboard.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/insight.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script> 
<style>

   body{
       margin-left: 100px;
       margin-right: 10%;
   }
    .table{
        width: 1200px;
    }
    
</style>


</head>

<%@ include file="../header.jsp"%>

<div class="content_wrap">
	<!-- side_nav -->

	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">관리자페이지</p>
				<ul>
					<li><a href="/project/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href="/project/Admin/magazineManager">Magazine 관리</a></li>
					<li><a href="/project/Cs/cs_request">CS Review</a></li>

				</ul>
			</div>
		</div>
	</div>

	<div class="content">
		<br><br>
		<h3>그래프</h3>
		<br>
	<canvas id="line-chart"></canvas>
	</div>

</div>
<div id="lineChart"></div>


<script>
	var list =JSON.stringify(${list});
	var parsed = JSON.parse(list);

	//차트에 들어갈 배열1
	var chartLabels= new Array();
	chartLabels.push("x");
for(var i=0; i<parsed.length;i++){
	chartLabels.push(parsed[i].orderDate);
}
//차트에 들어갈 배열2
var chartData = new Array();
chartData.push("일별 주문액");
for(var i=0; i<parsed.length;i++){
	chartData.push(parsed[i].totalPrice);
}


	var chart = bb.generate({
  data: {
    x: "x",
    columns: [

	chartLabels,
	chartData 

    ],
    type: "line", // for ESM specify as: line()
  },
  axis: {
    x: {
      type: "timeseries",
      tick: {
        format: "%m-%d"
      }
    }
  },
  bindto: "#timeseriesChart"
});

// var ctx = $("#line-chart");
// 	var lineChart = new Chart(ctx, {
// 	  type: 'line',
// 	  data: {
// 	    labels : chartLabels,
// 	    datasets: [
// 	      {
// 	        label: "2020",
// 	        data : chartData
// 	      }
// 	    ]
// 	  }
// 	});

</script>

<%@ include file="../footer.jsp"%>