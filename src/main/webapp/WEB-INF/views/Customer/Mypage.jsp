<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- CONTENT -->
	<div class="content_wrap inner">
             <!-- side_nav 수정됨: -->
	<%@ include file="../side_nav.jsp"%>
             <!-- My page -->

             <div class="mypage_wrap">
                <div class="title_area1">
                      <h1> 마이 페이지 </h1>
                  </div>
                  <br>
                <div class="mypage_table">
                    <table class="type14">
                        <thead>
                            <tr class="welcome">
                            <th> 
                                <img src="../ResourcesFile/img/person.png" class="mypageimg"width="100px" height="100px">    
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