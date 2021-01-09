<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.standard.project.order.OrderHistoryVO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/star.css">
<script defer src="<%=request.getContextPath()%>/ResourcesFile/js/star.js"></script>

</head>
<body>
<%
   int o_Num = Integer.parseInt(request.getParameter("orderNum"));
   String p_Pname = request.getParameter("ppName"); 
%>

<div class="wrap">
        <h2>상품 후기작성</h2>
        <div class="content_wrap">
            <div class="mypage_wrap">
               
                <div class="mypage_table">
                    <table class="type14">
                        <thead>
                            <tr class="welcome">
                            <th> 
                                <img src="../ResourcesFile/img/review.png" width="100px" height="100px" alt="">    
                            </th>
                                <td class="textbox"> 
                                <%ArrayList<OrderHistoryVO> orderList = (ArrayList)session.getAttribute("orderList"); %>
                                <!-- 상품명, 개수, 주문 -->
                                      상품이름:<%=p_Pname%><br> 
                                     수량:<%=orderList.get(o_Num).getO_Quantity()%><br>
                                      주문일자:<%=orderList.get(o_Num).getO_Date()%>
                                </td>   
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
     
        </div>
        <form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
           <input type="hidden" id="p_Id" name="p_Id" value="<%=orderList.get(o_Num).getP_Id()%>">
            <input type="hidden" id="o_Quantity" name="o_Quantity" value="<%=orderList.get(o_Num).getO_Quantity()%>">
            <input type="hidden" id="pp_Name" name="pp_Name" value="<%=p_Pname%>">
            <input type="hidden" id="0_Num" name="0_Num" value="<%=o_Num%>">
            <input type="hidden" id="r_Title" name="r_Title" value="">
            <input type="hidden" id="o_Date" name="o_Date" value="<%=orderList.get(o_Num).getO_Date()%>">
            
            <div class="review_contents"> 
                <div class="warning_msg2" >5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea" name="r_Coment"></textarea>
          </div>
            <div class="cmd">
                <input type="button" name="save" id="save" value="등록">
            </div>
        </form>
    </div>

</body>


</html>