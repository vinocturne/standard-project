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
                    <p class="side_nav_title">브랜드 관리페이지</p>
                    <ul>
                        <li><a href="/project/Seller/ProductManage">상품관리</a></li>
                        <li><a href="/project/Seller/BuyList">구매관리</a></li>
                        <li><a href="/project/Seller/Review">리뷰관리</a></li>
                        
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
								checkArr.push($(this).attr("data-r_Seq"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "deleteWaitingMagazine",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "Review";
									}
								});
							}else{
								alert("삭제할 게시물을 선택해주세요");
							}
						}
					});
				</script>
			</a>

		</div>    
          <table class="table table-hover" height="100" width="1100">
                <thead>
                  <tr>
                    <th style="width:1%; height:10%">선택</th>
                    <th style="width:1%; height:10%">상품아이디</th>
                    <th style="width:1%; height:10%">리뷰번호</th>
                    <th style="width:1%; height:10%">제목</th>
                    <th style="width:1%; height:10%">글쓴이</th>
                    <th style="width:1%; height:10%">내용</th> 
                    <th style="width:1%; height:10%">등록일</th>
                    <th style="width:1%; height:10%">별점</th>
                    <th style="width:1%; height:10%">댓글</th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="review" items="${list}">
                		 <tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-r_Seq="${review.r_Seq}"/>
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
                				<td>${review.p_Id}</td>
								<td name="r_Seq">${review.r_Seq}</td>
								<td>${review.r_Title}</td>
								<td>${review.r_Writer}</td>
								<td>${review.r_Content}</td>
								<td>${review.r_Date}</td>
								<td>${review.r_Star}</td>
								<td>${review.r_Coment}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="14">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
                 </c:choose>   
              </tbody>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp"%>