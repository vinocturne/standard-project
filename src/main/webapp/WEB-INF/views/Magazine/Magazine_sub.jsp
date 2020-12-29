<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>

<script defer src="../js/main.js"></script>
</head>
<%@ include file="../header.jsp"%>
<div class="col-auto p-0">
	<div class="side_nav">
		<div class="side_nav_item">
			<p class="/project/product">Shop</p>
			<ul>
				<li><a href="#">Men`s</a></li>
				<li><a href="#">
						<!--줄띄우기 -->
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
<div id="Magazine"></div>


<script>

function likeClick(val)
{
    //like = 하트 표시를 위함 0 이면 안누른거, 1 이면 누른거
    var like = document.getElementById("like" + val).getAttribute('data-value');
    
    //likeCount = (eval : 숫자변환), 좋아요 개수
    var likeCount = eval(document.getElementById("likeCount" + val).getAttribute('data-value'));
    if(like == 0)
    {
        //하트
        var html = '<i class="fas fa-heart text-danger m-1"></i>';
        document.getElementById("like" + val).innerHTML = html;
        document.getElementById("like" + val).setAttribute('data-value', 1);

        //하트 카운트
        likeCount += 1;
        document.getElementById("likeCount" + val).innerHTML = likeCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("likeCount" + val).setAttribute('data-value', likeCount);
        
    }
    else
    {
        //하트
        var html = '<i class="far fa-heart text-danger m-1"></i>';
        document.getElementById("like" + val).innerHTML = html;
        document.getElementById("like" + val).setAttribute('data-value', 0);
        
        //하트 카운트
        likeCount -= 1;
        document.getElementById("likeCount" + val).innerHTML = likeCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("likeCount" + val).setAttribute('data-value', likeCount);
    }
}




   window.onload = function() {
        var html = '';
        var step;
        html += '<div class="row align-items-start" >';
          for (step = 1; step < 22; step++) {
            
            var title = "";
            var contents = "";
            var img = "";
            
            // 좋아요 값
            var testLikeCountValue = Math.floor( Math.random() * 100000 ) ;
            var testLikeCount = testLikeCountValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            img = "<%=request.getContextPath()%>/ResourcesFile/img/Magazin/"+ step + ".jpg";
			title = "m_Seq(PK)"  +step;
			if (step == 1)
				contents = "m_Title";
			else if (step == 2)
				contents = "m_Title";
			else if (step == 3)
				contents = "m_Title";
			else if (step == 4)
				contents = "m_Title";
			else if (step == 5)
				contents = "m_Title";
			else
				contents = "‘오늘 뭐 입지?’ 고민을 덜어줄 옷 .";


			html += '<div class="card m-1 align-items-start" style="width:210px;height:250px;">';
			html += '<a href="MagazineIn">';
			html += '<img class="card-img-top" src=' + img
					+ ' style="width:100%;height:140px" alt="Card image cap">';
			html += '</a>';
			html += '<div class="card-body p-0">';
			html += '<p class="card-text text-dark text-bold p-1">' + title
					+ '</p>';
			html += '<p class="card-text text-secondary p-1" style="font-size: small;">'
					+ contents + '</p>';
					
			html += '</div>';
			 html += '<div class="row align-items-center">';
             html += '<div id="like' + step + '" class="col-auto" data-value="0" onclick =likeClick("' + step + '")><i class="far fa-heart text-danger m-1"></i></div>';
             html += '<div id="likeCount' + step + '" class="col-auto m-0 p-0" data-value="' + testLikeCountValue +'">' + testLikeCount + '</div>';
         html += '</div>';
			html += '</div>';
			
		}

		html += '</div>';
		document.getElementById("Magazine").innerHTML = html;
	}
</script>
<%@ include file="../footer.jsp"%>