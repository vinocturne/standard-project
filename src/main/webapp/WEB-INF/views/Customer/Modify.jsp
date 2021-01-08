<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<%@ include file="../header.jsp"%>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#zipcode").val(data.zonecode);
				jQuery("#c_Address1").val(data.address);
				jQuery("#c_Address2").focus();
				console.log(data);
			}
		}).open();
	}
</script>

<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->
	<%@ include file="../side_nav.jsp"%>


	<!-- Modify -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


	<% session.getAttribute("loginCustomer"); %>
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
			
			
			String phone2, phone2_1, phone2_2, phone2_3;
			phone2 = (String)customer.getC_Phone2();
			if(phone2.startsWith("02")){
				if(phone2.length() == 9){
					phone2_1 = phone2.substring(0,2); 
					phone2_2 = phone2.substring(2,5); 
					phone2_3 = phone2.substring(5); 
				}else if(phone2.length() == 10){
					phone2_1 = phone2.substring(0,2); 
					phone2_2 = phone2.substring(2,6); 
					phone2_3 = phone2.substring(6); 
				}else{
					phone2_1 = ""; 
					phone2_2 = ""; 
					phone2_3 = "";
				}
			}else if(phone2.length() == 10){
				phone2_1 = phone2.substring(0,3); 
				phone2_2 = phone2.substring(3,6); 
				phone2_3 = phone2.substring(6); 
			}else if(phone2.length() == 11){
				phone2_1 = phone2.substring(0,3); 
				phone2_2 = phone2.substring(3,7); 
				phone2_3 = phone2.substring(7); 
			}else{
				phone2_1 = ""; 
				phone2_2 = ""; 
				phone2_3 = "";
			}
			
			String email, mail1, mail2;
			email = (String)customer.getC_Email();
			int idx = email.indexOf("@");
			mail1 = email.substring(0, idx);
			mail2 = email.substring(idx+1);

			
			%>
	<div class="register_wrap">
		<div class="title_area">
			<div class="title_area1">
				<h1>회원 정보 수정</h1>
			</div>
			<div class="title_area2">
				<h2>기본 정보</h2>
				<p class="required">
					<img src="../ResourcesFile/img/required.png" width="8" height="8">
					필수입력사항
				</p>
			</div>
		</div>
		<div class="Register_table">
		<fieldset>
			<form action=" <%=request.getContextPath() %>/Customer/Modify" method="POST"
				onsubmit="return confirm('이대로 저장하시겠습니까? ');">
				<table class="type12">
					<thead>
						<tr class="c_Id">
							<th scope="row">아이디 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><input id="c_Id" name="c_Id"
								style="background-color: pink" type="text" class="inputTypeText"
								value="<%=customer.getC_Id()%>" readonly>
							</th>
							<!-- disabled로 하면 값이 안넘어감. -->
						</tr>
						<tr class="c_Password">
							<th scope="row">비밀번호 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><input id="c_Password" name="c_Password"
								autocomplete="off" maxlength="16" 0="disabled"  type="password">
								(영문 대소문자/숫자 2가지 이상 조합, 10자~16자)</td>
						</tr>
						<tr class="c_Password_confirm">
							<th scope="row">비밀번호 확인 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><input id="c_Password_confirm" name="c_Password_confirm"
								fw-filter="isFill&amp;isMatch[c_Password]" fw-label="비밀번호 확인"
								fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
								0="disabled" value="" type="password"> <span
								id="pwConfirmMsg"></span></td>
						</tr>
						<tr class="c_Name">
							<th scope="row">이름 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><input id="c_Name" name="c_Name"
								style="background-color: pink" type="text" maxlength="14"
								value="<%=customer.getC_Name()%>" readonly></span></td>
						</tr>
						<!-- <tr>
                                <th scope="row" id="c_Birthday"> 출생년도</th>
                                <td> <input type="date" name="c_Birthday" value='2000-01-01'>
                            </tr> -->
						<tr class="c_Address">
							<!-- zipcode추가로 우편번호 주소 1,2 name 변경해줬습니다. -->
							<th scope="row">주소 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><input id="zipcode" name="zipcode"
								fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg=""
								class="inputTypeText" placeholder="" readonly="readonly"
								maxlength="14" value="<%=customer.getZipcode()%>" type="text">
								<input type="button" onClick="openDaumZipAddress();"
								class="Address_btn" name="Address_btn" value="우편번호 찾기"><br>
								<input id="c_Address1" name="c_Address1" fw-filter="isFill"
								fw-label="주소" fw-msg="" class="inputTypeText" placeholder=""
								readonly="readonly" value="<%=customer.getC_Address1()%>"
								type="text"> 기본주소<br> <input id="c_Address2"
								name="c_Address2" fw-filter="" fw-label="주소" fw-msg=""
								class="inputTypeText" placeholder=""
								value="<%=customer.getC_Address2()%>" type="text"> 나머지주소
								(선택입력가능)</td>
						</tr>
						<tr class="c_Phone1">
							<th scope="row">연락처 1 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><select id="c_Phone1" name="mobile1-1"
								fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N"
								fw-msg="">
									<option value="<%=phone1_1%>"><%=phone1_1%></option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> -<input id="mobile2" name="mobile1-2" maxlength="4"
								fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N"
								fw-msg="" value="<%=phone1_2%>" type="text">-<input
								id="mobile3" name="mobile1-3" maxlength="4"
								fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N"
								fw-msg="" value="<%=phone1_3%>" type="text"></td>
						</tr>
						<tr class="c_Phone2">
							<th scope="row">연락처 2
							<td><select id="c_Phone2" name="mobile2-1"
								fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N"
								fw-msg="">
									<option value="<%=phone2_1%>"><%=phone2_1%></option>
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
								fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N"
								fw-msg="" value="<%=phone2_2%>" type="text">-<input
								id="phone3" name="mobile2-3" maxlength="4"
								fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N"
								fw-msg="" value="<%=phone2_3%>" type="text"></td>
						</tr>

						<tr class="c_Email">
							<th scope="row">이메일 <img
								src="<%=request.getContextPath()%>/ResourcesFile/img/required.png"
								width="8" height="8" alt="필수"></th>
							<td><input name="email1" type="text" class="box" id="email1"
								size="15" value="<%=mail1%>" onclick="mk_phoneNumber()">
								@ <input name="email2" class="email2" type="text" class="box"
								id="email2" size="20" value="<%=mail2%>"> <select
								name="email_select" class="box" id="email_select"
								onChange="checkemailaddy(this);">
									<option value="<%=mail2%>" selected><%=mail2%></option>
									<option value="naver.com">naver.com</option>
									<option value="yahoo.co.kr">gmail.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanmail.com">daum.net</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="1">직접입력</option>
							</select></td>
						</tr></thead>
					</table>
				</div>
					
						<div id="companycheck">
							<span></span>
						</div>
						</fieldset>
						<!-- <tr class="role">
                                <th scope="row"> Role </th>
                                <td><select name="role" id="role">
                                <option value="">구매자</option>
                                <option value="">셀러</option>    
                                </select>
                                </td>
                            </tr> -->

						<%-- <tr class="brandName">
                                <th scope="row"> 브랜드명 </th>
                                <td><input  id="brandName" readonly name="brandName" type="text" value="<%=customer.getBrandName()%>"></span>
                                </td>
                            </tr>
                            <tr class="businessNumber">
                                <th scope="row"> 사업자번호 </th>
                                <td><input  id="businessNumber" readonly name="businessNumber" type="text" pattern="[0-9]+" maxlength="10" value="<%=customer.getBusinessNumber()%>"></span>
                                </td>
                            </tr> --%>


						<script type="text/javascript">
     					 var jbNum = "<%=customer.getBrandName()%>";
     					 if ( jbNum == null ) {
       					 	document.write ( '' );
      					} else {
      						$('#companycheck span').html(
      	                            `<table class="type12"><thead><tr class="brandName"><th scope="row"> 브랜드명 </th><td><input  id="brandName" readonly name="brandName" type="text" value="<%=customer.getBrandName()%>"></span></td></tr><tr class="businessNumber"><th scope="row"> 사업자번호 </th><td><input  id="businessNumber" readonly name="businessNumber" type="text" pattern="[0-9]+" maxlength="10" value="<%=customer.getBusinessNumber()%>"></span></td></tr></thead></table>`
      	                    );
     					}
   					 </script>

					<span class="withdrawal"> 
					<a class="delCus"> <img src="<%=request.getContextPath()%>/ResourcesFile/img/withdrawal.png" class="delCus_btn" width="100" height="30"> 
					<script>
					$(".delCus_btn").click(function() {
						var confirm_val = confirm("탈퇴 하시겠습니까?");
						if (confirm_val) {
							alert("탈퇴성공");
							location.href = "Delete";
						}else{
							alert("탈퇴취소");
						}
					});
				</script>
				</a>
				</span>
		
		<div class="confirm-button modify">

			<a> <input type="image"
				src="<%=request.getContextPath()%>/ResourcesFile/img/modify.png"
				width="135" height="40" alt="회원정보수정">
			</a> <a href=" <%=request.getContextPath() %>"> <img
				src="<%=request.getContextPath()%>/ResourcesFile/img/cancel.png"
				width="135" height="40" alt="취소">
			</a>
		</div>
	</div>
</div>
</form>

<script>
            function checkemailaddy(ele){ var $ele = $(ele); var $email2 = $('input[name=email2]'); 
              if($ele.val() == "1"){ $email2.attr('readonly', false); 
              $email2.val(''); } else { $email2.attr('readonly', true); $email2.val($ele.val()); } } 
            
           
          const hide = () =>{
        	  console.log('사업자웅앵 들어옴')
        	 	var value = document.getElementById('brandName');
        	  	console.log(value.value);
        	  	console.log(typeof value.value);
        	  	console.log(typeof null);
        	  	if(value.value==='null') {
        	  		var companyCheck = document.getElementById('companycheck');
        	  		console.log('companyCheck 나오나 확인 ====>> ' + companyCheck);
        	  		companyCheck.style.display = 'none';
        	  		} 
        	  	};
 			hide();       
         </script>

<%@ include file="../footer.jsp"%>