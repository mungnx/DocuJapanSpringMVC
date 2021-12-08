<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<body>


	<!--
New Products
--><div class="span9">
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
											<a class="zoomTool"  href="/DocuJapan/assets/user/img/${item.img}"
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
									<a class="zoomTool" href="/DocuJapan/assets/user/img/${item.img}"
										title="add to cart"><span class="icon-search"></span>
										QUICK VIEW</a> <a href="chi-tiet-san-pham/${item.id_product }"><img
										src="<c:url value="/assets/user/img/${item.img }"/>" alt=""></a>
									<div class="caption">
										<h5>${item.name }</h5>
										
												<h5 style="text-align:center">Price: <fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> ¥</h5>
												<c:if test="${item.sale>0 }">
													<p>Sale: <fmt:formatNumber type="number"
																groupingUsed="true" value="${item.sale}" /> ¥
													</p>
													</c:if>
													<c:if test="${item.sale==0 }">
													<p><br/></p>
													
													</c:if>
													<h4 style="text-align:center">
											<a class="defaultBtn" href="/DocuJapan/assets/user/img/${item.img}"
												title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="<c:url value="/AddCart/${item.id_product }"/>" title="add to cart"><span
												class="icon-plus"></span></a> </h4>
										
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
