<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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


<!-- CONTENT -->
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
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminGraph">서비스 현황</a></li>

				</ul>
			</div>
		</div>
	</div>


		<div class="content">
			<br><br>
			<h3>리뷰 관리</h3>
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
							<th style="width:15%; height:10%">선택</th>
							<th style="width:15%; height:10%">번호</th>
							<th style="width:15%; height:10%">상품명</th>
							<th style="width:15%; height:10%">글 내용</th>
							<th style="width:15%; height:10%">재고현황</th>
							<th style="width:15%; height:10%">평점</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(reviewList)>0}">
								<c:forEach var="review" items="${reviewList}">
								<tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-cs_Seq="${review.cs_Seq}" />
										<script>
											$(".chBox").click(
													function() {
														$("#allCheck").prop(
																"checked",
																false);
													});
										</script>
									</div>
								</td>
								<td name="cs_Seq">${review.cs_Seq}</td>
								<td>${review.cs_Title}</td>
								<td>${review.cs_Writer}</td>
								<td>${review.cs_Content}</td>
								<td>${review.cs_Date}</td>
								<td>${review.cs_viewCnt}</td>
								<td>${review.cs_Coment}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
					</c:choose>
			</tbody>
		</table>
	</div>
</div>
								<!-- <div class="starRev">
									<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
									<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
									<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
									<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
									<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
								</div> 
								 별 만들기 내용~! 
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
								</script> -->

		<%@ include file="../footer.jsp"%>