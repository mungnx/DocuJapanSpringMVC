<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<body>
<div class="span9">
<div>
	<div class="well np">
		<div id="myCarousel" class="carousel slide homCar">
            <div class="carousel-inner">

						<c:forEach var="item" items="${slides }" varStatus="index">
							<c:if test="${index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${not index.first }">
								<div class="item">
							</c:if>
							<img 
								src="${pageContext.request.contextPath }/assets/admin/img/${item.img }" alt="${item.img }">
							<div class="carousel-caption">
								<h4>${item.caption }</h4>
								<p>
									<span>${item.content}</span>
								</p>
							</div>
					</div>	
						</c:forEach>	
						</div>								
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				
				</div>
		</div>
	<!--
New Products
-->
		<div class="well well-small">
			<h3>ピックアップ</h3>
			<hr class="soften" />
			<div class="row-fluid">
				<div id="newProductCar" class="carousel slide">
					<div class="carousel-inner">
						<c:if test="${new_products.size()>0 }">
							<div class="item active">
								<ul class="thumbnails">
									<c:forEach var="item" items="${new_products}" varStatus="loop">
										<li class="span3">
											<div class="thumbnail">
											<a class="zoomTool" href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>"
													title="add to cart"><span class="icon-search"></span>
													チェック</a> <a href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>"><img
													src="<c:url value="/assets/user/img/${item.img }"/>" alt=""></a>
											</div>
										</li>
										<c:if test="${(loop.index +1)%4==0 ||(loop.index +1)==new_products.size() }">
								</ul>
							</div>
							<c:if test="${(loop.index +1)<new_products.size() }">

								<div class="item">
									<ul class="thumbnails">
							</c:if>
						</c:if>
						</c:forEach>
						</c:if>
					</div>
					<a class="left carousel-control" href="#newProductCar"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#newProductCar" data-slide="next">&rsaquo;</a>
				</div>
			</div>

		</div>
		<!--
	Featured Products
	-->
			<div class="well well-small">
				<h3>
					<a class="btn btn-mini pull-right" href="products.html"
						title="View more">View More<span class="icon-plus"></span></a>
					おすすめ
				</h3>
				<hr class="soften" />
				<div class="row-fluid">

				<c:if test="${highlight_products.size()>0 }">

					<ul class="thumbnails">
						<c:forEach var="item" items="${highlight_products }" varStatus="loop">
							<li class="span4">
								<div class="thumbnail">
									<a class="zoomTool" href="product_details.html"
										title="add to cart"><span class="icon-search"></span>
										QUICK VIEW</a> <a href="chi-tiet-san-pham/${item.id_product }"><img
										src="<c:url value="/assets/user/img/${item.img }"/>" alt=""></a>
									<div class="caption">
										<h5>${item.name }</h5>
										<h4>
											<a class="defaultBtn" href="product_details.html"
												title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="<c:url value="/AddCart/${item.id_product }"/>" title="add to cart"><span
												class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> ¥</span>
										</h4>
									</div>
								</div>
							</li>
							<c:if test="${(loop.index +1)%3==0 ||(loop.index +1)==highlight_products.size() }">
					</ul>
					<c:if test="${(loop.index +1)<highlight_products.size() }">
						<ul class="thumbnails">
					</c:if>
				</c:if>
				</c:forEach>
				</c:if>
			</div>
			</div>
			<hr>
			<div class="well well-small">
				<a class="btn btn-mini pull-right" href="<c:url value="/danh-sach-san-pham/1"/>">もっと見る <span
					class="icon-plus"></span></a> 全ての商品			
		</div>
		
		
	</div>
</body>
