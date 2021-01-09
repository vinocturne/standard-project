<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!-- daum 우편번호 찾기를 위한 라이브러리 호출 -->
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

    function openDaumZipAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                jQuery("#zipcode").val(data.zonecode);
                jQuery("#c_Address1").val(data.address);
                jQuery("#c_Address2").focus();
                console.log(data);
            }
        }).open();
    }
</script>
</head>

<%@ include file="../header.jsp" %>

	<!-- CONTENT -->
<div class="content_wrap inner">
     <!-- side_nav -->
    <%@ include file="../side_nav.jsp"%>	 
    
    
<% 


//여긴 셀렉트박스에 02가 없다
String phone1, phone1_1, phone1_2, phone1_3;
phone1 = (String)customer.getC_Phone1();
if(phone1.length() == 10){
    phone1_1 = phone1.substring(0,3); 
    phone1_2 = phone1.substring(3,6); 
    phone1_3 = phone1.substring(6); 
}else if (phone1.length() == 11){
    phone1_1 = phone1.substring(0,3); 
    phone1_2 = phone1.substring(3,7); 
    phone1_3 = phone1.substring(7); 
}else{
    phone1_1 = ""; 
    phone1_2 = ""; 
    phone1_3 = "";
}
%>

    <!-- Register -->
    <div class="order_Wrap">
       
                <div class="title_area">
                        <h1>Order / Payment</h1>
                </div>
                
                <div class="setRecipientTable">
                        <table class="type12">
                            <thead>
								<tr>
                                    <th>배송지 선택 </th>
                                    <td> 
                                        <label for="defaultDestination">기본배송지</label> 
                                        <input type="radio" id="defaultDestination" style="width: 15px;height: 15px;" name="ch_Destination" value="defaultDestination" onclick="fn_select_defaultDes()" checked >
                                        <label for="newDestination">신규배송지</label>
                                        <input type="radio" id="newDestination" style="width: 15px;height: 15px;" name="ch_Destination" value="newDestination" onclick="fn_select_newDes()">
                                    </td>
                                </tr>
                                <tr class="c_Name">
                                    <th scope="row"> 수취인 이름 <img
                                            src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8" height="8" alt="필수"></th>
                                    <td><input id="c_Name" name="c_Name" type="text" maxlength="14" value="<%=customer.getC_Name()%>"></span>
                                    </td>
                                </tr>
                                <tr class="c_Address">
                                    <!-- zipcode추가로 우편번호 주소 1,2 name 변경해줬습니다. -->
                                    <th scope="row"> 주소 <img
                                            src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8"
                                            height="8" alt="필수"></th>
                                    <td>
                                        <input id="zipcode" name="zipcode" fw-filter="isLengthRange[1][14]"
                                            fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder=""
                                            readonly="readonly" maxlength="14" value="<%=customer.getZipcode()%>" type="text">
                                        <input type="button" onClick="openDaumZipAddress();" class="Address_btn"
                                            name="Address_btn" value="우편번호 찾기"><br>
                                        <input id="c_Address1" name="c_Address1" fw-filter="isFill" fw-label="주소"
                                            fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="<%=customer.getC_Address1()%>"
                                            type="text"> 기본주소<br>
                                        <input id="c_Address2" name="c_Address2" fw-filter="" fw-label="주소" fw-msg=""
                                            class="inputTypeText" placeholder="" value="<%=customer.getC_Address2()%>" type="text"> 나머지주소 (선택입력가능)
                                    </td>
                                </tr>
                                <tr class="c_Phone1">
                                    <th scope="row"> 연락처 1 <img
                                            src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8"
                                            height="8" alt="필수"></th>
                                    <td><select id="c_Phone1" name="mobile1-1" value ="<%=phone1_1%>" fw-filter="isNumber&amp;isFill"
                                            fw-label="연락처1" fw-alone="N" fw-msg="">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>-<input id="mobile2" value ="<%=phone1_2%>" name="mobile1-2" maxlength="4"
                                            fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N" fw-msg=""
                                            value="" type="text">-<input id="mobile3" value ="<%=phone1_3%>"name="mobile1-3" maxlength="4"
                                            fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N" fw-msg=""
                                            value="" type="text"></td>
                                </tr>
                                <tr class="c_Phone2">
                                    <th scope="row"> 연락처 2
                                    <td><select id="c_Phone2" name="mobile2-1" fw-filter="isNumber&amp;isNumber"
                                            fw-label="연락처2" fw-alone="N" fw-msg="">
                                            <option value="02">02</option>
                                            <option value="031">031</option>
                                            <option value="032">032</option>
                                            <option value="033">033</option>
                                            <option value="041">041</option>
                                            <option value="042">042</option>
                                            <option value="043">043</option>
                                            <option value="044">044</option>
                                            <option value="051">051</option>
                                            <option value="052">052</option>
                                            <option value="053">053</option>
                                            <option value="054">054</option>
                                            <option value="055">055</option>
                                            <option value="061">061</option>
                                            <option value="062">062</option>
                                            <option value="063">063</option>
                                            <option value="064">064</option>
                                            <option value="070">070</option>
                                        </select>-<input id="phone2" name="mobile2-2" maxlength="4"
                                            fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N" fw-msg=""
                                            value="" type="text">-<input id="phone3" name="mobile2-3" maxlength="4"
                                            fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N" fw-msg=""
                                            value="" type="text"></td>
                                </tr>
  
                             </thead>
                        </table>
                </div>
	                <div class="order_wrap">
	                
	                    <div class="title_area">
	                        <div class="title_area1">
	                            <h1>Product Info</h1>
	                        </div>
	                    </div>
	                    
	                    <div class="order_table">
	                        <table class="type15">
	                            <thead>
	                                <tr>
                                        <th>상품정보</th>
                                        <th>상품가격</th>
                                        <th>수량</th>
                                        <th>주문금액</th>
	                                </tr>
	                            </thead>
	                            <tbody id="cartListTableBody"></tbody>
                                </table>
                                <table>

                                </table>
								<button type="button" class="order_Product_btn" onclick="fn_purchase()">결제하기</button>
                                <!-- <input type="button" class="order_Product_btn" value="결제하기" onclick="fn_purchase()"> -->
	
	
	    
	    				</div>
					</div>
		</div>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
</script>

<script>
//배송지 선택
    var o_Name = document.getElementById("c_Name");//이름
    var o_Zipcode =document.getElementById("zipcode");//우편번호
    var o_Address1 =document.getElementById("c_Address1");//주소1
    var o_Address2 =document.getElementById("c_Address2");//주소2
    var o_Phone1_1 =document.getElementById("c_Phone1");//번호1-1
    var o_Phone1_2 =document.getElementById("mobile2");//번호1-2
    var o_Phone1_3 =document.getElementById("mobile3");//번호1-3
    var o_Phone2_1 =document.getElementById("c_Phone2");//번호2-1
    var o_Phone2_2 =document.getElementById("phone2");//번호2-2
    var o_Phone2_3 =document.getElementById("phone3");//번호2-3
    const nameValue =o_Name.value;
    const zipcodeValue=o_Zipcode.value;
    const addressValue1=o_Address1.value;
    const addressValue2=o_Address2.value;
    const phone1_1=o_Phone1_1.value;
    const phone1_2=o_Phone1_2.value;
    const phone1_3=o_Phone1_3.value;


    var jsondata = ${cartList};
    var stringfiedJSON = JSON.stringify(jsondata);
    var parsedJSON = JSON.parse(stringfiedJSON);
    var tableBody = document.getElementById("cartListTableBody");

   for(let i=0;i<parsedJSON.length;i++){
       var row ="<tr><td><img src=<%=request.getContextPath()%>"+parsedJSON[i].pp_thumb+" alt ='상품이미지'><br>"+parsedJSON[i].pp_Name+parsedJSON[i].p_Color+parsedJSON[i].p_Size+"</td><td>"+parsedJSON[i].p_Price+"</td><td>"+parsedJSON[i].w_Quantity+"</td><td>"+((parsedJSON[i].p_Price)*(parsedJSON[i].w_Quantity))+"</td></tr>";
       tableBody.innerHTML +=row;
   }
window.onload = function(){
    fn_select_defaultDes();
}

function fn_select_defaultDes(){
    o_Name.value=nameValue;
    o_Zipcode.value=zipcodeValue;
    o_Address1.value=addressValue1;
    o_Address2.value=addressValue2;
    o_Phone1_1.value=phone1_1;
    o_Phone1_2.value=phone1_2;
    o_Phone1_3.value=phone1_3; 
}
function fn_select_newDes(){
    console.log("새 배송지 선택");
    o_Name.value="";
    o_Zipcode.value="";
    o_Address1.value="";
    o_Address2.value="";
    o_Phone1_1.value="";
    o_Phone1_2.value="";
    o_Phone1_3.value="";

}
function fn_purchase(){
    console.log("결제 버튼");
    //orderHistoryVO 변수
    //c_id,p_Id,o_Date,o_Num,p_Price,o_Quantity, o_TotalPrce,o_Delivery,p_Brand
    //zipcode, o_Address, o_Address, o_Name, o_Phone1, o_Phone

    //o_Delivery, o_Num, o_Date,(c_Id)빼고 보내주기
    var c_Id = "<%=customer.getC_Id()%>"
    var o_nameValue =o_Name.value;
    var o_zipcodeValue=o_Zipcode.value;
    var o_addressValue1=o_Address1.value;
    var o_addressValue2=o_Address2.value;
    var o_phone1_1=o_Phone1_1.value;
    var o_phone1_2=o_Phone1_2.value;
    var o_phone1_3=o_Phone1_3.value;
    var o_phone2_1 =o_Phone2_1.value;
    var o_phone2_2 =o_Phone2_2.value;
    var o_phone2_3 =o_Phone2_3.value;
    var o_phone2;
    if(o_Phone2_1!=""&o_phone2_2!=""&o_phone2_3!=""){
        o_phone2 = o_phone2_1+"-"+o_phone2_2+"-"+o_phone2_3;
    }
    var o_phone1 =o_phone1_1+"-"+o_phone1_2+"-"+o_phone1_3;
    
    console.log(o_phone1_1+"-"+o_phone1_2+"-"+o_phone1_3);
    console.log("결제 버튼 클릭 시점 parsedJSON : "+parsedJSON);
    
    var purchaserDataArr = new Array();
    for(let i=0;i<parsedJSON.length;i++){
        console.log("p_Brand : "+parsedJSON[i].p_Brand);
        var purchaserData ={"c_Id":c_Id, "p_Id":parsedJSON[i].p_Id,"p_Price":parsedJSON[i].p_Price,"o_Quantity":parsedJSON[i].w_Quantity,
        "o_TotalPrice": ((parsedJSON[i].p_Price)*(parsedJSON[i].w_Quantity)),"p_Brand":parsedJSON[i].p_Brand,
        "zipcode":o_zipcodeValue, "o_Address1":o_addressValue1,"o_Address2":o_addressValue2,"o_Name" :o_nameValue ,
        "o_Phone1":o_phone1, "o_Phone2":o_phone2,"parent_p_Id":parsedJSON[i].parent_p_Id};

        purchaserDataArr.push(purchaserData);
   }
   var purchaseData = JSON.stringify(purchaserDataArr);

    var form = document.createElement('form');
    form.setAttribute('method', 'post'); //GET 전환 가능
    form.setAttribute('action', getContextPath()+'/wishList/purchase');
    document.charset = "utf-8";
    
        var hiddenField = document.createElement('input');
        hiddenField.setAttribute('type', 'hidden'); //값 입력
        hiddenField.setAttribute('name', "data");
        hiddenField.setAttribute('value', purchaseData);
        form.appendChild(hiddenField);
    
    document.body.appendChild(form);
    		
    /* 결제 */
			/* IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'STANDARD',
		    amount : 100,
		    buyer_email : 'test@standard.com',
		    buyer_name : 'test1',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';  */
		        /* msg += '고유ID : ' + rsp.imp_uid; 미관상 별로 안좋아 주석
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		        form.submit(); /* 결과값 보내기 */
		    /* } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		}); */
}

</script>

</div>




<%@ include file="../footer.jsp"%>