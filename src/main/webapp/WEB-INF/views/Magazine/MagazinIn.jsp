<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
</head>
<%@ include file="../header.jsp" %> 
<body>
<div>
    <div class="container">
        <button class="btn btn-dark" src><a href="../views/MagazinPages/Magazin.html" class="text-white">목록으로 이동</a></button>
        <div id="test" class="row no-collapse-1"></div>
    </div>
</div>

<script>
   window.onload = function() {
        var html = '';
        var step;
          for (step = 0; step < 1; step++) {
            
            var title = "";
            var contents = "";
            var img = "";

            if(step == 0)
            {
                title = "리포트 | [무신사 매거진] 리버서블 아우터, 한쪽으로만 입고 있다면?";
                contents = "양면 모두 입을 수 있는 리버서블 아우터가 정말 존재할까?<br> 자고로 리버서블 아우터는 양면 모두 입을 수 있어야 한다. 그런 녀석들만 모았다. <br>겨울에도 멋스럽게 코디하고 싶지만 그럴 수 없는 게 우리 현실이다. 그도 그럴 수밖에 없는 게 이너를 매일 다르게 입는다고 해도 아우터가 늘 똑같기 때문인데. 그렇다고 아우터를 여러 벌씩 사자니 지갑 사정이 넉넉지 않다. 그럴 때 유용한 게 바로 양면으로 입을 수 있는 리버서블 아우터. 오늘은 리버서블 아우터의 매력에 대해 알려주고자 한다. 양면 모두 활용하는 코디 노하우도 준비했다.";
                img = "../img/Magazin/1.jpg";
            }
   

              html += '<section class="4u"> <a href="#" class="image featured"><img style="min-width:300px;height:200px" class="img-thumbnail" src=' + img + ' alt=""></a>';
              html += '<div class="box">';
              html += '<p>' + title + '</p>';
              html += '<p>' + contents + '</p>';
            //   html += '<a href="#" class="button">더보기</a> </div>';
              
              html += '</section>';
          }
          
          document.getElementById("test").innerHTML = html;
    }
   
</script>
<%@ include file="../footer.jsp"%>