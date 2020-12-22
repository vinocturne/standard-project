<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.vo.OrderHistoryVO" %>
<%@ include file="../head.jsp" %> 
</head>

<!-- HEADER -->
<%@ include file="../header.jsp"%>

<!--COMTENT -->
<div class="content_wrap inner">
        <!-- side_nav -->
        <div class="side_nav">
            <div class="side_nav_item">
                <p class="side_nav_title">My page</p>
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="Register.html">Register</a></li>
                    <li><a href="/project/Customer/cart">Cart</a></li>
                    <li><a href="/project/Customer/order">Order</a></li>
                    <li><a href="Wishlist.html">Wish list</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                </ul>
            </div>
        </div>
        <!-- ORDER :주문조회-->
        <div class="order_wrap">
            <div class="title_area">
              <div class="title_area1">
                  <h1>주문 조회</h1>
              </div>
              <div class="title_area2">
                  <h2><주문 상품 정보></h2>
              </div>
              </div>
            <div class="order_table">
                <table class="type11">
                    <thead>
                        <tr>
                            <th scope="cols">주문일자</th>
                            <th scope="cols">상품정보</th>
                            <th scope="cols">가격</th>
                            <th scope="cols">수량</th>
                            <th scope="cols">주문금액</th>
                            <th scope="cols">주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        	<%--아직 가져올값을 몰라서 customer로 해놨습니다 .(수정필요) --%>
                            <%-- <td><%=customer.get.o_Date %><br><%=customer.get.o_Num %></th>
                            <td><%=customer.get.p_Id %></th>
                            <td><%=customer.get.p_Price %></th>
                            <td><%=customer.get.o_Quantity %></th> 
                            <td><%=customer.get.o_TotalPrice %><th> 
                            <td><%=customer.get.o_Delivery %></th> --%>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
	

<!-- FOOTER -->
<%@ include file="../footer.jsp"%>