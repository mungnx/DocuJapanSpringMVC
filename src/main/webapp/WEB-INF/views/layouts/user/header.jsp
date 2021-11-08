<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<ul class="nav">
						
									<c:forEach var="menuName" items="${menu}" varStatus="i">
								    <li><a  href="<c:url value="${menuName.url }"/>">${menuName.name}</a></li>
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