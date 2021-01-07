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
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href=" <%=request.getContextPath() %>/Admin/magazineManager">Magazine 관리</a></li>
					<li><a href=" <%=request.getContextPath() %>/Cs/cs_request">CS Review</a></li>

				</ul>
			</div>
		</div>
	</div>

	<div class="content">
		<br><br>
		<h3>그래프</h3>
		<br>
	</div>

</div>
<div id="daliyIncomeChart"></div>
<div id="daliyRegCusNumChart"></div>
<div id="pieChart"></div>
<div id="womanCategoryPieChart"></div>
<div id="manCategoryPieChart"></div>
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
  bindto: "#daliyIncomeChart"
});


</script>



<script>
//일자별 등록 고객수 차트
var regNumList =JSON.stringify(${regNumberList});
var parsedRegNumList = JSON.parse(regNumList);

	//차트에 들어갈 배열1
	var chartLabels2= new Array();
	chartLabels2.push("x");
for(var i=0; i<parsedRegNumList.length;i++){
	chartLabels2.push(parsedRegNumList[i].registerDate);
}
//차트에 들어갈 배열2
var chartData2 = new Array();
chartData2.push("일별 가입 고객 수");
for(var i=0; i<parsedRegNumList.length;i++){
	chartData2.push(parsedRegNumList[i].regNum);
}

var chart2 = bb.generate({
  data: {
    x: "x",
    columns: [
    chartLabels2,
    chartData2
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
  bindto: "#daliyRegCusNumChart"
});

 var marketShareList=JSON.stringify(${marketShareList});
 console.log(marketShareList);
 var parsedMarketShareList =JSON.parse(marketShareList);
 console.log(parsedMarketShareList);
 console.log(parsedMarketShareList[0].brandName);
 console.log(parsedMarketShareList[0].numberOfSales);
 parsedMarketShareList[0].brandName;
 parsedMarketShareList[0].numberOfSales;
 var brandMarketShareList = new Array();
for(var i=0; i<parsedMarketShareList.length;i++){

  var arr = [parsedMarketShareList[i].brandName,parsedMarketShareList[i].numberOfSales];
  brandMarketShareList.push(arr);
}


//브랜드별 점유율을 나타낼 파이차트. 
var chart = bb.generate({
	  data: {
	    parsedMarketShareList,
	    type: "pie", // for ESM specify as: pie()
	    onclick: function(d, i) {
		console.log("onclick", d, i);
	   },
	    onover: function(d, i) {
		console.log("onover", d, i);
	   },
	    onout: function(d, i) {
		console.log("onout", d, i);
	   }
	  },
	  bindto: "#pieChart"
	});

	// setTimeout(function() {
	// 	chart.load({
	// 		columns: [
	// 			["setosa", 90],
	// 			["versicolor", 20],
	// 			["virginica", 60],
	// 		]
	// 	});
	// }, 1500);
	
	var chart4 = bb.generate({
	  data: {
	    columns: [
        [parsedMarketShareList[0].brandName,parsedMarketShareList[0].numberOfSales]
	    ],
	    type: "pie", // for ESM specify as: pie()
	    onclick: function(d, i) {
	   },
	    onover: function(d, i) {
	   },
	    onout: function(d, i) {
	   }
	  },
	  bindto: "#womanCategoryPieChart"
	});
	var chart5 = bb.generate({
	  data: {
	    columns: [
        [parsedMarketShareList[0].brandName,parsedMarketShareList[0].numberOfSales]
	    ],
	    type: "pie", // for ESM specify as: pie()
	    onclick: function(d, i) {
	   },
	    onover: function(d, i) {
	   },
	    onout: function(d, i) {
	   }
	  },
	  bindto: "#manCategoryPieChart"
	});

</script>



<%@ include file="../footer.jsp"%>