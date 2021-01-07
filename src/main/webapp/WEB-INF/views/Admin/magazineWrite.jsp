<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.btn btn-primary{
	}
	#selectImg_pre {
		width: 300px;
	}
	   body{
       margin-left: 100px;
       margin-right: 10%;
   }
    .table{
        width: 1200px;
    }
    .mainclass{
    	border: solid 1px black;/*가늠자 용  나중에 지워야함!*/
    	
    }
    .magazineTitle{
    padding-top:10px;
    padding-left:10px;
    }
    
    .magazineContent{
    padding-left:10px;
    
    }

	.fileclass{
	padding-top:15px;
	padding-left:10px;
	}
	
	.btn {
	margin-top:10px;
    margin-left:10px;
	}
</style>
</head>
<%@ include file="../header.jsp"%>
<div class="content_wrap">
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
	
			<label class="magazineTitle">매거진 제목 <input type="text" name="m_Title" /></label>
			<br>
			<br>
			<label class="magazineContent">매거진 내용</label>
			<textarea rows="5" cols="50" name="m_Content"></textarea>
			<br>
			
			<input  class = "fileclass" type="file" id="m_Img" name="m_Img"/>
			
			<div class="selectImg_pre"><img src="" id="selectImg_pre"/></div>
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

			<button type="submit" class="btn btn-primary">등록</button>

		</form>
	</div>

</div>


<%@ include file="../footer.jsp"%>