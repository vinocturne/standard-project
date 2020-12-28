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
		<!-- POST방식으로 넘어감. -->
		<form action="/project/Admin/magazineWrite" method="POST">
			<label for="magazineTitle">매거진 제목</label> <input type="text" name="m_Title" /><br>
			<label for="magazineContent">매거진 내용</label>
			<textarea rows="5" cols="50" name="m_Content"></textarea>

			<button type="submit" class="btn btn-primary">등록</button>

		</form>
	</div>




</div>


<%@ include file="../footer.jsp"%>