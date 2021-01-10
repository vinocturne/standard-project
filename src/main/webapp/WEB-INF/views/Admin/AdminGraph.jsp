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

	.AdminCharts{
		width: 1000px;
	}

	 .pieCharts>div{
		width: 320px;
		display: inline-block;
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
					<%-- <li><a href=" <%=request.getContextPath() %>/Cs/cs_request">CS Review</a></li> --%>

				</ul>
			</div>
		</div>
	</div>

	<div class="content">

	<div class ="AdminCharts">
	<h1>일자별 주문액 추이</h1>
	<div id="daliyIncomeChart"></div>
	<h1>일자별 가입 고객 추이</h1>
	<div id="daliyRegCusNumChart"></div>
	<div id="chartBox">
	<div class="pieCharts">
		<div id="pc1">
		<h1>브랜드별 누적 판매 점유율 현황</h1>
		<div id="pieChart"></div>
		</div>
		<div id="pc2">
		<h1>여성의류 카테고리별 누적판매 점유율</h1>
		<div id="womanCategoryPieChart"></div>
		</div>
		<div id="pc3">
		<h1>남성의류 카테고리별 누적판매 점유율</h1>
		<div id="manCategoryPieChart"></div>
		</div>
	</div>
</div>
</div>

		</div><!-- content-->
	</div>  <!-- contentWrap-->


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
			chartLabels,chartData 
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
 var parsedMarketShareList =JSON.parse(marketShareList);
 var brandMarketShareList = new Array();
for(var i=0; i<parsedMarketShareList.length;i++){

  var arr = [parsedMarketShareList[i].brandName.toString(),parsedMarketShareList[i].numberOfSales];
  brandMarketShareList.push(arr);
}



//브랜드별 점유율을 나타낼 파이차트. 
var chart = bb.generate({
	  data: {
		columns: brandMarketShareList,
	    type: "pie"
	  },
	  bindto: "#pieChart"
	});

var manCategoryMarketShareListStringfied=JSON.stringify(${manCategoryMarketShareList});
 var parsedManMarketShareListParsed =JSON.parse(manCategoryMarketShareListStringfied);
manCategoryMarketShareList = new Array();
for(var i=0; i<parsedManMarketShareListParsed.length;i++){
  var arr = [parsedManMarketShareListParsed[i].Category2.toString(),parsedManMarketShareListParsed[i].numberOfSales];
  manCategoryMarketShareList.push(arr);
	}

	var chart4 = bb.generate({
	  data: {
		columns: manCategoryMarketShareList,
	    type: "pie" // for ESM specify as: pie()
	  },
	  bindto: "#manCategoryPieChart"
	});
	var WCSL =${womanCategoryMarketShareList};
	var womanCategoryMarketShareListStringfied=JSON.stringify(${womanCategoryMarketShareList});
	console.log(womanCategoryMarketShareListStringfied);
 var parsedWomanMarketShareListParsed =JSON.parse(womanCategoryMarketShareListStringfied);
 console.log(parsedWomanMarketShareListParsed);


 var womanCategoryMarketShareList = new Array();
for(var i=0; i<parsedWomanMarketShareListParsed.length;i++){

  var arr = [parsedWomanMarketShareListParsed[i].Category2.toString(),parsedWomanMarketShareListParsed[i].numberOfSales];
  console.log("womanCategory arr 요소확인");
  console.log(arr);
  womanCategoryMarketShareList.push(arr);
	}

	var chart5 = bb.generate({
	  data: {
	    columns: womanCategoryMarketShareList,
	    type: "pie" // for ESM specify as: pie()
	  },
	  bindto: "#womanCategoryPieChart"
	});

</script>



<%@ include file="../footer.jsp"%>