<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリーページ</title>

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
</head>
<body>
<!-- 
Body Section 
-->
<div class="container">
         
             <jsp:include page="../header.jsp"></jsp:include>
<div class="row">
<jsp:include page="../category.jsp"></jsp:include>
	<div class="span9">
<!-- 
Products
-->
			<c:if test="${ProductsPaginate.size()>0 }">

				<div class="row-fluid">
					<ul class="thumbnails">
						<c:forEach var="item" items="${ProductsPaginate}" varStatus="loop">
							<li class="span4">
								<div class="thumbnail">
									<a href="product_details.html" class="overlay"></a> <a
										class="zoomTool" href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>"
										title="add to cart"><span class="icon-search"></span>
										QUICK VIEW</a> <a
										href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>"><img
										src="<c:url value="/assets/user/img/${item.img }"/>" alt=""></a>
									<div class="caption cntr">
										<p>${item.name }</p>
										<p>
											<strong> <fmt:formatNumber type="number"
													groupingUsed="true" value="${item.price}" /> ¥
											</strong>
										</p>
										
										<p>Sale: <fmt:formatNumber type="number"
													groupingUsed="true" value="${item.sale}" /> ¥
										</p>
										<h4>
											<a class="shopBtn"
												href="<c:url value="/AddCart/${item.id_product }"/>"
												title="add to cart"> Add to cart </a>
										</h4>
										<br class="clr">
									</div>
								</div>
							</li>
				<c:if	test="${(loop.index +1)%3==0 ||(loop.index +1)==ProductsPaginate.size() }">
					</ul>
				</div>
				<c:if test="${(loop.index + 1)< ProductsPaginate.size() }">
					<div class="row-fluid">
						<ul class="thumbnails">
				</c:if>
			</c:if>
			</c:forEach>
			</c:if>

			<div class="pagination">
				<c:forEach var="item" begin="1" end="${ paginateSale.toltalPage}" varStatus="loop">

					<c:if test="${(loop.index)== paginateSale.currentPage }">
						<a href="<c:url value="/product-sale/${loop.index }"/>"
							class="active">${loop.index }</a>
					</c:if>
					<c:if test="${(loop.index) != paginateSale.currentPage }">
						<a href="<c:url value="/product-sale/${loop.index }"/>">${loop.index }</a>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	 <!-- Body wrapper -->
</body>
</html>