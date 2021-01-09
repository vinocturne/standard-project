<%@page import="org.standard.project.order.OrderHistoryService"%>
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
${ok}
<script type="text/javascript">
var str = '${ok}';
console.log(str);
if (str==="ok"){
	console.log(str);
	self.close();
	}else {
		console.log(str);
	}
</script>

<%
   OrderHistoryService orderHistoryService;
   int o_Num = Integer.parseInt(request.getParameter("orderNum"));
   String p_Pname = request.getParameter("ppName"); 
   String p_Id = "";
   int o_Quantity = 0;

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
                                <%ArrayList<OrderHistoryVO> orderList = (ArrayList)session.getAttribute("orderList"); 
                                for(int i=0; i<orderList.size(); i++) {
                                	if(orderList.get(i).getO_Num() == o_Num) {
                                %>                                
                                      	상품이름:<%=p_Pname%><br> 
                                     	수량:<%=orderList.get(i).getO_Quantity()%><br>
                                     	 주문일자:<%=orderList.get(i).getO_Date()%>
                                     	 <%
                                     	 p_Id = orderList.get(i).getP_Id();
                                     	 o_Quantity = orderList.get(i).getO_Quantity();
                                     	/*  o_Date = (String)orderList.get(i).getO_Date(); */
                                     	 
                                	}
                                }
                                 %>
                                </td>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
     
        </div>
        <form name="reviewform" class="reviewform" method="post" action="save">
            <%-- <input type="hidden" name="rate" id="rate" value="0"/>
     		<input type="hidden" id="p_Id" name="p_Id" value="<%=orderList.get(o_Num).getP_Id()%>">
            <input type="hidden" id="o_Quantity" name="o_Quantity" value="<%=orderList.get(o_Num).getO_Quantity()%>">
            <input type="hidden" id="pp_Name" name="pp_Name" value="<%=p_Pname%>">
            <input type="hidden" id="0_Num" name="0_Num" value="<%=o_Num%>">
            <input type="hidden" id="r_Title" name="r_Title" value="">
            <input type="hidden" id="o_Date" name="o_Date" value="<%=orderList.get(o_Num).getO_Date()%>"> --%>
     		<input type="hidden" id="p_Id" name="p_Id" value="<%=p_Id%>">
            <input type="hidden" id="o_Quantity" name="o_Quantity" value="<%=o_Quantity%>">
            <input type="hidden" id="pp_Name" name="pp_Name" value="<%=p_Pname%>">
            <input type="hidden" id="0_Num" name="0_Num" value="<%=o_Num%>">
            <input type="hidden" id="r_Title" name="r_Title" value="">
            <%-- <input type="hidden" id="o_Date" name="o_Date" value="<%=orderList.get(o_Num).getO_Date()%>"> --%>
            <!-- <div class="review_rating">
            	<div>
            		<p style="text-align:center">별점과 리뷰를 남겨주세요</p>
            	</div>
                <div class="warning_msg1">별점을 선택해 주세요.</div>
                
                <div class="rating">
                    <div class="ratefill"></div>
                    [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가
                    <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    <label for="rating1"></label>
                    <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                    <label for="rating2"></label>
                    <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    <label for="rating3"></label>
                    <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    <label for="rating4"></label>
                    <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    <label for="rating5"></label>
                </div>
            </div>  -->
            <div class="review_contents"> 
                <div class="warning_msg2" >5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea" name="r_Coment"></textarea>
          </div>
            <div class="cmd">
                <input type="submit" name="save" id="save" value="등록">
            </div>
        </form>
    </div>

</body>

</html>