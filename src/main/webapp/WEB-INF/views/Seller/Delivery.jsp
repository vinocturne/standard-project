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
                        <li><a href="/project/Seller/cs_request">리뷰관리</a></li>
                        
                    </ul>
                </div>
            </div>
        </div>
               <div class="container">
        <div class="nav">
            <ul class="nav-list">
                <li>관리자페이지</li>
                <br>
                <li clas="nav-item"><a href ="" class="nav-link">상품 관리</a></li>
                <li clas="nav-item"><a href ="" class="nav-link">배송 관리</a></li>
                <li clas="na`v-item"><a href ="" class="nav-link">리뷰 관리</a></li>
            </ul>
        </div>
        <div class="content">
            <h3>배송관리</h3>
            <p><input type="date">~<input type="date"><input type="submit" value="검색"></p>
            
            <br>
            <table class="table table-warning">
                <td><a href="">배송대기 처리</a></td>
                <td><a href="">배송중 처리</a></td>
                <td><a href="">상품준비중 처리</a></td>
                <td><a href="">배송번호 받기</a></td>
                <td><a href="">배송취소 처리</a></td>
                <td><a href="">선택목록삭제</a></td>
            </table>
          
            <table class="table table-hover">
                <thead>
                   
                  <tr>
                    <th>번호</th>
                    <th>주문일</th>
                    <th>주문번호</th> 
                    <th>주문자</th>
                    <th>배송번호</th>
                    <th>택배업체</th>
                    <th>상태</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="checkbox" name=""> 1</td>
                    <td>2020.12.15</a></td>
                    <td><a href="">2020121000001</a></td>
                    <td>홍길동</td>
                    <td>1111</td>
                    <td>
                        <select name="subject" id="subject">
                        <option value="cj대한통운">cj대한통운</option>
                        <option value="한진">한진</option>
                        <option value="우체국택배">우체국택배</option>
                        <option value="로젠택배">로젠택배</option>
                        <option value="롯데로지스">롯데로지스</option>
                        </select>
                        
                    </td>
                    <td>배송대기</td>
                        
                        
                  </tr>
                  <tr>
                    <td><input type="checkbox" name=""> 2</td>
                    <td>2020.12.16</td>
                    <td><a href="">2020121000002</a></td>
                    <td>김길동</td>
                    <td>22222</td>
                    <td>
                        <select name="subject" id="subject">
                        <option value="cj대한통운">cj대한통운</option>
                        <option value="한진">한진</option>
                        <option value="우체국택배">우체국택배</option>
                        <option value="로젠택배">로젠택배</option>
                        <option value="롯데로지스">롯데로지스</option>
                        </select>
                    </td>
                    <td>배송대기</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name=""> 3</td>
                    <td>2020.12.16</td>
                    <td><a href="">2020121000003</a></td>
                    <td>이길동</td>
                    <td>3333</td>
                    <td><select name="subject" id="subject">
                        <option value="cj대한통운">cj대한통운</option>
                        <option value="한진">한진</option>
                        <option value="우체국택배">우체국택배</option>
                        <option value="로젠택배">로젠택배</option>
                        <option value="롯데로지스">롯데로지스</option>
                        </select></td>
                        <td>배송처리</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name=""> 4</td>
                    <td>2020.12.17</td>
                    <td><a href="">2020121000004</a></td>
                    <td>박길동</td>
                    <td>44444</td>
                    <td><select name="subject" id="subject">
                        <option value="cj대한통운">cj대한통운</option>
                        <option value="한진">한진</option>
                        <option value="우체국택배">우체국택배</option>
                        <option value="로젠택배">로젠택배</option>
                        <option value="롯데로지스">롯데로지스</option>
                        </select></td>
                        <td>상품준비중</td>
                  </tr>
                </tbody>
              </table>
              
        </div>
        </div>
        <%@ include file="../footer.jsp"%>