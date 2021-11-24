<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<body>
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${categories }">
						<li><a  href='<c:url value="/san-pham/${item.id }"/>'><span
								class="icon-chevron-right"></span> ${item.name}</a></li>
					</c:forEach>
					<li><a class="totalInCart" href="<c:url value="/gio-hang/"/>"><strong>お会計： <span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber type="number" groupingUsed="true" value="${TotalPriceCart }" /> ¥</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>50% セール</h2>
				<p>
					ウェブサイトで購入限定. <br> <br> <a
						class="defaultBtn" href="#">すぐにチェック </a>
				</p>
			</div>
			<div class="well well-small">
			
				<a href="#"><img src="<c:url value="/assets/user/img/paypal.jpg"/>"
					alt="payment method paypal"></a>
			</div>

			<a class="shopBtn btn-block" href="#">Upcoming products <br>
				<small>詳細を見る</small></a> <br> <br>
			<ul class="nav nav-list promowrapper">
				<li>
					<div class="thumbnail">
						<a class="zoomTool" href="product_details.html"
							title="add to cart"><span class="icon-search"></span> チェック</a> <img src="<c:url value="/assets/user/img/a.jpg"/>"
							alt="bootstrap ecommerce templates">
						<div class="caption">
						<h4>
								<a class="defaultBtn" href="product_details.html">見る</a> <span
									class="pull-right">2200¥</span>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a class="zoomTool" href="#"
							title="add to cart"><span class="icon-search"></span> チェック</a> <img src="<c:url value="/assets/user/img/j.jpg"/>"
							alt="shopping cart template">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="#">見る</a> <span
									class="pull-right">2200¥</span>
							</h4>
						</div>
					</div>
				</li>
			</ul>

		</div>
		</body>
