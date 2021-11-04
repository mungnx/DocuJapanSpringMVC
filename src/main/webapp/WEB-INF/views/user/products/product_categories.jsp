<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<meta charset="UTF-8">
<title>Chi tiet san pham</title>
<style>
 .product-content{
 	overflow-x: hidden;
 }
</style>
<body>
<!-- 
Body Section 
-->
	<div class="row product-content">
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
				  <h4><a class="defaultBtn" href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/shopping-cart-template.png" alt="shopping cart template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>">VIEW</a> <span class="pull-right">$22.00</span></h4>
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
    <ul class="breadcrumb">
    <li><a href="<c:url value="/trang-chu"/>">Home</a> <span class="divider">/</span></li>
    <li><a href="<c:url value="/san-pham/${productById.id_category}"/>">San Pham</a> <span class="divider">/</span></li>
    <li class="active">Chi tiet san pham</li>
    </ul>	
	<div class="well well-small">
	<div class="row-fluid">
			<div class="span5">
			<div id="myCarousel" class="carousel slide cntr">
                <div class="carousel-inner">
                  <div class="item active">
                   <a href="#"> <img src="<c:url value="/assets/user/img/${productById.img}"/>" alt="" style="width:100%"></a>
                  </div>
        
                </div>
            </div>
			</div>
			<div class="span7">
				<h3>${productById.name }</h3>
				<hr class="soft"/>
				
				<form class="form-horizontal qtyFrm" method="get" action="<c:url value="/AddCart/${productById.id_product }"/>">
				  <div class="control-group">
					<label class="control-label"><span><fmt:formatNumber type="number" groupingUsed="true" value="${productById.price}" /> đ</span> </label>
					
				  </div>
				
				  <h4>${productById.title}</h4>
				  <button type="submit" class="shopBtn"><span class=" icon-shopping-cart"></span> Add to cart</button>
				</form>
			</div>
			</div>
				<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
              <li class=""><a href="#profile" data-toggle="tab">Related Products </a></li>
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
			  <h4>Product Information</h4>
                <table class="table table-striped">
				<tbody>
		
				<tr class="techSpecRow"><td class="techSpecTD1">Kich thuoc:</td><td class="techSpecTD2">20mm x18mm x10mm</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Xuat xu:</td><td class="techSpecTD2">Japan</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Chat lieu:</td><td class="techSpecTD2">Go tu nhien</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Tinh trang hang:</td><td class="techSpecTD2">Hang cu qua su dung</td></tr>
				
				</tbody>
				</table>
				<hr class="softn clr"/>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
				<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>

			</div>
			<div class="tab-pane fade" id="profile">
			
			<c:set var="countList" value="${(productByCategory).size() }"></c:set>
			<c:if test="${(productByCategory).size() >6}">
				<c:set var="countList" value="6"/>
			</c:if>
			
			<c:forEach var="item" items="${productByCategory }" begin="1" end="${countList }" varStatus="loop">
	
			<div class="row-fluid">	  
			<div class="span2">
				<img src="<c:url value="/assets/user/img/${item.img }"/>" alt="">
			</div>
			<div class="span6">
				<h5>${item.name } </h5>
				<p>
				${item.detail }
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> <fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> đ</h3>
			<div class="btn-group">
			  <a href="<c:url value="/AddCart/${item.id_product }"/>" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
			  <a href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>" class="shopBtn">VIEW</a>
			 </div>
				</form>
					</div>
					</div>
			<hr class="soft">
	
				</c:forEach>
			
	</div>     
 </div>
</div>
</div>
</div> <!-- Body wrapper -->
</body>