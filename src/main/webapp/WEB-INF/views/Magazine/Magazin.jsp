<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 

<script defer src="../js/main.js"></script>
</head>
<%@ include file="../header.jsp" %> 
<script>
   window.onload = function() {
        var html = '';
        var step;
        html += '<div class="row align-items-start" >';
          for (step = 1; step < 21; step++) {
            
            var title = "";
            var contents = "";
            var img = "";

            img = "/ResourcesFile/img/Magazin/" + step + ".jpg";
            title = "매거진" + step;

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
            
            html += '<a href="magazinIn.html">';
                html += '<div class="card m-1 align-items-start" style="width:210px;height:250px;">';
                    html += '<img class="card-img-top" src=' + img + ' style="width:100%;height:140px" alt="Card image cap">';        
                    html += '<div class="card-body p-0">';
                        html += '<p class="card-text text-dark text-bold p-1">' + title + '</p>';
                        html += '<p class="card-text text-secondary p-1" style="font-size: small;">' + contents + '</p>';
                    html += '</div>';
                html += '</div>';
            html += '</a>';
          }

          html += '</div>';
          document.getElementById("Magazin").innerHTML = html;
    }
</script>
<%@ include file="../footer.jsp"%>