<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <body>
  <div>
		<section class="our_client">
			<hr class="soften" />
			
			<div class="row">
				<div class="span2">
					<a href="#"><img alt="" src="<c:url value="/assets/user/img/1.png"/>"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="<c:url value="/assets/user/img/2.png"/>"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="<c:url value="/assets/user/img/3.png"/>"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="<c:url value="/assets/user/img/4.png"/>"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="<c:url value="/assets/user/img/5.png"/>"></a>
				</div>
				<div class="span2">
					<a href="#"><img alt="" src="<c:url value="/assets/user/img/6.png"/>"></a>
				</div>
			</div>
		</section>
		<footer class="footer">
			<div class="row-fluid">
				<div class="span2">
					<h5>Your Account</h5>
					<a href="#">YOUR ACCOUNT</a><br> <a href="#">PERSONAL
						INFORMATION</a><br> 
				</div>
				<div class="span2">
					<h5>Information</h5>
					<a href="contact.html">CONTACT</a><br> <a href="#">SITEMAP</a><br>
					 <a href="#">ABOUT US</a><br>
				</div>
				<div class="span2">
					<h5>Our Offer</h5>
					<a href="#">NEW PRODUCTS</a> <br> <a href="#">TOP SELLERS</a><br>
					<a href="#">SPECIALS</a><br> 
					 <br />
				</div>
				<div class="span6">
					<h5>こちらは　デモWebサイトです</h5>
					Webで全て載せた内容はデモです。
					購入することができません,また
					お問い合わせ電話番号や住所などはフィクションです。<br>
					ご覧いただきありがとうございます！
				</div>
				
				
			</div>
			<span>Copyright &copy; 2021<br> アルプスビジネスサービス・グエンスンムン
			</span>
		</footer>
				<!--
Footer
-->
	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/assets/user/js/jquery.js"/>"></script>
	<script src="<c:url value="/assets/user/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.easing-1.3.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.scrollTo-1.4.3.1-min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/shop.js"/>"></script>
	<script type="text/javascript">
	
	var setDefaultActive = function() {
	    var path = window.location.pathname;
	    
	    var element = $("a[href='" + path + "']");

	    element.addClass("active");
	   
	}
	setDefaultActive()
	</script>
		
	</body>	