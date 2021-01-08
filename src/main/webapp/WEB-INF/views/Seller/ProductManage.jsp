<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	#product_thumbnail {
		width: 150px;
	}
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
					<li><a href="<%=request.getContextPath() %>/Seller/ProductManage">상품관리</a></li>
                        <li><a href="<%=request.getContextPath() %>/Seller/BuyList">구매관리</a></li>
                        <li><a href="<%=request.getContextPath() %>/Seller/Review">리뷰관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<% session.getAttribute("loginCustomer"); %>
	<div class="content">
		<br><br>
		<h3>상품관리</h3>
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
								checkArr.push($(this).attr("data-parent_p_Id"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "DeleteParentProduct",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "ProductManage";
									}
								});
							}else{
								alert("삭제할 상품을 선택해주세요");
							}
						}
					});
				</script>
			</a>
			
		</div>
		<table class="table table-hover" height="100" width="1100" style="text-align:center;">
			<thead>
				<tr>
					<th style="width:5%; height:10%">번호</th>
					<th style="width:5%; height:10%">상품명</th>
					<th style="width:5%; height:10%">상품아이디</th>
					<th style="width:5%; height:10%">카테고리1</th>
					<th style="width:5%; height:10%">카테고리2</th>
					<th style="width:5%; height:10%">썸네일</th>
					<th style="width:5%; height:10%">브랜드</th>
					<th style="width:5%; height:10%">가격</th>
					<th style="width:7%; height:10%">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="product" items="${list}">
							<tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-parent_p_Id="${product.parent_p_Id}" />
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
								<td><a href="project/Seller/ProductAddChild" name="pp_Name">${product.pp_Name}</a></td>
								<td>${product.parent_p_Id}</td>
								<td>${product.pp_Category1}</td>
								<td>${product.pp_Category2}</td>
								<td><img src ="${pageContext.request.contextPath }${product.pp_thumb}" id="product_thumbnail"></td>
								<td><%=customer.getBrandName()%></td>
								<td>${product.pp_Price}</td>
								<td>
								<button onclick="window.location.href='ModifyParentProduct?seq=${product.parent_p_Id}'">수정</button>
								<button onclick="window.location.href='ProductAddChild?seq=${product.parent_p_Id}'">옵션</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="9">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<a href="<%=request.getContextPath() %>/Seller/ProductAddParent"><button
				class="add-product">상품 추가하기</button></a>
				<!-- <script>
				var IMP = window.IMP; // 생략가능
				IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				</script>
				<script>
				$(".add-product").click(function() {/* 결제 버튼  */
				IMP.request_pay({
				    pg : 'inicis', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명: 나이키 strl',
				    amount : 110,
				    buyer_email : 'test@standard.com',
				    buyer_name : 'test1',
				    buyer_tel : '010-1234-5678',
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456',
				    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        location.href = "ProductAddParent" /* 요쪽이 결제 후에 갈곳  */
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
				});
				</script> -->
	</div>
</div>

<%@ include file="../footer.jsp"%>