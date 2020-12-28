<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/seller.css">
</head>

<%@ include file="../header.jsp"%>
<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->

        <div class="col-auto p-0"> 
            <div class="side_nav">
                <div class="side_nav_item">
                    <p class="side_nav_title" font_size="100px" >브랜드 관리페이지</p>
                    <ul>
                        <li><a href="/project/Seller/ProductManage">상품관리</a></li>
                        <li><a href="/project/Seller/seller">배송관리</a></li>
                        <li><a href="/project/Cs/cs_request">리뷰관리</a></li>
                        
                    </ul>
                </div>
            </div>
        </div>
			
			<div class="content" >
				<h3>상품관리</h3>
				<br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>상품명</th>
							<th>상품아이디</th>
							<th>카테고리1</th>
							<th>카테고리2</th>
							<th>썸네일</th>
							<th>롱이미지</th>
							<th>브랜드</th>
							<th>가격</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="">후드 짱 따듯스</a></td>
							<td>00010001</td>
							<td>카테고리1</td>
							<td>카테고리2</td>
							<td>썸네일</td>
							<td>롱이미지</td>
							<td>NIKE</td>
							<td>가격</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td><a href="">맨투맨 간지스</a></td>
							<td>00010002</td>
							<td>카테고리1</td>
							<td>카테고리2</td>
							<td>썸네일</td>
							<td>롱이미지</td>
							<td>NIKE</td>
							<td>가격</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td><a href="">점퍼 포근쓰</a></td>
							<td>00020001</td>
							<td>카테고리1</td>
							<td>카테고리2</td>
							<td>썸네일</td>
							<td>롱이미지</td>
							<td>PUMA</td>
							<td>가격</td>
							<td><button>삭제</button></td>
						</tr>
					</tbody>
				</table>
				<button class="add-product">상품 추가하기</button>
			</div>
</div>

<%@ include file="../footer.jsp"%>