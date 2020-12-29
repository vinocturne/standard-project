<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>


<div class="content_wrap inner">
             <!-- side_nav 수정됨: -->

             
             <div class="side_nav">
                 <div class="side_nav_item">
                     <p class="side_nav_title">My page</p>
                     <ul>
                     <%
					if(customer==null){
					System.out.println("if null print..." + session.getAttribute("loginCustomer"));
				%>   
                    <li><a href="/project/Customer/login_form">Login</a></li>
                    <li><a href="/project/Customer/Register">Register</a></li>
                    <% } else { %>
                    <li><a href="/project/Customer/Modify">Modify</a></li>
                    <li><a href="/project/Customer/cart">Cart</a></li>
                    <li><a href="/project/Customer/OrderHistory">Order</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                    <%} %>
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
                                <img src="../ResourcesFile/img/person.png" width="100px" height="100px" alt="">    
                            </th>
                                <td class="textbox"> 
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