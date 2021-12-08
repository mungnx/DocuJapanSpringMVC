<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
 <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap styles -->
<link href="<c:url value="/assets/user/css/bootstrap.css"/>"rel="stylesheet" />
<!-- Customize styles -->
<link href="<c:url value="/assets/user/style.css"/>" rel="stylesheet" />
<!-- font awesome styles -->
<link href="<c:url value="/assets/user/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
<!-- Favicons -->
<link rel="shortcut icon" href="<c:url value="/assets/user/ico/favicon.ico"/>">
</head>

<!-- 
	Upper Header Section 
-->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
						<a href="#"><span class="icon-twitter"></span></a> <a href="#"><span
							class="icon-facebook"></span></a> <a href="#"><span
							class="icon-youtube"></span></a> <a href="#"><span
							class="icon-tumblr"></span></a>
					</div>
					<a  href="/DocuJapan/trang-chu"> <span class="icon-home"></span>
						ホームページ
					</a> 
					
					<c:if test="${not empty LoginInfo }">
					<a href="#"><span class="icon-user"></span>こんにちは！ ${ LoginInfo.userName}さん</a>
					<a href="<c:url value="/dang-xuat"/>"><span class="icon-lock"></span>
					ログアウト</a></c:if>
					
					<c:if test="${empty LoginInfo }">
					 <a href="<c:url value="/dang-ky"/>"><span class="icon-edit"></span>アカウント登録 - ログイン </a> 
					 </c:if>
					 <a href="#"><span class="icon-envelope"></span>
						連絡</a> <a href="<c:url value="/gio-hang/"/>"><span
						class="icon-shopping-cart"></span> ${TotalQuantyCart } 商品 - <span 
						class="badge badge-warning"> <fmt:formatNumber type="number" groupingUsed="true" value="${TotalPriceCart }" /> ¥ </span></a>
				</div>
			</div>
		</div>
	</div>

<header id="header">
			<div class="row">
				<div class="span4">
					<h1>
						<a class="logo" href="/DocuJapan/trang-chu"><span>Twitter
								Bootstrap ecommerce template</span> <img
							src="<c:url value="/assets/user/img/logo.png"/>"
							alt="DocuJapan"> </a>
					</h1>
				</div>
				<div class="span4">
					
				</div>
				<div class="span4 alignR">
					<p>
						<br> <strong> お問い合わせ (24/7) : 0800 1234 678 </strong><br>
						<br>
					</p>
					<span class="btn btn-mini">[${TotalQuantyCart }] <span
						class="icon-shopping-cart"></span></span> <span
						class="btn btn-warning btn-mini">¥</span> <span
						class="btn btn-mini">&pound;</span> <span class="btn btn-mini">&euro;</span>
				</div>
			</div>			
			
		</header>

<body>
	
		<!-- 
Navigation Bar Section 
-->
		<div class="navbar">
		
			<div class="navbar-inner">
				<div class="container">
					<a data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="nav-collapse">
						<ul class="nav topNav">					
						<c:forEach var="menuName" items="${menu}" varStatus="loop">
								
								<li  class="topNav">
								
								<a href="<c:url value="${menuName.url }"/>">${menuName.name}</a>
								
								</li>							
						</c:forEach>		
						</ul>
						<form action="#" class="navbar-search pull-left">
							<input type="text" placeholder="Search"
								class="search-query span2">
						</form>
					</div>
				</div>
			</div>
		</div>
		
	
		</body>