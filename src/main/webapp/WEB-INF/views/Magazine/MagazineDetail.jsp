<%@page import="org.standard.project.magazine.MagazineVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function changeHeart() {
		$.ajax({
			url: getContextPath()+"/magazine/clickLike",
			type:"POST",
			dataType:"json",
			data : {
				"m_Seq": "${m_Seq.getM_Seq()}",
				"c_Id": "${c_Id}"
			},
			success : function(jdata) {
				if(jdata.resultCode == -1) {
					alert("로그인 후 이용해주세요 :)", "error", "확인", function(){});
				}else {
					if(jdata.likeCheck == 1) {
						$("#btn_like").attr("src","${pageContext.request.contextPath}/ResourcesFile/img/like_after.png");
						$("#likeCnt").empty();
						$("#likeCnt").append(jdata.likeCnt);
					}
					else if(jdata.likeCheck == 0) {
						$("#btn_like").attr("src","${pageContext.request.contextPath}/ResourcesFile/img/like_before.png");
						$("#likeCnt").empty();
						$("#likeCnt").append(jdata.likeCnt);
					}
				}
			}
		});
	}

</script>

<style>
.explain {
	padding-top: 50px;
	padding-bottom: 50px;
}
</style>

</head>

<%@ include file="../header.jsp"%>



<div class="content_wrap inner">

	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">Magazine</p>
				<ul>
					<li><a href="<%=request.getContextPath() %>/Customer/myPage">My page</a></li>
					<li><a href="#"> <!--줄띄우기 -->
					</a></li>
					<li><a href="<%=request.getContextPath() %>/Customer/cart">Cart</a></li>
					<li><a href="<%=request.getContextPath() %>/Customer/order">Order</a></li>
					<li><a
						href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="Product" style="padding-top: 57px;">

		<%
			MagazineVO vo = (MagazineVO) request.getAttribute("m_Seq");
			int mm_Seq = vo.getM_Seq();
		%>

		<div class="image">
			<img src="${pageContext.request.contextPath}<%=vo.getM_Thumb() %>"
				style="width: 700px" class="picture">
		</div>


		<div class="productside">
			<div class="explain">
				<h1><%=vo.getM_Title()%></h1>
				<br>

				<h1><%=vo.getM_Content()%></h1>
				<br>
				
				<c:choose>
					<c:when test="${likecheck eq '0' or empty likecheck}">
						<!-- likecheck가0이면 빈하트-->
						<img src="<%=request.getContextPath()%>/ResourcesFile/img/like_before.png"
							onClick="changeHeart();" id="btn_like" align="left"
							style="cursor: pointer; width: 20px;">
					</c:when>
					<c:otherwise>
						<!-- likecheck가1이면 빨간 하트-->
						<img src="<%=request.getContextPath()%>/ResourcesFile/img/like_after.png"
							onClick="changeHeart();" id="btn_like" align="left"
							style="cursor: pointer; width: 20px;">
					</c:otherwise>
				</c:choose>
				<span id="likeCnt" style="margin-left: 5px;">${likeCnt}</span>


			</div>

		</div>

	</div>


</div>


<%@ include file="../footer.jsp"%>