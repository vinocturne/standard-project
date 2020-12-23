<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>


<div class="content_wrap inner">
             <!-- side_nav -->
             <div class="side_nav">
                 <div class="side_nav_item">
                     <p class="side_nav_title">My page</p>
                     <ul>
                         <li><a href="Modify.html">Modify</a></li>
                         <li><a href="cart.html">Cart</a></li>
                         <li><a href="order.html">Order</a></li>
                         <li><a href="Wishlist.html">Wish list</a></li>
                         <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                     </ul>
                 </div>
             </div>
             

             <!-- My page -->

             <div class="mypage_wrap">
                <div class="title_area1">
                      <h1> 마이 쇼핑 </h1>
                  </div>
                  <br>
                <div class="mypage_table">
                    <table class="type14">
                        <thead>
                            <tr class="welcome">
                            <th> 
                                <img src="../img/person.png" width="150px" height="150px" alt="">    
                            </th>
                                <td> 
                                <h2>  <%=customer.getC_Id()%> 님 저희 쇼핑몰을 이용해 주셔서 감사합니다. 
                                </h2>
                                </td>    
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
           
     
            
 <%@ include file="/WEB-INF/views/footer.jsp"%>