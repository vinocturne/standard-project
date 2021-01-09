<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#Mag_thumbnail {
		width: 150px;
	}
	   body{
       margin-left: 100px;
       margin-right: 7%;
   }
	
    .table{
        width: 1200px;
    }
    
    .table td{
    	text-align:center;
    	vertical-align: middle;
    }
	
</style>
</head>
<%@ include file="../header.jsp"%>
<div class="content_wrap">
	<!-- side_nav -->
	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title" font_size="100px">관리자페이지</p>
				<ul>
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href=" <%=request.getContextPath() %>/Admin/magazineManager">Magazine 관리</a></li>
					<%-- <li><a href=" <%=request.getContextPath() %>/Cs/cs_request">CS Review</a></li> --%>
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminGraph">서비스 현황</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="content">
	<!-- 여기 안에 list를 불러올 테이블 필요 -->
	<br><br>
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
						var confirm_val = confirm("정말 삭제 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-m_Seq"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "deleteMagazine",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "magazineManager";
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
	<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th style="width:5%; height:10%">선택</th>
					<th style="width:5%; height:10%">번호</th>
					<th style="width:20%; height:10%">썸네일</th>
					<th style="width:25%; height:10%">제목</th>
					<th style="width:15%; height:10%">내용</th>
					<th style="width:11%; height:10%">등록일</th>
					<th style="width:7%; height:10%">조회수</th>
					<th style="width:7%; height:10%">좋아요</th>
					<th style="width:5%; height:10%">수정</th>
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
											data-m_Seq="${magazine.m_Seq}" />
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
								<td name="m_Seq">${magazine.m_Seq}</td>
								<!-- 서버에 프로젝트를 올릴때에는 
									<img src ="${pageContext.request.contextPath }${magazine.m_Thumb}" id="Mag_thumbnail"> 사용해야함. -->
								<td><img src ="${pageContext.request.contextPath}${magazine.m_Thumb}" id="Mag_thumbnail"></td>
								<td>${magazine.m_Title}</td>
								<td>${magazine.m_Content}</td>
								<td>${magazine.m_Date}</td>
								<td>${magazine.m_Hit}</td>
								<td>${magazine.m_Like}</td>
	<%-- 기존에 있던거 아이콘 바꾸면서 아래 코드로 바꿈
				<td><button onclick="window.location.href='magazineModify?seq=${magazine.m_Seq}'">
				<img src="<%=request.getContextPath()%>/ResourcesFile/img/magazinemodify.PNG" alt="cart" width="25" height="25">
				</button></td> --%>

<td>
<a onclick="window.location.href='magazineModify?seq=${magazine.m_Seq}'">
<img src="<%=request.getContextPath()%>/ResourcesFile/img/magazinemodify.PNG" alt="cart" width="25" height="25">

</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	<br>
	
	<!-- 매거진 추가 버튼 -->
	<button type="button" class="magazineAdd_btn" onClick="location.href=' <%=request.getContextPath() %>/Admin/magazineWrite'"
	style="margin-bottom:20px;">매거진 추가하기</button>
	<%-- <input type="button" value="매거진 추가하기" onClick="location.href=' <%=request.getContextPath() %>/Admin/magazineWrite'"
	style="margin-bottom:20px;"> --%>
	
	</div>
	
	
</div>
	
	
<%@ include file="../footer.jsp"%>