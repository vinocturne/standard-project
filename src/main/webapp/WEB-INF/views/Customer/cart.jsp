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
	<div class="order_wrap">
		<div class="title_area">
			<div class="title_area1">
				<h1>장바구니</h1>
			</div>
		</div>
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
					<form name="ck_form" method="get">
						<% ArrayList<WishListVO> wishListVO = (ArrayList<WishListVO>)session.getAttribute("wishListVO");%>
						<% ArrayList<WishListProductVO> wishListProductVO = (ArrayList<WishListProductVO>)session.getAttribute("wishListProductVO");%>

						<%for(int i=0;i<wishListVO.size();i++) { %>
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
										/>
									<script>
											$(".chBox").click(
													function() {
														$("#allCheck").prop(
																"checked",
																false);
													});
										</script>
								</div></td>
							<td><img src="<%=wishListProductVO.get(i).getPp_thumb()%>"></td>
							<td><%=wishListProductVO.get(i).getPp_Name() %></td>
							<td>색상: <%=wishListProductVO.get(i).getP_Color() %><br>
								사이즈: <%=wishListProductVO.get(i).getP_Size() %></td>
							<td><%=wishListVO.get(i).getP_Price() %></td>
							<td><span class=""> <span class="ec-base-qty">
										<input type="text" name="amount"
										value="<%=wishListVO.get(i).getW_Quantity() %>" size="3"
										onchange="change();"> <a onclick="add();"> <img
											src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
											alt="수량증가" class="up">
									</a> <a onclick="del();"> <img
											src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
											alt="수량감소" class="down">
									</a>
								</span>
							</span></td>
							<td><%=wishListVO.get(i).getP_Price() %>원</td>
							<!-- <input type="text" name="o_TotalPrice" id="o_TotalPrice" >	 -->
							<% }%>
						
						<tr>
				</tbody>
			</table>
			<div>
				<a class="orderBtn">
					<button type="button" class="selectOrder_btn">주문하기</button> <script>
					$(".selectOrder_btn").click(function() {
						var confirm_val = confirm("정말 삭제 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-p_Id"));
								checkArr.push($(this).attr("data-p_Price"));
								checkArr.push($(this).attr("data-w_Quantity"));
								checkArr.push($(this).attr("data-pp_Name"));
								checkArr.push($(this).attr("data-p_Color"));
								checkArr.push($(this).attr("data-p_Size"));
								checkArr.push($(this).attr("data-pp_thumb"));
								
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "DeleteParentProduct",/* 보낼곳 */
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("주문하기로 이동 성공");
										location.href = "ProductManage";/* 끝나고 갈곳 */
									}
								});
							}else{
								alert("주문할 상품을 선택해주세요");
							}
						}
					});
				</script>
				</a>
			</div>
			<div>
				<a class="delBtn">
					<button type="button" class="selectDelete_btn">삭제하기</button> <script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-p_Id"));
								checkArr.push($(this).attr("data-c_Id"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "DeleteParentProduct",/* 보낼곳 */
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "ProductManage";/* 끝나고 갈곳 */
									}
								});
							}else{
								alert("삭제할 상품을 선택해주세요");
							}
						}
					});
				</script>
				</a>
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
<!— FOOTER —>
<%@ include file="../footer.jsp"%>