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
							<th>브랜드</th>
							<th>컬러</th>
							<th>사이즈</th>
							<th>재고</th>
							<th>단가</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="">후드</a></td>
							<td>상품아이디</td>
							<td>카테고리1</td>
							<td>카테고리2</td>
							<td>브랜드</td>
							<td>컬러</td>
							<td>사이즈</td>
							<td>재고</td>
							<td>단가</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td><a href="">후드</a></td>
							<td>상품아이디</td>
							<td>카테고리1</td>
							<td>카테고리2</td>
							<td>브랜드</td>
							<td>컬러</td>
							<td>사이즈</td>
							<td>재고</td>
							<td>단가</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td><a href="">후드</a></td>
							<td>상품아이디</td>
							<td>카테고리1</td>
							<td>카테고리2</td>
							<td>브랜드</td>
							<td>컬러</td>
							<td>사이즈</td>
							<td>재고</td>
							<td>단가</td>
							<td><button>삭제</button></td>
						</tr>
					</tbody>
				</table>
				<button class="add-product">상품 추가하기</button>
			</div>
</div>

<%@ include file="../footer.jsp"%>