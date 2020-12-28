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
					<li><a href="/project/Admin/magazineManager">Magazine 관리</a></li>
					<li><a href="/project/Cs/cs_request">Customer Q&A</a></li>

				</ul>
			</div>
		</div>
	</div>
	<div class="content">
	<!-- 여기 안에 list를 불러올 테이블 필요 -->
	<h3>Magazine 관리</h3>
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
			
		</div>
	<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th>매거진 번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>내용</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>이미지</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="magazine" items="${list}">
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
								<td><input type="checkbox" name=""> 1</td>
								<td name="m_Seq">${magazine.m_Seq}</td>
								<td>${magazine.m_Title}</td>
								<td>${magazine.m_Writer}</td>
								<td>${magazine.m_Content}</td>
								<td>${magazine.m_Date}</td>
								<td>${magazine.m_Hit}</td>
								<td>${user.m_Like}</td>
								<td>${user.m_Img}</td>
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
	
	목록을 불러줄 테이블 필요.
	체크박스가 있다면 삭제가 좀 더 편리할 것 같습니다.
	
	<!-- 매거진 추가 버튼 -->
	<input type="button" value="매거진 추가하기" onClick="location.href='/project/Admin/magazineWrite'">
	</div>
	
	
	
</div>
	
	
<%@ include file="../footer.jsp"%>