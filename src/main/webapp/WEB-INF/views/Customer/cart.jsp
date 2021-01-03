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
						<th scope="cols">선택</th>
						<th scope="cols">이미지</th>
						<th scope="cols">상품정보</th>
						<th scope="cols">가격</th>
						<th scope="cols">수량</th>
						<th scope="cols">주문금액</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
					<!-- OrderHistoryVO 구현되면 get xxx로연결하기  -->
						<td><input type="checkbox" name="checkbox" value="1" style="border:0"></td> 
						<td><img src="../ResourcesFile/img/logo2.png" style width="30px" height="20px"></th>
						<td>트위드 플레어 스커트</th>
						<td>38000원</th>
						<td>
							<form name="form" method="get">
							<span class=""> 
								<span class="ec-base-qty"> 
								<input type="text" name="amount" value="1" size="3" onchange="change();"> 
								<a onclick="add();"> 
									<img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" class="up">
								</a> 
								<a onclick="del();"> 
									<img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" class="down">
								</a>
								</span>
							</span>
							</td>
						<td>
							<input type="text" name="o_TotalPrice" id="o_TotalPrice" >원
							</form>
						</td>
					</tr>
				</tbody>
			</table>
						<div class="cart_button">
							<div>
								<button href="#">주문하기</button>
							</div>
							<div>
								<button href="#">삭제</button>
							</div>
						</div>
		</div>
		
		<div class="cart_index">
                    <button type="button" class="" onclick=""><button> << </button></a>
                    <button type="button" class="" onclick=""><button> < </button></a>
                    <button type="button" class="" onclick=""><button> 1 </button></a>
                    <button type="button" class="" onclick=""><button> > </button></a>
                    <button type="button" class="" onclick=""><button> >> </button></a>
        </div>
	</div>
</div>
	

<!-- FOOTER -->
<%@ include file="../footer.jsp"%>