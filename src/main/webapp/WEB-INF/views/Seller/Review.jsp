<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

     .table{
        width: 1200px;
    }
</style>

</head>

<%@ include file="../header.jsp"%>
<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->

        <div class="col-auto p-0"> 
            <div class="side_nav">
                <div class="side_nav_item">
                    <p class="side_nav_title">브랜드 관리페이지</p>
                    <ul>
                        <li><a href="/project/Seller/ProductManage">상품관리</a></li>
                        <li><a href="/project/Seller/Delivery">구매관리</a></li>
                        <li><a href="/project/Seller/Review">리뷰관리</a></li>
                        
                    </ul>
                </div>
            </div>
        </div>
     
        <div class="content">
            <h3>리뷰 관리</h3>
            
            <p><input type="date">~<input type="date"><input type="submit" value="검색"></p>
            
            <br>
         
          
            <table class="table table-hover">
                <thead>
                   
                  <tr>
                    <th style="width:1%; height:10%">상품아이디</th>
                    <th style="width:1%; height:10%">리뷰번호</th>
                    <th style="width:1%; height:10%">제목</th>
                    <th style="width:1%; height:10%">글쓴이</th>
                    <th style="width:1%; height:10%">내용</th> 
                    <th style="width:1%; height:10%">등록일</th>
                    <th style="width:1%; height:10%">별점</th>
                    <th style="width:1%; height:10%">댓글</th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="review" items="${list}">
                		 <tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-r_Seq="${review.r_Seq}"/>
										<script>
											$(".chBox").click(
													function() {
														$("#allCheck").prop(
																"checked",
																false);
													});
										</script>
									</div>
								</td>
                				<td>${review.p_Id}</td>
								<td name="r_Seq">${review.r_Seq}</td>
								<td>${review.r_Title}</td>
								<td>${review.r_Writer}</td>
								<td>${review.r_Content}</td>
								<td>${review.r_Date}</td>
								<td>${review.r_Star}</td>
								<td>${review.r_Coment}</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="14">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
                 </c:choose>   

                  </tbody>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp"%>