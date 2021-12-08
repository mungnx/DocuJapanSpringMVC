<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thank you</title>

<body>
<div class="container">
         
             <jsp:include page="../header.jsp"></jsp:include>
<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.html">トップ</a> <span class="divider">/</span></li>
		<li class="active">お会計</li>
    </ul> <br/>
	<h2 style="text-align:center">ご注文ありがとうございます！</h2><br/>
	<h4 style="text-align:center">念のため、お客様に電話を確認場合もございますので、ご了承くださいませ！</h4>
	<br/>
	<a href="<c:url value="/trang-chu"/>" class="shopBtn btn-large" > ショッピング続き </a>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>