<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<style>
 .product-content{
 	overflow-x: hidden;
 }
</style>
<body>
 <div class="container">
         
             <jsp:include page="../header.jsp"></jsp:include>
            
	<div class="row product-content">
<jsp:include page="../category.jsp"></jsp:include>
	<div class="span9">
    <ul class="breadcrumb">
    <li><a href="<c:url value="/trang-chu"/>">トップ</a> <span class="divider">/</span></li>
    <li><a href="<c:url value="/san-pham/${productById.id_category}"/>">商品ページ</a> <span class="divider">/</span></li>
    <li class="active">詳細</li>
    </ul>	
	<div class="well well-small">
	<div class="row-fluid">
		<div class="span5">
			<div id="myCarousel" class="carousel slide cntr">
                <div class="carousel-inner">
                  <div class="item active" style="height: 300px">
                  <a href="/DocuJapan/assets/user/img/${productById.img}">
                   <img class=""  src="<c:url value="/assets/user/img/${productById.img}"/>" alt="" style="width:100%"></a>
                  </div>
                  <c:forEach var="item" items="${images }" >
                  <div class="item" style="height: 300px" >
                     <a href="/DocuJapan/assets/user/img/${item.img}">
                   <img class="" style="height: auto;width: auto" src="<c:url value="/assets/user/img/${item.img }"/>" alt="" style="width:100%"></a>
                  </div>
                  </c:forEach>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>
			</div>
			<div class="span7">
				<h3>商品名：　${productById.name }</h3>
				<hr class="soft"/>
				
				<form class="form-horizontal qtyFrm" method="get" action="<c:url value="/AddCart/${productById.id_product }"/>">
				  <div class="control-group">
					<label class="control-label"><strong>Price: <fmt:formatNumber type="number" groupingUsed="true" value="${productById.price}" /> ¥　</strong></label>
					<br/>
					
					<br/>
					
					<c:if test="${productById.sale>0 }">
										<strong> Sale: <fmt:formatNumber type="number"
													groupingUsed="true" value="${productById.sale}" /> ¥
										</strong>
										</c:if>
										<c:if test="${productById.sale==0 }">
										<p><br/></p>
										
										</c:if>
														
				  </div>
				
				  <p>${productById.title}</p>
				  <button type="submit" class="shopBtn"><span class=" icon-shopping-cart"></span> カートに入れる</button>
				</form>
			</div>
			</div>
			
				<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">詳細</a></li>
              <li class=""><a href="#profile" data-toggle="tab">他の商品 </a></li>
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
						<div class="tab-pane fade active in" id="home">
							<h4>商品のインフォメーション</h4>
							<table class="table table-striped">
								<tbody>

									<tr class="techSpecRow">
										<td class="techSpecTD1">サイズ:</td>
										<td class="techSpecTD2">${productById.size}</td>
									</tr>
									<tr class="techSpecRow">
										<td class="techSpecTD1">製造メーカー:</td>
										<td class="techSpecTD2">日本</td>
									</tr>
									<tr class="techSpecRow">
										<td class="techSpecTD1">材料:</td>
										<td class="techSpecTD2">未定</td>
									</tr>
								</tbody>
							</table>
							<hr class="softn clr" />
							<p>${productById.detail}</p>
							<div class="ecommerce-gallery" data-mdb-zoom-effect="true"
								data-mdb-auto-height="true">

								<div class="col-12 mb-1">
									<div class="lightbox">
									 <a href="/DocuJapan/assets/user/img/${productById.img}">
										<img src=<c:url value="/assets/user/img/${productById.img}"/>
											alt="Gallery image 1"
											class="ecommerce-gallery-main-img active w-100" /></a>
									</div>
								</div>
							</div>

						</div>
						<div class="tab-pane fade" id="profile">
						
						 <div class="">		
			<c:set var="countList" value="${(productByCategory).size() }"></c:set>
			<c:if test="${(productByCategory).size() >6}">
				<c:set var="countList" value="6"/>
			</c:if>
			
			<c:forEach var="item" items="${productByCategory }" begin="1" end="${countList }" varStatus="loop">
	
			<div class="row-fluid">	  
			<div class="span2">
			<a href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>">	<img src="<c:url value="/assets/user/img/${item.img }"/>" alt=""></a>
			</div>
			<div class="span6">
				<h5>${item.name } </h5>
				<p>
				${item.title}
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> <fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> ¥</h3>
			<div class="btn-group">
			  <a href="<c:url value="/AddCart/${item.id_product }"/>" class="defaultBtn"><span class=" icon-shopping-cart"></span> カートに入れる</a>
			  <a href="<c:url value="/chi-tiet-san-pham/${item.id_product}"/>" class="shopBtn">見る</a>
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
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</div> <!-- Body wrapper -->
</body>