<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<meta charset="ISO-8859-1">
<title>Register</title>

<body>
<div class="row">
<div id="sidebar" class="span3">

			  <div class="well well-small alert alert-warning cntr">
				  <h2>50% Discount</h2>
				  <p> 
					 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
				  </p>
			  </div>
			  <div class="well well-small" ><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>
			
			<a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
		  </ul>

	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
    </ul>
	<h3> Dang ky tai khoan </h3>	
	<hr class="soft"/>
	<div class="well">
	<form:form action="dang-ky" method="POST" modelAttribute="user">
		<h3>Thong tin dang ky</h3>
		<div class="control-group">
		 
			<label class="control-label" for="inputFname">User Name <sup>*</sup></label>
			<div class="controls">
			<form:input type="text" id="inputFname" placeholder="Ten tai khoan" path="userName" /> 
	
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" for="inputLname">Address <sup>*</sup></label>
			<div class="controls">
			  <form:input type="text"  placeholder="Nhap dia chi" id="inputFname" path="address" />
			</div>
		 </div>
		<div class="control-group">
		<label class="control-label" for="inputEmail">Email <sup>*</sup></label>
		<div class="controls">
		   <form:input type="email" id="inputFname" placeholder="Nhap email" path="email" /> 
		</div>
	  </div>	  
		<div class="control-group">
		<label class="control-label">Password <sup>*</sup></label>
		<div class="controls">
		  <form:input type="password" placeholder="Nhap Password" path="password" />
		</div>
	  </div>
		  
		<div class="controls">
		 <input type="submit" value="Register Now" class="exclusive shopBtn" />  
		</div>
	</form:form>
	</div>
</div>
</div>
</body>
</html>