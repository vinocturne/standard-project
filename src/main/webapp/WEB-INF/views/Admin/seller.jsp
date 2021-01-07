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
                    <p class="side_nav_title" font_size="100px" >관리자페이지</p>
                    <ul>
                        <li><a href=" <%=request.getContextPath() %>/Admin/AdminMain">가입 대기 목록</a></li>
                        <li><a href=" <%=request.getContextPath() %>/Admin/seller">Magazine 관리</a></li>
                        <li><a href=" <%=request.getContextPath() %>/Cs/cs_request">Customer Q&A</a></li>
                        
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
							<th>상품번호</th>
							<th>상품명</th>
							<th>상품 이미지</th>
							<th>재고현황</th>
							<th>비고</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="">후드</a></td>
							<td><img src="../img/logo2.png" width=60 height="40"></td>
							<td>100</td>
							<td>후드</td>
							<td><button>삭제하기</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td>바지</td>
							<td><img src="../img/logo2.png" width=60 height="40"></td>
							<td>200</td>
							<td>후드</td>
							<td><button>삭제하기</button></td>
						</tr>
						<tr>
							<td>3</td>
							<td>티셔츠</td>
							<td><img src="../img/logo2.png" width=60 height="40"></td>
							<td>10</td>
							<td>후드</td>
							<td><button>삭제하기</button></td>
						</tr>
					</tbody>
				</table>
				<button class="add-product">상품 추가하기</button>
			</div>


<%@ include file="../footer.jsp"%>