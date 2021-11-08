<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>お会計</title>

<body>

<div class="row">
<div id="sidebar" class="span3">

			  <div class="well well-small alert alert-warning cntr">
				  <h2>50% Discount</h2>
				  <p> 
					 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
				  </p>
			  </div>
			  <div class="well well-small" ><a href="#"><img src="<c:url value="assets/user/img/paypal.jpg"/>" alt="payment method paypal"></a></div>
			
			<a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="/DocuJapan/chi-tiet-san-pham/130" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="<c:url value="assets/user/img/ampu1.png"/>" alt="bootstrap ecommerce templates">
				<div class="caption">
				  <h4><a class="defaultBtn" href="/DocuJapan/chi-tiet-san-pham/130">VIEW</a> <span class="pull-right">2,2000¥</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
		  </ul>

	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="/DocuJapan/trang-chu">トップ</a> <span class="divider">/</span></li>
		<li class="active">お会計</li>
    </ul>
   
		<div class="span4">
	<form:form action="check-out" method="POST" modelAttribute="bills">
		<h3>お買い上げ情報</h3>
		<div class="control-group">
			<label class="control-label">氏名 <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text"  placeholder="氏名を入力" path="username" /> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">電話番号 <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text"  placeholder="電話番号を入力" path="phone" /> 
			</div>
		</div>
		 <div class="control-group">
			<label class="control-label">Email <sup></sup></label>
			<div class="controls">
			  <form:input type="text" rows="5" cols="30"  placeholder="Emailを入力" path="email" /> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">住所 <sup>*</sup></label>
			<div class="controls">
			   <form:textarea type="text"  placeholder="住所を入力" path="address" /> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">メモ </label>
			<div class="controls">
			  <form:textarea type="text" placeholder="メモ帳" path="note" /> 
			</div>
		</div>
	<div class="control-group">
		<div class="controls">
		 <input type="submit" name="submitAccount" value="送信" class="shopBtn exclusive">
		</div>
	</div>
	</form:form>
		</div>

</div>

</div>
</body>