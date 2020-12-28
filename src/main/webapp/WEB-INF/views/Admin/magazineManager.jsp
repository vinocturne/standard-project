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
	목록을 불러줄 테이블 필요.
	체크박스가 있다면 삭제가 좀 더 편리할 것 같습니다.
	
	<!-- 매거진 추가 버튼 -->
	<input type="button" value="매거진 추가하기" onClick="location.href='/project/Admin/magazineWrite'">
	</div>
	
	
	
</div>
	
	
<%@ include file="../footer.jsp"%>