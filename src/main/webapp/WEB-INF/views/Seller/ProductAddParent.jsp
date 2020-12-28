<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/seller.css">
</head>

<%@ include file="../header.jsp"%>
<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->

        <div class="col-auto p-0"> 
            <div class="side_nav">
                <div class="side_nav_item">
                    <p class="side_nav_title" font_size="100px" >브랜드 관리페이지</p>
                    <ul>
                        <li><a href="/project/Seller/ProductManage">상품관리</a></li>
                        <li><a href="/project/Seller/Delivery">배송관리</a></li>
                        <li><a href="/project/Seller/Review">리뷰관리</a></li>
                        
                    </ul>
                </div>
            </div>
        </div>
			
			 <div class="register_wrap">
        <fieldset>
            <form action="/project/Seller/ProductAddParent" method="POST">
                <div class="title_area">
                    <div class="title_area1">
                        <h1>신규 상품 카테고리 등록</h1>
                    </div>
                </div>
                <div class="Register_table">
                        <table class="type12">
                            <thead>
                            <br>
                                <tr class="p_Name">
                                    <th scope="row"> 상품명
                                    </th>
                                    <td><input id="p_Name" name="p_Name" type="text" class="inputTypeText"></td>
                                </tr>
                                <tr class="p_Id">
                                    <th scope="row"> 상품아이디 </th>
                                    <td><input id="p_Id" name="p_Id" type="text" class="inputTypeText"></td>
                                </tr>
                                <tr class="p_Category1">
                                    <th scope="row"> 카테고리1 </th>
                                    <td><input id="p_Category1" name="p_Category1" type="text" maxlength="14"></span>
                                    </td>
                                </tr>
                                <tr class="p_Category2">
                                    <th scope="row"> 카테고리2 </th>
                                    <td><input id="p_Category2" name="p_Category2" type="text" maxlength="14"></span>
                                    </td>
                                </tr>
                                <tr class="pd_thumb">
                                    <th scope="row"> 썸네일 </th>
                                    <td><input id="pd_thumb" name="pd_thumb" type="text" maxlength="14"></span>
                                    </td>
                                </tr>
                                <tr class="pd_image ">
                                    <th scope="row"> 롱이미지 </th>
                                    <td><input id="pd_image" name="pd_image" type="text" maxlength="14"></span>
                                    </td>
                                </tr>
                                <tr class="p_Brand">
                                    <th scope="row"> 브랜드 </th>
                                    <td><input id="p_Brand" name="p_Brand" type="text" maxlength="14"></span>
                                    </td>
                                </tr>
                                <tr class="p_Price">
                                    <th scope="row"> 가격 </th>
                                    <td><input id="p_Price" name="p_Price" type="text" maxlength="14"></span>
                                    </td>
                                </tr>

                             </thead>
                        </table>
                </div>
            <!--</form>  -->
        </fieldset>
                <br>
                <br>
                <div class="ProductAddParent">
                    <br><input type="submit" value="등록하기">
                </div>
    </div>
</div>
</form>
<%@ include file="../footer.jsp"%>