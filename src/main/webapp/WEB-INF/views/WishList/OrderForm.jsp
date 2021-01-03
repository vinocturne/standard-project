<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!-- daum 우편번호 찾기를 위한 라이브러리 호출 -->
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                                    <td><input id="c_Name" name="c_Name" type="text" maxlength="14"></span>
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
                                            readonly="readonly" maxlength="14" value="" type="text">
                                        <input type="button" onClick="openDaumZipAddress();" class="Address_btn"
                                            name="Address_btn" value="우편번호 찾기"><br>
                                        <input id="c_Address1" name="c_Address1" fw-filter="isFill" fw-label="주소"
                                            fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value=""
                                            type="text"> 기본주소<br>
                                        <input id="c_Address2" name="c_Address2" fw-filter="" fw-label="주소" fw-msg=""
                                            class="inputTypeText" placeholder="" value="" type="text"> 나머지주소 (선택입력가능)
                                    </td>
                                </tr>
                                <tr class="c_Phone1">
                                    <th scope="row"> 연락처 1 <img
                                            src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8"
                                            height="8" alt="필수"></th>
                                    <td><select id="c_Phone1" name="mobile1-1" fw-filter="isNumber&amp;isFill"
                                            fw-label="연락처1" fw-alone="N" fw-msg="">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>-<input id="mobile2" name="mobile1-2" maxlength="4"
                                            fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N" fw-msg=""
                                            value="" type="text">-<input id="mobile3" name="mobile1-3" maxlength="4"
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
                                    <th scope="cols">선택</th>
                                    <th scope="cols">이미지</th>
                                    <th scope="cols">상품정보</th>
                                    <th scope="cols">가격</th>
                                    <th scope="cols">수량</th>
                                    <th scope="cols">주문금액</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            </table>


    
    </div>
</div>
</div>
<script>
//배송지 선택
window.onload = function(){
    fn_select_defaultDes();
}
    // 컨트롤러에서 고객정보 넣어주면 넣기.(JSON?)
    var o_Name = document.getElementById("c_Name") ;//이름
    var o_Zipcode =document.getElementById("zipcode");//우편번호
    var o_Address1 =document.getElementById("c_Address1");//주소1
    var o_Address2 =document.getElementById("c_Address2");//주소2
    var o_Phone1 =document.getElementById("c_Phone1");//번호1-1
    var o_Phone2 =document.getElementById("mobile2");//번호1-2
    var o_Phone3 =document.getElementById("mobile3");//번호1-3

function fn_select_defaultDes(){
    console.log("기본 배송지 선택");
    o_Name.value="${loginCustomer.c_Name}";
    o_Zipcode.value="000-000";
    o_Address1.value="dtdt";
    o_Address2.value="ddtd";
    o_Phone1.value="010";
    o_Phone2.value="2222";
    o_Phone3.value="1111";

}
function fn_select_newDes(){
    console.log("새 배송지 선택");
    o_Name.value="";
    o_Zipcode.value="";
    o_Address1.value="";
    o_Address2.value="";
    o_Phone1.value="";
    o_Phone2.value="";
    o_Phone3.value="";

}

</script>



<%@ include file="../footer.jsp"%>