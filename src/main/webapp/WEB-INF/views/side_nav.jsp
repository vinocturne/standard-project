<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- SIDE NAV  -->
    
			 <div class="side_nav">
                 <div class="side_nav_item">
                     <p class="side_nav_title"><a href="/project/Customer/myPage">My page</a></p>
                     <ul>
				<%
					if(customer==null){
					System.out.println( session.getAttribute("loginCustomer"));
				%>   
                    <li><a href="/project/Customer/login_form">Login</a></li>
                    <li><a href="/project/Customer/Register">Register</a></li>
                    <% } else { %>
                    <li><a href="/project/Customer/Modify">Modify</a></li>
                    <li><a href="/project/Customer/cart">Cart</a></li>
                    <li><a href="/project/Customer/OrderHistory">Order</a></li>
                    <li><a href="/project/Customer/ReviewModify">My Review</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                    <%} %>
                    </ul>
 					</div>
             </div>