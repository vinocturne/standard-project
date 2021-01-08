<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
	.btn btn-primary{
	}
	#selectImg_pre {
		width: 160px;
	}
	
    .content{
    width:50%;
    min-width:600px;
    
    }
    .magazineTitle{
    padding-top:10px;
    width:50px;
    }
    
    .magazineContent{
    padding-left:10px;
    
    }

	.fileclass{
	padding-top:15px;
	padding-left:10px;
	}
	
	.mgzBtn_wrap{
	display:flex;
    justify-content: center;
    align-content: center;
	}
	
	.mgzBtn {
    width: 120px;
    background-color: #5D5D5D;
    color: white;
    padding: 5px;
    margin:10px 10px; 
	}
</style>

<%@ include file="../head.jsp"%>
</head>

<%@ include file="../header.jsp"%>

<div class="content_wrap inner">
	<!-- side_nav -->
	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">관리자페이지</p>
				<ul>
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminMain">가입 대기 목록</a></li>
					<li><a href=" <%=request.getContextPath() %>/Admin/magazineManager">Magazine 관리</a></li>
					<li><a href=" <%=request.getContextPath() %>/Cs/cs_request">CS Review</a></li>
					<li><a href=" <%=request.getContextPath() %>/Admin/AdminGraph">서비스 현황</a></li>

				</ul>
			</div>
		</div>
	</div>
	
	<div class="content">
	<br><br>
	<h3>Magazine 추가</h3>
	<br>
	
		<!-- POST방식으로 넘어감. -->
		<form action=" <%=request.getContextPath() %>/Admin/magazineWrite" method="POST" enctype="multipart/form-data" class="mainclass">
		<table class="type12">
		<thead>
		<tr>
			<th>매거진 제목</th>
			<td><label class="magazineTitle"><input type="text" name="m_Title" style="width: 320px";/></label></td>
		</tr>
		<tr>
			<th>매거진 내용</th>
			<td><textarea rows="5" cols="50" name="m_Content"></textarea></td>
		</tr>
		<tr>
			<th>매거진 첨부</th>
			<td>
				<input  class = "fileclass" type="file" id="m_Img" name="m_Img"/>
				<div class="selectImg_pre">
					<img src="#" id="selectImg_pre" onerror="<%=request.getContextPath()%>/ResourcesFile/img/folder.png"/>
				</div>
			</td>
		</tr>
		</thead>
		
		
		</table>
		<div class="mgzBtn_wrap">
			<button type="submit" class="mgzBtn">등록</button>
		</div>
			
			<script>
				$("#m_Img").change(function() {
					if(this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".selectImg_pre img").attr("src", data.target.result).width(500);
						}
					reader.readAsDataURL(this.files[0]);
					}
				});
			</script>
		</form>

	</div>


</div>

<%@ include file="../footer.jsp"%>