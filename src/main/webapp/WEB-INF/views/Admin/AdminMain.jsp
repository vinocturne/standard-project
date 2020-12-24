<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>

<div class="frame">
	<div class="container">
		<div class="nav">
			<ul class="nav-list">
				<li>관리자페이지</li>
				<br>
				<li><a href="/project/Admin/AdminMain">가입 대기 목록</a></li>
				<li><a href="/project/Admin/seller">Magazine 관리</a></li>
				<li><a href="/project/Cs/cs_request">Customer Q&A</a></li>
			</ul>
		</div>
	</div>

	<div class="content"> 
        <h3>가입 대기 목록</h3>
        <br>
        <table class="table table-hover">
            <thead>
              <tr>
                <th>번호</th>
                <th>고객아이디</th>
                <th>고객이름</th>
                <th>출생년도</th> 
                <th>우편번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>연락처1</th>
                <th>연락처2</th>
                <th>사업자번호</th>
                <th>가입일</th>
                <th>메일주소</th>
                <th>role</th>
                <th>브랜드명</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox" name=""> 1</td>
                <td>고객아이디 c_Id</td>
                <td>고객이름 c_Name</td>
                <td>출생년도 c_Birthday</td> 
                <td>우편번호 zipcode</td>
                <td>주소 c_Address1</td>
                <td>상세주소 c_Address2</td>
                <td>연락처1 c_Phone1</td>
                <td>연락처2 c_Phone2</td>
                <td>사업자번호 businessNumber</td>
                <td>가입일 c_RegisterDay</td>
                <td>메일주소 c_Email</td>
                <td>role role</td>
                <td>브랜드명 brandName</td>
              </tr>
              <tr>
                <td><input type="checkbox" name=""> 2</td>
                <td>고객아이디</td>
                <td>고객이름</td>
                <td>출생년도</td> 
                <td>우편번호</td>
                <td>주소</td>
                <td>상세주소</td>
                <td>연락처1</td>
                <td>연락처2</td>
                <td>사업자번호</td>
                <td>가입일</td>
                <td>메일주소</td>
                <td>role</td>
                <td>브랜드명</td>
              </tr>
              <tr>
                <td><input type="checkbox" name=""> 3</td>
                <td>고객아이디</td>
                <td>고객이름</td>
                <td>출생년도</td> 
                <td>우편번호</td>
                <td>주소</td>
                <td>상세주소</td>
                <td>연락처1</td>
                <td>연락처2</td>
                <td>사업자번호</td>
                <td>가입일</td>
                <td>메일주소</td>
                <td>role</td>
                <td>브랜드명</td>
              </tr>
            </tbody>
          </table>
          <button class="add-product">가입 승인하기</button>
    </div>
</div>
<%@ include file="../footer.jsp"%>