<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

</style>


</head>

<%@ include file="../header.jsp"%>

<div class="content_wrap inner">
	<!-- side_nav -->

	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">관리자페이지</p>
				<ul>
					<li><a href="/project/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href="/project/Admin/seller">Magazine 관리</a></li>
					<li><a href="/project/Cs/cs_request">Customer Q&A</a></li>

				</ul>
			</div>
		</div>
	</div>

	<div class="content">
		<h3>가입 대기 목록</h3>
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
				<button type="button" class="selectDelete_btn">회원탈퇴</button>
				<script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 탈퇴 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-c_Id"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "deleteWaitingCustomer",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("탈퇴 성공");
										location.href = "AdminMain";
									}
								});
							}else{
								alert("탈퇴할 회원을 선택해주세요");
							}
						}
					});
				</script>
			</a>
			<a class="appBtn">
				<button type="button" class="selectApprove_btn">회원가입 승인</button>
				<script>
					$(".selectApprove_btn").click(function() {
						var confirm_val = confirm("승인하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-c_Id"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "approveCustomer",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("승인 성공");
										location.href = "AdminMain";
									}
								});
							}else{
								alert("승인할 회원을 선택해주세요");
							}
						}
					});
				</script>
			</a>
		</div>
		<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th>번호</th>
					<th>고객아이디</th>
					<th>고객이름</th>
					<th>출생년도</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>연락처1</th>
					<th>연락처2</th>
					<th>사업자번호</th>
					<th>가입일</th>
					<th>메일주소</th>
					<th>role</th>
					<th>브랜드명</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="user" items="${list}">
							<tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-c_Id="${user.c_Id}" />
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
								<td name="c_Id">${user.c_Id}</td>
								<td>${user.c_Name}</td>
								<td>${user.c_Birthday}</td>
								<td>${user.zipcode}</td>
								<td>${user.c_Address1}</td>
								<td>${user.c_Address2}</td>
								<td>${user.c_Phone1}</td>
								<td>${user.c_Phone2}</td>
								<td>${user.businessNumber}</td>
								<td>${user.c_RegisterDay}</td>
								<td>${user.c_Email}</td>
								<td>${user.role}</td>
								<td>${user.brandName}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="13">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp"%>