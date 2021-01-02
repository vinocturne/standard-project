<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.ProductController" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/star.css">
<script defer src="<%=request.getContextPath()%>/ResourcesFile/js/star.js"></script>

</head>
<body>
 
<div class="wrap">
        <h2>상품 후기작성</h2>
        <div class="content_wrap">
            <div class="mypage_wrap">
               
                <div class="mypage_table">
                    <table class="type14">
                        <thead>
                            <tr class="welcome">
                            <th> 
                                <img src="../ResourcesFile/img/people.png" width="100px" height="100px" alt="">    
                            </th>
                                <td class="textbox"> 
                                  
                                   <%-- <%=ProductController.getp_Name()--%>
                                   <%-- <%=ProductController.getp_Brand()--%>
                                   <%-- <%=ProductController.getp_Size()--%>
                                   <%-- <%=ProductController.getp_Price()--%>
                                   
                                </td>    
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
     
        </div>
        <form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
     
            <div class="review_rating">
            	<div>
            		<p style="text-align:center">별점과 리뷰를 남겨주세요</p>
            	</div>
                <div class="warning_msg1">별점을 선택해 주세요.</div>
                
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
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
            </div> 
            
            <div class="review_contents"> 
                <div class="warning_msg2">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea"></textarea>
          </div>
            <div class="cmd">
                <input type="button" name="save" id="save" value="등록">
            </div>
        </form>
    </div>

</body>


</html>