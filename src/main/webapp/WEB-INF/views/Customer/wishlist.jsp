<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
</head>
<%@ include file="../header.jsp" %> 
    <!-- CONTENT -->
    <div class="content_wrap inner">
        <!-- side_nav -->
        <div class="side_nav">
            <div class="side_nav_item">
                <p class="side_nav_title">My page</p>
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="Register.html">Register</a></li>
                    <li><a href="<%=request.getContextPath() %>/Customer/cart">Cart</a></li>
                    <li><a href="<%=request.getContextPath() %>/Customer/order">Order</a></li>
                    <li><a href="Wishlist.html">Wish list</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                </ul>
            </div>
        </div>         

             <!-- WishList -->

             <div class="wishList_wrap">
                <div class="title_area1">
                      <h1>관심상품</h1>
                      <br>
                  </div>
                <div class="WishList_table">
                    <table class="type13">
                            <thead>
                            <tr>
                                <th><input type="checkbox" onclick=""></th>
                                <th>이미지</th>
                                <th>상품정보</th>
                                <th>판매가</th>
                                <th>배송구분</th>
                                <th>배송비</th>
                                <th>합계</th>
                                <th>선택</th>
                            </tr>
                            </thead> 
                            <tbody class="wishbody">
                                <tr class="wishbody_tr">
                                <td><input name="" id="" enable-order="" reserve-order="" enable-purchase="1" class="" is-set-product="" value="" type="checkbox"></td>
                                <td class="Thumbnail"><a href=""><img src="../img/thumbnail.png" width="80" alt="썸네일"></a></td>
                                <td class="left"><strong><a href="" class="ec-product-name">트위드 플레어 스커트 p_Id</a></strong>
                                </td>
                                <td class="price"><b>p_Price</b></td>
                                <td><div class="txtInfo">개별배송<div class="displaynone">(해외배송가능)</div>
                                </div></td>
                                <td><span class="">2,500원<br></span> 고정</td>
                                <td class="price">81,500원</td>
                                <td class="button">
                                <input type="button" name="btn1" value="주문하기">
                                <input type="button" name="btn2" value="장바구니 담기">
                                <input type="button" name="btn3" value="삭제">    
                                </td>
                                 <td><input name="" id="" enable-order="" reserve-order="" enable-purchase="1" class="" is-set-product="" value="" type="checkbox"></td>
                                <td class="Thumbnail"><a href=""><img src="../img/thumbnail.png" width="80" alt="썸네일"></a></td>
                                <td class="left"><strong><a href="" class="ec-product-name">트위드 플레어 스커트 p_Id</a></strong>
                                </td>
                                <td class="price"><b>p_Price</b></td>
                                <td><div class="txtInfo">개별배송<div class="displaynone">(해외배송가능)</div>
                                </div></td>
                                <td><span class="">2,500원<br></span> 고정</td>
                                <td class="price">81,500원</td>
                                <td class="button">
                                <input type="button" name="btn1" value="주문하기">
                                <input type="button" name="btn2" value="장바구니 담기">
                                <input type="button" name="btn3" value="삭제">    
                                </td>
                              </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- <div class="delete_cart"><span class="gLeft">
                        <div onclick="" class="btsize1 btn4"><input type="button" name="delete" value="삭제하기"></div>
                        <div onclick="" class="btsize1 btn5"><input type="button" name="cart" value="장바구니 담기"></div>
                    </span>
                <span class="gRight">
                    <div onclick="" class=""><input type="button" name="delete" value="전체상품 주문"></div>
                    <div onclick="" class=""><input type="button" name="delete" value="관심상품 비우기"></div>
                    </span>
                </div> -->

                <div class="wishlist_index">
                    <a href="#none" class="first"><img src="../img/firstpage.png" width="20" height="20" alt="첫 페이지"></a>
                    <a href="#none"><img src="../img/beforepage.png" width="20" height="20" alt="이전 페이지"></a>
                    <ol>
                    <li class="now_page"><a href="?page=1" class="this"> 1 </a></li>
                    </ol>
                    <a href="#none"><img src="../img/nextpage.png" width="20" height="20" alt="다음 페이지"></a>
                    <a href="#none" class="last"><img src="../img/lastpage.png" width="20" height="20" alt="마지막 페이지"></a>
                    </div>


            </div>
        </div>

     
         <!-- FOOTER -->
         <footer class="section">
             <div class="inner clearfix">
                 <ul class="site-links float--right">
                     <li><a href="#">API</a></li>
                     <li><a href="#">Training</a></li>
                     <li><a href="#">Shop</a></li>
                     <li><a href="#">About</a></li>
                 </ul>
                 <ul class="site-links float--left">
                     <li>© 2020 STANDARD Inc.</li>
                     <li><a href="#">Terms</a></li>
                     <li><a href="#">Status</a></li>
                     <li><a href="#">Help</a></li>
                 </ul>
             </div>
         </footer>
         
     </body>
     
     </html>

