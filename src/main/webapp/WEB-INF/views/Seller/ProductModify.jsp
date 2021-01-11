<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<div class="content_wrap inner">
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

	<div class="register_wrap">
		<div class="title_area">
			<div class="title_area1">
				<h1>상품 수정</h1>
			</div>
		</div>
		
		<%
			ProductParentVO vo = (ProductParentVO)request.getAttribute("vo");
			String Category1 = (String)vo.getPp_Category1();
			String Category2 = (String)vo.getPp_Category2();
		%>
		
		<form action="<%=request.getContextPath() %>/Seller/ModifyParentProduct" method="POST" enctype="multipart/form-data">
		<input type="hidden" id="parent_p_Id" name="parent_p_Id" value="<%=vo.getParent_p_Id()%>">
		<input type="hidden" id="pp_thumb" name="pp_thumb" value="<%=vo.getPp_thumb()%>">
		<input type="hidden" id="pp_image" name="pp_image" value="<%=vo.getPp_image()%>">
			<div class="Register_table">
				<table class="type12">
					<thead>
						<br>
						<tr class="Name">
							<th scope="row">상품명</th>
							<td><input name="pp_Name" type="text" value="<%=vo.getPp_Name() %>"></td>
						</tr>
						<!-- <tr class="Id">
							<th scope="row">상품아이디</th>
							<td><input name="parent_p_Id" type="text"></td>
						</tr> --><!-- 상품아이디는 자동부여 -->
						<tr class="Category1">
							<th scope="row">카테고리1</th>
							<td><select id="pp_Category1" name="pp_Category1">
									<option value="<%=Category1%>"><%=Category1%></option>
									<option value="man">man</option>
									<option value="woman">woman</option>
							</select></td>
						</tr>
						
						<tr class="Category2">
							<th scope="row">카테고리2</th>
							<td><select id="pp_Category2" name="pp_Category2">
									<option value="<%=Category2%>"><%=Category2%></option>
									<option value="Top">Top</option>
									<option value="Bottom">Bottom</option>
									<option value="Dress">Dress</option>
									<option value="Shoes">Shoes</option>
									<option value="Acc">Acc</option>
							</select></td>
						</tr>
						<tr class="pd_thumb">
							<th scope="row">썸네일</th>
							<td><input type="file" name="m_Img">
							</td>
						</tr>
						<tr class="pd_image">
							<th scope="row">롱이미지</th>
							<td><input type="file" name="m_Img">
							</td>
						</tr>
						<tr class="p_Price">
							<th scope="row">가격</th>
							<td><input name="pp_Price" type="text" maxlength="14" value="<%=vo.getPp_Price() %>" ></td>
						</tr>
					</thead>
				</table>
			</div>
			<br> <br>
			<div class="ModifyParentProduct">
				<input type="submit" value="수정하기">
			</div>
		</form>
	</div>
</div>
<%@ include file="../footer.jsp"%>