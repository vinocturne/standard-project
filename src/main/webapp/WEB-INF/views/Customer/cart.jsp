<%@page import="org.standard.project.wishList.WishListProductVO"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.standard.project.wishList.WishListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.order.OrderHistoryVO"%>
<%@ include file="../head.jsp"%>

</head>

<!-- HEADER -->
<%@ include file="../header.jsp"%>

<!--COMTENT -->
<div class="content_wrap inner">
   <!-- side_nav -->
   <%@ include file="../side_nav.jsp"%>

   <!-- 
   Model에 저장된 목록.
   
   (ArrayList<wishListVO>) wishListVO :  int w_Quantity, p_Price; private String c_Id, p_Id;
   (ArrayList<wishListProductVO>) wishListProductVO : String p_Id, parent_p_Id, pp_Name,p_Color,p_Size,pp_thumb;  int p_Stack,p_Price;
   두 Model의 순서는 같으며, 같은 i번째의 목록은 동일 상품에 대한 정보임. wishListVO.get(i).p_Id 와 wishListProductVO.get(i).p_Id가 같음.
   WishListVO에서 w_Quantity(장바구니 수량), p_Price 이용.
   wishListProductVO에서 pp_Name(상품명),p_Color(색),p_Size(싸이즈),pp_thumb(썸네일이미지),p_Stack(재고) 를 이용해서 테이블 구성한다.
   
   기능 구현 목록:
   1.주문을 원하는 상품을 체크한 후 하단 주문하기 버튼을 누르면, 품목별 상품아이디(p_Id), p_Price(상품가격), 주문수량, 주문가격(상품가격x주문수량)을 넘겨준다.
   2. p_Stack의 재고가 없는경우 품절 표시하면 좋겠습니다.
   (추후 구현)상품 이미지나 상품명을 클릭하면 a href = /?/?/pp_Name이 되게해서 상품페이지로 이동할수 있도록한다.
   -->
   <!-- CART:주문조회-->
   <body 
      onload="initialize();"> 
   <div class="order_wrap">
      <div class="title_area">
         <div class="title_area1">
            <h1>장바구니</h1>
         </div>
      </div>
      <script>
         
         function initialize(){
               var sell_price = document.getElementsByName("sell_price");
               var amount = document.getElementsByName("amount");
               var sum = document.getElementsByName("sum");
               for(var i =0;i<sell_price.length;i++){
                  sum[i].value= (amount[i].value)*(sell_price[i].value); 
               }
         }
         var findIndex;
         function addQuantity(i){
            console.log(i);
            var targetIdx =Number(i);
            var chBoxs = document.getElementsByName("chBox");
            var IDs = document.getElementsByName("productID");
            var sell_price = document.getElementsByName("sell_price");
            var amount = document.getElementsByName("amount");
            var sum = document.getElementsByName("sum");
            amount[targetIdx].value++;
            sum[targetIdx].value= (amount[targetIdx].value)*(sell_price[targetIdx].value); 
         }
         function minusQuantity(i){
            console.log(i);
            var targetIdx =Number(i);
            var chBoxs = document.getElementsByName("chBox");
            var IDs = document.getElementsByName("productID");
            var sell_price = document.getElementsByName("sell_price");
            var amount = document.getElementsByName("amount");
            var sum = document.getElementsByName("sum");
            if(amount[targetIdx].value>1){
               amount[targetIdx].value--;
            }
            sum[targetIdx].value= (amount[targetIdx].value)*(sell_price[targetIdx].value); 
         }

      </script>



      <div class="order_table">
         <table class="type15">
            <thead>
               <tr>
                  <th><input type="checkbox" name="allCheck" id="allCheck" /><label
                     for="allCheck">선택</label> <script>
            $("#allCheck").click(function() {
               var chk = $("#allCheck").prop("checked");
               if (chk) {
                  $(".chBox").prop("checked", true);
               } else {
                  $(".chBox").prop("checked", false);
               }
            });
         </script></th>
                  <th>이미지</th>
                  <th>상품명</th>
                  <th>상품옵션</th>
                  <th>판매가</th>
                  <th>수량</th>
                  <th>합계</th>
               </tr>
            </thead>
            <tbody>
                  <% ArrayList<WishListVO> wishListVO = (ArrayList<WishListVO>)session.getAttribute("wishListVO");%>
                  <% ArrayList<WishListProductVO> wishListProductVO = (ArrayList<WishListProductVO>)session.getAttribute("wishListProductVO");%>

                  <%for(int i=0;i<wishListVO.size();i++) { %>
                  <script>
                     var rowIdxStr = "<%=i %>";
                     var rowIdx = Number(rowIdxStr);
                     console.log(rowIdx);
                  </script>
                  <tr>
                     <td><div class="checkBox">
                           <input type="checkbox" name="chBox" class="chBox"
                              data-p_Id="<%=wishListVO.get(i).getP_Id() %>"
                              data-c_Id="<%=wishListVO.get(i).getC_Id() %>"
                              data-p_Price="<%=wishListVO.get(i).getP_Price() %>"
                              data-w_Quantity="<%=wishListVO.get(i).getW_Quantity() %>"
                              data-pp_Name="<%=wishListProductVO.get(i).getPp_Name() %>"
                              data-p_Color="<%=wishListProductVO.get(i).getP_Color() %>"
                              data-p_Size="<%=wishListProductVO.get(i).getP_Size() %>"
                              data-pp_thumb="<%=wishListProductVO.get(i).getPp_thumb() %>"
                       data-p_Brand ="<%=wishListProductVO.get(i).getP_Brand() %>"
                       data-parent_p_Id="<%=wishListProductVO.get(i).getParent_p_Id() %>"/>
                           <script>
                                 $(".chBox").click(
                                       function() {
                                          $("#allCheck").prop(
                                                "checked",
                                                false);
                                       });
                              </script>
                        </div></td>
                     <td><img src="<%=request.getContextPath() %><%=wishListProductVO.get(i).getPp_thumb()%>"></td>
                     <td><%=wishListProductVO.get(i).getPp_Name() %></td>
                     <td>색상: <%=wishListProductVO.get(i).getP_Color() %><br>
                        사이즈: <%=wishListProductVO.get(i).getP_Size() %></td>
                        <form name="form" method="get">
                     <td><input type=hidden name="sell_price" value="<%=wishListVO.get(i).getP_Price() %>"><%=wishListVO.get(i).getP_Price() %></td>
                     <td><span class=""> <span class="ec-base-qty">
                     <input type="hidden" name="productID" value="<%=wishListVO.get(i).getP_Id() %>">
                     <input type="text" name="amount" value="<%=wishListVO.get(i).getW_Quantity() %>" size="3" onchange="change();">
                     <a onclick="addQuantity('<%=i %>');"> <img
                                 src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
                                 alt="수량증가" class="up">
                           </a> <a onclick="minusQuantity('<%=i %>');"> <img
                                 src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
                                 alt="수량감소" class="down">
                           </a>
                        </span>
                     </span></td>
                     <td> 
                        <script>

                        </script>
                        <input type="text" name="sum" size="11"  readonly> 원</td>
                     </form>
                  </tr>
                  <% }%>
            </tbody>
         </table>
         <div class="cartButton">
            <div class="orderBtn">
               <button type="button" class="selectOrder_btn">주문하기</button> <script>
               $(".selectOrder_btn").click(function() {
                     var jsonArr = new Array();
                     $("input[class='chBox']:checked").each(function(i,j) {
                        //부모노드? 형제 노드?
                        // console.log("체크박스.each : "+i);
                        // console.dir(j);
                        // console.log("체크박스.each 의 j 노드네임: "+j.nodeName);
                        // console.log("체크박스.each 의 j 부모부모노드네임: "+j.parentNode.parentNode.nodeName);
                        // var td =j.parentNode.parentNode;
                        // var quantitytd =td.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling;
                        // console.log(quantitytd);
                        // var quantityInput =quantitytd.firstChild.firstChild.nodeValue;
                        // console.log(quantityInput);
                        var productIDs =document.getElementsByName("productID");
                        var amount = document.getElementsByName("amount");
                        var targetProductID = $(this).attr("data-p_Id");
                        var index=-1;
                        for(var i =0;i<productIDs.length;i++){
                           if(productIDs[i].value==targetProductID){
                              console.log("인덱스: "+i);
                              index=i;
                              break;
                           }
                        }
                        if(index!=-1){
                           console.log(productIDs[index].value+"의 수량은 : "+amount[index].value);
                        }

                        var jsonStr = {p_Id : $(this).attr("data-p_Id"),p_Price:$(this).attr("data-p_Price"),
                                 w_Quantity:amount[index].value, pp_Name:$(this).attr("data-pp_Name"),
                                 p_Color:$(this).attr("data-p_Color"),p_Size:$(this).attr("data-p_Size"),
                                 pp_thumb:$(this).attr("data-pp_thumb"),p_Brand : $(this).attr("data-p_Brand"),
                         parent_p_Id: $(this).attr("data-parent_p_Id")
                     }
                     jsonArr.push(jsonStr);
                     });
                     jsonStringfied = JSON.stringify(jsonArr);
                     console.log(jsonStringfied);
                      if (!(jsonStringfied == "")) {
                        
                         var form = document.createElement('form');
                         form.setAttribute('method', 'post'); //GET 전환 가능
                         form.setAttribute('action', getContextPath()+'/wishList/order');
                         document.charset = "utf-8";
                         
                             var hiddenField = document.createElement('input');
                             hiddenField.setAttribute('type', 'hidden'); //값 입력
                             hiddenField.setAttribute('name', "data");
                             hiddenField.setAttribute('value', jsonStringfied);
                             form.appendChild(hiddenField);
                         
                         document.body.appendChild(form);
                         form.submit();

                     }else{
                        alert("주문할 상품을 선택해주세요");
                     }
               });
            </script>
            </div>
         <div>
            <a class="delBtn">
               <button type="button" class="selectDelete_btn">삭제하기</button> <script>
               $(".selectDelete_btn").click(function() {
                  var confirm_val = confirm("정말 삭제 하시겠습니까?");

                  if (confirm_val) {
                     var checkArr = new Array();
                     $("input[class='chBox']:checked").each(function() {
                        var productID =$(this).attr("data-p_Id");
                        var customerID =$(this).attr("data-c_Id");
                        var arr ={"p_Id": productID,"c_Id":customerID}
                        checkArr.push(arr);
                     });
                     
                     if (!(checkArr == "")) {


                        var form = document.createElement('form');
                         form.setAttribute('method', 'post'); //GET 전환 가능
                         form.setAttribute('action', getContextPath()+'/wishList/DeleteWishList');
                         document.charset = "utf-8";
                         
                             var hiddenField = document.createElement('input');
                             hiddenField.setAttribute('type', 'hidden'); //값 입력
                             hiddenField.setAttribute('name', "data");
                             hiddenField.setAttribute('value', JSON.stringify(checkArr));
                             form.appendChild(hiddenField);
                         
                         document.body.appendChild(form);
                         form.submit();

                        // $.ajax({
                        //    type : "POST",
                        //    url : "DeleteWishList",/* 보낼곳 */
                        //    data : {
                        //       "data" : JSON.stringify(checkArr)
                        //    },
                        //    success : function(result) {
                        //       alert("삭제 성공");
                        //       location.href = "cart";/* 끝나고 갈곳 */
                        //    }
                        // });

                     }else{
                        alert("삭제할 상품을 선택해주세요");
                     }
                  }
               });
            </script>
            </a>
         </div>
         </div>
      </div>
      </form>
      <div class="cart_index">
         <button type="button" class="" onclick="">
            <button><<</button>
            </a>
            <button type="button" class="" onclick="">
               <button><</button>
               </a>
               <button type="button" class="" onclick="">
                  <button>1</button>
                  </a>
                  <button type="button" class="" onclick="">
                     <button>></button>
                     </a>
                     <button type="button" class="" onclick="">
                        <button>>></button>
                        </a>
      </div>
   </div>
</div>

<script>
            $( document ).ready( function() {
              $( '.sAgreeAllChecked' ).click( function() {
                $( '.ec-base-chk' ).prop( 'checked', this.checked );
              } );
            } );
          </script>
          </body>
<!— FOOTER —>
<%@ include file="../footer.jsp"%>