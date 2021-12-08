<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
    </head>
<body>

 <div class="container">
         
             <jsp:include page="../header.jsp"></jsp:include>
            
<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.html">トップ</a> <span class="divider">/</span></li>
		<li class="active">お会計</li>
    </ul>
	<div class="well well-small">
		<h1>お会計 <small class="pull-right"> ${TotalQuantyCart }商品がありま す</small></h1>
	<hr class="soften"/>	

	<table class="table table-striped table-bordered table-sm table-hover">
              <thead>
                <tr>
                  <th style="text-align:center">No</th>
                  <th style="text-align:center">商品</th>
                  <th style="text-align:center">商品名</th>
                  <th style="text-align:center">単価</th>
                  <th style="text-align:center">数量</th>
                  <th style="text-align:center">削除</th>
                  <th style="text-align:center">小計</th>
				</tr>
              </thead>
              <tbody>
             
              <c:forEach var="item" items="${Cart }" varStatus="i">
                <tr>
                <td style="text-align:center">${i.index+1 }</td>
                  <td style="text-align:center"><a href="<c:url value="/chi-tiet-san-pham/${item.value.product.id_product}"/>">
                  <img width="50" src="<c:url value="/assets/user/img/${item.value.product.img}"/>" alt=""></a></td>
                  <td>${item.value.product.name }</td>
   
            		<td><fmt:formatNumber type="number" groupingUsed="true" value="${item.value.product.price }" /> ¥
            		<p class="m-0 text-muted">
					Sale: <fmt:formatNumber type="number" groupingUsed="true" value="${item.value.product.sale}" /> ¥</p>
            		</td>
                  <td style="text-align:center">
					<input data-id="${item.key }" class="edit-cart" type="number" min="1" max="5" class="span1" style="max-width:34px" placeholder="1" id="quanty-cart-${item.key }" size="16" type="text" value="${item.value.quanty }">
				  </td>
				  				<td style="text-align:center">
					<a href="<c:url value="/DeleteCart/${item.key } "/>" class="btn btn-mini btn-danger" type="button" onclick="return confirm('Delete item?')"><span class="icon-remove"></span></a>
				</td>
                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${item.value.totalPrice }" /> ¥</td>
                </tr>
				 </c:forEach>
				
				</tbody>
            </table>
             <h4 style="text-align:right">合計: <span><fmt:formatNumber type="number" groupingUsed="true" value="${TotalPriceCart}"/> ¥</span></h4>
            <hr/>
		
	<a href="<c:url value="/trang-chu"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> ショッピング続き </a>

	<a href="<c:url value="/check-out"/>" class="shopBtn btn-large pull-right">進みます <span class="icon-arrow-right"></span></a>

</div>
</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
<script>
$(".edit-cart").on("change",function(){
	var id=$(this).data("id");
	var quanty=$("#quanty-cart-"+id).val();
	window.location="EditCart/"+id+"/"+quanty;
});
</script>
</div>
</body>