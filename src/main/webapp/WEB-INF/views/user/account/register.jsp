<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<meta charset="ISO-8859-1">
<title>アカウントを登録</title>

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
		<li class="active">アカウント登録</li>
    </ul>
    <div class="row">
		<div class="span4">
			<div class="well">
			<h3>新しいアカウントを登録する</h3>
	<form:form action="dang-ky" method="POST" modelAttribute="user">
		
		<div class="control-group">
		 
			<label class="control-label" for="inputFname">氏名： <sup>*</sup></label>
			<div class="controls">
			<form:input type="text" id="inputFname" placeholder="氏名を入力" path="userName" /> 
	
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLname">住所： <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text"  placeholder="住所を入力" id="inputFname" path="address" />
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="inputEmail">Email： <sup>*</sup></label>
		<div class="controls">
		   <form:input type="email" id="inputFname" placeholder="Emailを入力" path="email" /> 
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label">パスワード <sup>*</sup></label>
		<div class="controls">
		  <form:input type="password" placeholder="パスワードを入力" path="password" />
		</div>
	  </div>
		  
		<div class="controls">
		 <input type="submit" value="登録" class="exclusive shopBtn" />  
		</div>
	</form:form>
		</div>
		</div>
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well">
			<h3>アカウントがお持ちですか ?</h3>
			<h5 style="color:red;">${statusLogin }</h5>
			<form:form action="dang-nhap" method="POST" modelAttribute="user">
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Email：</label>
				<div class="controls">
				 <form:input type="email" id="inputFname" placeholder="Emailを入力" path="email" /> 
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">パスワード：</label>
				<div class="controls">
				   <form:input type="password" placeholder="パスワードを入力" path="password" />
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" class="defaultBtn">ログイン</button> <a href="#">パスワードをお忘れ?</a>
				</div>
			  </div>
			</form:form>
		</div>
		</div>
</div>
</div>
</div>
</body>
</html>