<%@page import="org.standard.project.magazine.MagazineVO"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.btn btn-primary{
}
	#selectImg_pre {
		width: 300px;
	}
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
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href=" <%=request.getContextPath() %>/Admin/magazineManager">Magazine 관리</a></li>
					<li><a href=" <%=request.getContextPath() %>/Cs/cs_request">CS Review</a></li>
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminGraph">서비스 현황</a></li>

				</ul>
			</div>
		</div>
	</div>
	
	<div class="content">
	<h3>Magazine 수정</h3>
	<br>
		<%
			MagazineVO vo = (MagazineVO)request.getAttribute("vo");
		%>
		<!-- POST방식으로 넘어감. -->
			<form action=" <%=request.getContextPath() %>/Admin/magazineModify" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="m_Seq" name="m_Seq" value="<%=vo.getM_Seq() %>">
			<input type="hidden" id="m_Hit" name="m_Hit" value="<%=vo.getM_Hit() %>">
			<input type="hidden" id="m_Like" name="m_Like" value="<%=vo.getM_Like() %>">
			<input type="hidden" id="m_Date" name="m_Date" value="<%=vo.getM_Date() %>">
			<input type="hidden" id="m_Img" name="m_Img" value="<%=vo.getM_Img() %>">
			<input type="hidden" id="m_Thumb" name="m_Thumb" value="<%=vo.getM_Thumb() %>">
			<label for="magazineTitle">매거진 제목</label> <input type="text" name="m_Title" value="<%=vo.getM_Title()%>"/><br>
			<br>
			<label for="magazineContent">매거진 내용</label>
			<textarea rows="5" cols="50" name="m_Content"><%=vo.getM_Content()%></textarea>
			<br>
			<input type="file" id="modifyImage" name="modifyImage"/>
			<div class="selectImg_pre"><img src="${pageContext.request.contextPath }<%=vo.getM_Img()%>" id="selectImg_pre"/></div>
			<script>
				$("#modifyImage").change(function() {
					if(this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".selectImg_pre img").attr("src", data.target.result).width(500);
						}
					reader.readAsDataURL(this.files[0]);
					}
				});
			</script>

			<button type="submit" class="btn btn-primary">수정하기</button>

		</form>
	</div>

</div>


<%@ include file="../footer.jsp"%>