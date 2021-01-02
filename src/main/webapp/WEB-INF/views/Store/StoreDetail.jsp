<%@page import="org.standard.project.product.ProductChildVO"%>
<%@page import="java.util.List"%>
<%@page import="org.standard.project.product.ProductParentVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>StoreDetail 테스트</h2><br>
	<%
		ProductParentVO p_VO = (ProductParentVO)request.getAttribute("p_VO");
		List<ProductChildVO> c_VO = (List<ProductChildVO>)request.getAttribute("c_VO");
	%>
	
	<h4><%=p_VO.getParent_p_Id() %></h4>
	<%
	for(int i=0; i<c_VO.size(); i++) {
	%>
	<h4><%=c_VO.get(i) %></h4>
	<%
	}
	%>
	
	<img src = "${pageContext.request.contextPath}<%=p_VO.getPp_thumb() %>" >
  
</body>
</html>