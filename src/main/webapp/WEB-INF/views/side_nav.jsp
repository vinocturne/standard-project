<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>


/* SIDE BAR*/

.side_nav ul li a{
  color: black;
  text-decoration: none;
  display: inline-block;
  position: relative;
}
.side_nav ul li a:after {    
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 1px;
  left: 50%;
  position: absolute;
  background: black;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
.side_nav ul li a:hover:after { 
  width: 100%; 
  left: 0; 
}

</style>
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
                    <li><a href="/project/Customer/cartList">Cart</a></li>
                    <li><a href="/project/OrderHistory/OrderHistory">Order</a></li>
                    <li><a href="/project/Customer/ReviewModify">My Review</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                    <%} %>
                    </ul>
 					</div>
             </div>