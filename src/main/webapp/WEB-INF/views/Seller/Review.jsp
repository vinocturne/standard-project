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
                        <li><a href="/project/Seller/cs_request">리뷰관리 수정해야됨</a></li>
                        
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
     
        <div class="content">
            <h3>리뷰 관리</h3>
            <p><input type="date">~<input type="date"><input type="submit" value="검색"></p>
            
            <br>
         
          
            <table class="table table-hover">
                <thead>
                   
                  <tr>
                    <th>번호</th>
                    <th>등록일</th>
                    <th>제목</th>
                    <th>주문번호</th>
                    <th>상품명</th> 
                    <th>작성자</th>
                    <th>배송번호</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="checkbox" name=""> 1</td>
                    <td>2020.12.15</a></td>
                    <td><a href="">주문취소 문의</a></td>
                    <td><a href="">2020121000001</a></td>
                    <th>후드</th>
                    <td>홍길동</td>
                    <td>1111</td>
                    <td>미확인</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name=""> 2</td>
                    <td>2020.12.16</td>
                    <td><a href="">사이즈 변경</a></td>
                    <td><a href="">2020121000002</a></td>
                    <th>바지</th>
                    <td>김길동</td>
                    <td>22222</td>
                    <td>처리완료</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name=""> 3</td>
                    <td>2020.12.16</td>
                    <td><a href="">상품사이즈 문의</a></td>
                    <td><a href=""></a></td>
                    <th></th>
                    <td>이길동</td>
                    <td></td>
                    <td>처리완료</tr>
                  <tr>
                    <td><input type="checkbox" name=""> 4</td>
                    <td>2020.12.17</td>
                    <td><a href="">재고문의드립니다</a></td>
                    <td><a href=""></a></td>
                    <th></th>
                    <td>박길동</td>
                    <td></td>
                    <td>처리완료</tr>
                </tbody>
              </table>
              <tb><button>선택목록삭제</button></tb>
        </div>
        </div>
        <%@ include file="../footer.jsp"%>