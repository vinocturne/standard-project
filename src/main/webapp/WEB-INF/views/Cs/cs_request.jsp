<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>


<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->
	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">관리자페이지</p>
				<ul>
					<li><a href="/project/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href="/project/Admin/magazineManager">Magazine 관리</a></li>
					<li><a href="/project/Cs/cs_request">Customer Q&A</a></li>

				</ul>
			</div>
		</div>
	</div>


			<div class="content">
				<h3>리뷰관리</h3>
				<br>
				<div class="allCheck">
			<input type="checkbox" name="allCheck" id="allCheck" /><label
				for="allCheck">모두 선택</label>
			<script>
				$("#allCheck").click(function() {
					var chk = $("#allCheck").prop("checked");
					if (chk) {
						$(".chBox").prop("checked", true);
					} else {
						$(".chBox").prop("checked", false);
					}
				});
			</script>
			<a class="delBtn">
				<button type="button" class="selectDelete_btn">삭제하기</button>
				<script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-cs_Seq"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "deleteWaitingCs",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "cs_request";
									}
								});
							}else{
								alert("삭제할 게시글을 선택해주세요");
							}
						}
					});
				</script>
			</a>
		</div>
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>번호</th>
							<th>상품명</th>
							<th>글 내용</th>
							<th>재고현황</th>
							<th>평점</th>

						</tr>
					</thead>
					<tbody>
						<tr>
						<td name="c_Id">${user.c_Id}</td>
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
								</div> 
								
								<script>
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
						<td name="c_Id">${user.c_Id}</td>
							<td>2</td>
							<td>바지</td>
							<td>내용</td>
							<td>200</td>
							<td>별별별별별</td>

						</tr>
						<tr>
						<td name="c_Id">${user.c_Id}</td>
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