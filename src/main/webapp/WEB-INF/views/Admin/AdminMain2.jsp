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

				</ul>
			</div>
		</div>
	</div>

	<div class="content">
		<br><br>
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
							var ArrLength=0;
							var checkArr = new Array();
							console.log("승인 ajax 처리 시작-1차배열 생성후")
							
							$("input[class='chBox']:checked").each(function() {
								//정보를 json포맷의 문자열 배열로 작성
								checkArr.push({c_id: $(this).attr("data-c_Id"),businessNumber : $(this).attr("data-businessNumber"),
								 brandName :$(this).attr("data-brandName")});
							});
							//배열을 제이슨 포맷의 문자열로 변환
							var json =JSON.stringify(checkArr);

							if (!(checkArr == "")) {
								console.log("checkArr이 빈값이 아님. ajax시작하겠음");
								$.ajax({
									url : "approveCustomer",
									type : "post",
									data : {
										data :json
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
					<th style="width:3%; height:10%">번호</th>
					<th style="width:7%; height:10%">고객아이디</th>
					<th style="width:7%; height:10%">고객이름</th>
					<th style="width:7%; height:10%">출생년도</th>
					<th style="width:7%; height:10%">우편번호</th>
					<th style="width:3%; height:10%">주소</th>
					<th style="width:7%; height:10%">상세주소</th>
					<th style="width:6%; height:10%">연락처1</th>
					<th style="width:6%; height:10%">연락처2</th>
					<th style="width:8%; height:10%">사업자번호</th>
					<th style="width:5%; height:10%">가입일</th>
					<th style="width:7%; height:10%">메일주소</th>
					<th style="width:4%; height:10%">role</th>
					<th style="width:5%; height:10%">브랜드명</th>
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
											data-c_Id="${user.c_Id}" 
											data-businessNumber="${user.businessNumber}"
											data-brandName="${user.brandName}"/>
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
								<td name="businessNumber">${user.businessNumber}</td>
								<td>${user.c_RegisterDay}</td>
								<td>${user.c_Email}</td>
								<td>${user.role}</td>
								<td name="brandName">${user.brandName}</td>
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