<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<meta charset="ISO-8859-1">
<title>Danh sach san pham</title>
<style type="text/css">
.pagination {
	display: flex;
	justify-content: center;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #f89406;
	color: white;
	border: 1px solid #f89406;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
}
</style>
<body>
<!-- 
Body Section 
-->
<h1>${ paginateProduct}</h1>
<div class="row">
<div id="sidebar" class="span3">
<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${categories }">
						<li><a href='<c:url value="/san-pham/${item.id }"/>'><span
								class="icon-chevron-right"></span> ${item.name}</a></li>
					</c:forEach>
					<li><a class="totalInCart" href="<c:url value="/gio-hang/"/>"><strong>Total
								Amount <span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber type="number" groupingUsed="true" value="${TotalPriceCart }" /> đ</span>
						</strong></a></li>
				</ul>
			</div>

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
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/shopping-cart-template.png" alt="shopping cart template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/bootstrap-template.png" alt="bootstrap template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
		  </ul>

	</div>
	<div class="span9">
<!-- 
Products
-->

<c:if test="${product.size()>0 }">

					<div class="row-fluid">
						  <ul class="thumbnails">
						<c:forEach var="item" items="${product}" varStatus="loop">
							<li class="span4">
			  <div class="thumbnail">
				<a href="product_details.html" class="overlay"></a>
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<a href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>"><img src="<c:url value="/assets/user/img/${item.img }"/>" alt=""></a>
				<div class="caption cntr">
					<p>${item.name }</p>
					<p><strong> <fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> đ</strong></p>
					<h4><a class="shopBtn" href="<c:url value="/AddCart/${item.id_product }"/>" title="add to cart"> Add to cart </a></h4>
					<br class="clr">
				</div>
			  </div>
			</li>
		<c:if test="${(loop.index +1)%3==0 ||(loop.index +1)==product.size() }">
					</ul>
					</div>
					<c:if test="${(loop.index + 1)< product.size() }">
		 				 <div class="row-fluid">
							  <ul class="thumbnails">
					</c:if>
				</c:if>
				</c:forEach>
				</c:if>
				
<div class="pagination">
	<c:forEach var="item" begin="1" end="${paginateProduct.toltalPage }" varStatus="loop">
	
	<c:if test="${(loop.index)== paginateProduct.currentPage }">
	<a href="<c:url value="/danh-sach-san-pham/${loop.index }"/>" class="active">${loop.index }</a>
		</c:if>
	<c:if test="${(loop.index) != paginateProduct.currentPage }">
	<a href="<c:url value="/danh-sach-san-pham/${loop.index }"/>">${loop.index }</a>
	</c:if>
	</c:forEach>
	</div>
	</div>
	</div>
	 <!-- Body wrapper -->
</body>