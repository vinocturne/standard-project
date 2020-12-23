<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
</head>
<%@ include file="/WEB-INF/views/header.jsp"%>

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
                                <img src="../img/person.png" width="150px" height="150px" alt="person_icon">    
                            </th>
                                <td> 
                                 <h2>  <%=customer.getC_Id()%> 님 저희 쇼핑몰을 이용해 주셔서 감사합니다. 
                                </h2>
                                </td>    
                           </tr>
                        </thead>
                    </table>
                </div>
                
 <%@ include file="/WEB-INF/views/footer.jsp"%>