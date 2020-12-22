<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %> 
</head>
<%@ include file="../header.jsp" %> 
<div class="content_wrap inner">
             <!-- side_nav -->
             <div class="side_nav">
                 <div class="side_nav_item">
                     <p class="side_nav_title">My page</p>
                     <ul>
                         <li><a href="Modify.html">MY info</a></li>
                         <li><a href="cart.html">Cart</a></li>
                         <li><a href="order.html">Order</a></li>
                         <li><a href="Wishlist.html">Wish list</a></li>
                         <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                     </ul>
                 </div>
             </div>
             

             <!-- Modify -->

             <div class="register_wrap">
                <div class="title_area">
                  <div class="title_area1">
                      <h1>회원 정보 수정</h1>
                  </div>
                  <div class="title_area2">
                      <h2>기본 정보</h2>
                      <p class="required"> <img src="../img/required.png" width="8" height="8"> 필수입력사항</p>
                  </div>
                  </div>
                <div class="Register_table">
                    <form action="/project/Customer/Modify" method="POST">
                    <table class="type12">
                        <thead>
                       		<tr class="c_Id">
                                <th scope="row" > 아이디 <img src="../img/required.png" width="8" height="8" alt="필수"></th>
                                <td><input id="c_Id" name="c_Id" type="text" class="inputTypeText"></th>
                            </tr>
                            <tr class="c_Password">
                                <th scope="row"> 비밀번호 <img src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8" height="8" alt="필수"></th>
                                <td><input id="c_Password" name="c_Password" autocomplete="off" maxlength="16" 0="disabled"  type="password"> 
                                    (영문 대소문자/숫자 2가지 이상 조합, 10자~16자)</td>
                            </tr>
                            <tr class="c_Password_confirm">
                                <th scope="row"> 비밀번호 확인 <img src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8" height="8" alt="필수"></th>
                                <td><input id="c_Password_confirm" name="c_Password_confirm" fw-filter="isFill&amp;isMatch[c_Password]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="" type="password"> 
                                    <span id="pwConfirmMsg"></span> </td>
                            </tr>
                            <!-- <tr>
                                <th scope="row" id="c_Birthday"> 출생년도</th>
                                <td> <input type="date" name="c_Birthday" value='2000-01-01'>
                            </tr> -->
                            <tr class="c_Address">
                            <!-- zipcode추가로 우편번호 주소 1,2 name 변경해줬습니다. -->
                                <th scope="row"> 주소 <img src="<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8" height="8" alt="필수"></th>
                                <td>
                                    <input id="c_Address1" name="zipcode" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text">                    
                                    <a href="#none" onclick="" id=""><input type="button" class="Address_btn" name="Address_btn" value="우편번호 >"></a><br>
                                    <input id="c_Address2" name="c_Address1" fw-filter="isFill" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"> 기본주소<br>
                                    <input id="addr2" name="c_Address2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 나머지주소 (선택입력가능)
                                </td>    
                            </tr>
                            <tr class="c_Phone1">
                                <th scope="row"> 연락처 1 <img src= "<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8" height="8" alt="필수"></th>
                                <td><select id="c_Phone1" name="mobile1-1" fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N" fw-msg="">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                                </select>-<input id="mobile2" name="mobile1-2" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N" fw-msg="" value="" type="text">-<input id="mobile3" name="mobile1-3" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="연락처1" fw-alone="N" fw-msg="" value="" type="text"></td>
                            </tr>
                            <tr class="c_Phone2">
                                <th scope="row"> 연락처 2 
                                <td><select id="c_Phone2" name="mobile2-1" fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N" fw-msg="">
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
                                </select>-<input id="phone2" name="mobile2-2" maxlength="4" fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N" fw-msg="" value="" type="text">-<input id="phone3" name="mobile2-3" maxlength="4" fw-filter="isNumber&amp;isNumber" fw-label="연락처2" fw-alone="N" fw-msg="" value="" type="text"></td>
                                </tr>
                            <tr class="businessNumber">
                                <th scope="row"> 사업자번호 </th>
                                <td><input  id="businessNumber" name="businessNumber" type="text" pattern="[0-9]+" maxlength="10"></span>
                                </td>
                            </tr>
                            <tr class="c_Email">
                            <th scope="row"> 이메일 <img src= "<%=request.getContextPath()%>/ResourcesFile/img/required.png" width="8" height="8" alt="필수"></th>
                            <td>
                                <input name="email1" type="text" class="box" id="email1" size="15" onclick="mk_phoneNumber()"> @ <input name="email2" type="text" class="box" id="email2" size="20">
                                <select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
                                    <option value="" selected>선택하세요</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="yahoo.co.kr">gmail.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="hanmail.com">daum.net</option>
                                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                                    <option value="1">직접입력</option>
                                </select>
                                </td>
                            </tr>
                            <!-- <tr class="role">
                                <th scope="row"> Role </th>
                                <td><select name="role" id="role">
                                <option value="">구매자</option>
                                <option value="">셀러</option>    
                                </select>
                                </td>
                            </tr> -->
                            <tr class="brandName">
                                <th scope="row"> 브랜드명 </th>
                                <td><input  id="brandName" name="brandName" type="text" ></span>
                                </td>
                            </tr>
                    </table>
                </div>
                <div class="confirm-button modify">
                
                    <a href="#none" onclick="memberEditAction()">
                        <img src="<%=request.getContextPath()%>/ResourcesFile/img/modify.png" width="135" height="40" alt="회원정보수정">
                        <!-- <input type="submit" value="회원정보수정"> --></a>
                    <a href="/project">
                        <img src="<%=request.getContextPath()%>/ResourcesFile/img/cancel.png" width="135" height="40" alt="취소">
                        <!-- <input type="submit" value="취소"> --></a><!-- 일단 옆에 있는것들이랑 같이 모양새 만듬 -->
                    <span class="withdrawal">
                        <a href="/project" onclick="memberDelAction(0, -1, -1)">
                        <img src="<%=request.getContextPath()%>/ResourcesFile/img/withdrawal.png" width="100" height="30" input type="submit" value="회원탈퇴"alt="회원탈퇴">
                        <!-- <input type="submit" value="회원탈퇴"> --></a>
                    </span>
                </div>
            </div>
        </div>
     </form>
        <%@ include file="../footer.jsp"%>