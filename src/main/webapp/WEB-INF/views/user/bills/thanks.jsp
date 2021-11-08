<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<meta charset="ISO-8859-1">
<title>Thank you</title>

<body>
<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.html">トップ</a> <span class="divider">/</span></li>
		<li class="active">お会計</li>
    </ul> <br/>
	<h2>ご注文ありがとうございます！</h2><br/>
	<a href="<c:url value="/trang-chu"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> ショッピング続き </a>
	<a href="<c:url value="/check-out"/>" class="shopBtn btn-large pull-right">お買い物履歴を確認 <span class="icon-arrow-right"></span></a>
</div>
</div>
</body>