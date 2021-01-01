<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
</head>
<%@ include file="../header.jsp" %> 
<body>
<div>
    <div class="container">
        <button class="btn btn-dark" src><a href="/project/magazine/magazineList" class="text-white">목록으로 이동</a></button>
        <div id="test" class="row no-collapse-1"></div>
    </div>
</div>


<div class="listItem">

			<div class="articleImg">
			<img src=img alt="m_Img" style="display: inline;">
			</div>
			
			<span class="m_Title">m_Title</span>
			<br>
			<div style="border:1px solid">
				<span class="m_Writer">m_Writer</span> <span class="m_Date">m_Date</span>
				<span class="m_Hit">m_Hit</span>
			</div>
			<div class="articleInfo">
				<div class="title">
					
					<button class="btn btn-dark" src><a href="/project/magazine/구매링크로가야됨" class="text-white">구매하기</a></button>	
					<br>
					<br>
				<div class="info">
					
					<b class="rev-division"><a href="/?m=magazine&amp;brand=marithefrancoisgirbaud"><span class="brand">마리떼 프랑소와 저버</span></a></b>								</div>
				<p class="description">
					 마리떼 프랑소와 저버 20 F/W 컬렉션으로 완성한 인플루언서의 특별한 코디.									 <a href="/index.php?m=magazine&amp;media=musinsa" class="mediumName">무신사 매거진</a> 								</p>
			</div>
</div>
 <div id="test"></div>
 
 
 
<script> 
   $(document).ready(function () {
          var val = location.href.substr(
              location.href.lastIndexOf('=') + 1
          );
          
          
          var step;
            for (step = 1; step < 21; step++) {
              if(step == val)
              {
                var html = '';
                var title = "";
                var contents = "";
                var img = "<%=request.getContextPath()%>/ResourcesFile/img/Magazin/"+ step + ".jpg";
                
                /*
                  if(step == 1)
                  {
                      title = "1리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "1양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  else if(step == 2)
                  {
                      title = "2리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "2양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  else if(step == 3)
                  {
                      title = "3리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "3양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  else if(step == 4)
                  {
                      title = "4리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "4양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  else if(step == 5)
                  {
                      title = "5리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "5양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  else if(step == 6)
                  {
                      title = "6리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "6양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  else
                  {
                    title = "etc리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                      contents = "etc양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                  }
                  */

                  if(step == 1)
                      contents = "옷이 좋았다";
                  else if(step == 2)
                      contents = "근데 이젠 아니다";
                  else if(step == 3)
                      contents = "난 지금 눈물";
                  else if(step == 4)
                      contents = "흘리고있다";
                  else if(step == 5)
                      contents = "나는 옷이 싫다";
                  else
                      contents = "‘오늘 뭐 입지?’ 고민을 덜어줄 옷 .";

                  title = "매거진" + step;
                  
                  html += '<section class="4u"> <a href="#" class="image featured"><img style="min-width:300px;height:200px" class="img-thumbnail" src=' + img + ' alt=""></a>';                  
                  html += '<img class="card-img-top" src=' + img + ' style="width:100%;height:140px" alt="Card image cap">';
                  html += '<div class="box">';
                  html += '<p>' + title + '</p>';
                  html += '<p>' + contents + '</p>';
                  html += '</section>';

              
              }
             
            }
            document.getElementById("test").innerHTML = html;
            
            
            <span class="date division">등록일 : 20.12.23 14:00</span>
            <img title="올해 최고의 뷰티템은? 2020 뷰신사 연말 결산!" 
            		alt="올해 최고의 뷰티템은? 2020 뷰신사 연말 결산!" 
        			src = img 
            		style="display: inline;">
            		
            		
            
      });
</script>

<%@ include file="../footer.jsp"%>