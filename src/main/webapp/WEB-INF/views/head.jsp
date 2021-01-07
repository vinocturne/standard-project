<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>INDEX</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/style.css">
<link rel="stylesheet" media="(max-width:1290px)" href="<%=request.getContextPath()%>/ResourcesFile/css/main_medium.css">
<link rel="stylesheet" media="(max-width:1290px)" href="<%=request.getContextPath()%>/ResourcesFile/css/main_small.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script defer src="<%=request.getContextPath()%>/ResourcesFile/js/main.js"></script>
<script defer src="<%=request.getContextPath()%>/ResourcesFile/js/count.js"></script>
<script>function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
  };</script>
<script type="text/javascript" language="JavaScript">
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android',
			'Windows CE', 'Windows CE;', 'LG', 'MOT', 'SAMSUNG',
			'SonyEricsson', 'Mobile', 'Symbian', 'Opera Mobi', 'Opera Mini',
			'IEmobile');
	for ( var word in mobileKeyWords) {
		if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
			window.location.href = "http://ourstandard.shop/Customer/Mobile";
			break;
		}
	}
</script>