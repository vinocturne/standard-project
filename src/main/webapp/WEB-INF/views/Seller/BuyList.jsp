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
				<p class="side_nav_title" font_size="100px">브랜드 관리페이지</p>
				<ul>
					<li><a href="<%=request.getContextPath() %>/Seller/ProductManage">상품관리</a></li>
					<li><a href="<%=request.getContextPath() %>/Seller/BuyList">구매관리</a></li>
					<li><a href="<%=request.getContextPath() %>/Seller/Review">리뷰관리</a></li>

				</ul>
			</div>
		</div>
	</div>

	<div class="content">
		<br><br>
		<h3>구매관리</h3>
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
				<button type="button" class="selectDelete_btn">삭제하기</button> <script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-o_Num"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "DeleteDelivery",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "BuyList";
									}
								});
							} else {
								alert("삭제할 상품을 선택해주세요");
							}
						}
					});
				</script>
			</a>

		</div>
		<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th style="width:2%; height:10%">선택</th>
					<th style="width:4%; height:10%">고객아이디</th>
					<th style="width:4%; height:10%">상품아이디</th>
					<th style="width:3%; height:10%">주문번호</th>
					<th style="width:5%; height:10%">주문일자</th>
					<th style="width:5%; height:10%">단가</th>
					<th style="width:5%; height:10%">수량</th>
					<th style="width:5%; height:10%">주문금액</th>
					<th style="width:5%; height:10%">배송상태</th>
					<th style="width:5%; height:10%">배송상태적용</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="orderHistory" items="${list}">
							<tr>
							<form action="<%=request.getContextPath() %>/Seller/BuyList" method="POST" enctype="multipart/form-data">
							<input type="hidden" id="o_Num" name="o_Num" value="${orderHistory.o_Num}">
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-o_Num="${orderHistory.o_Num}" />
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
								<td>${orderHistory.c_Id}</td>
								<td>${orderHistory.p_Id}</td>
								<td>${orderHistory.o_Num}</td>
								<td>${orderHistory.o_Date}</td>
								<td>${orderHistory.p_Price}</td>
								<td>${orderHistory.o_Quantity}</td>
								<td>${orderHistory.o_TotalPrice}</td>
								<td>
								<select id="o_Delivery" name="o_Delivery">
									<option value="${orderHistory.o_Delivery}">${orderHistory.o_Delivery}</option>
									<option value="결제완료">결제완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송시작">배송시작</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
								</select>
								</td>
								<td><input type="submit" value="적용하기"></td>
								</form>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
		<br>
	</div>


</div>


<%@ include file="../footer.jsp"%>