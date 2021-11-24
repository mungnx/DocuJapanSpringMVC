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

	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>商品</th>
                  <th>商品名</th>
                  <th>単価</th>
                  <th>数量</th>
                  <th>編集 </th>
                  <th>削除</th>
                  <th>お会計</th>
				</tr>
              </thead>
              <tbody>
              
              <c:forEach var="item" items="${Cart }">
                <tr>
                  <td><img width="100" src="<c:url value="/assets/user/img/${item.value.product.img}"/>" alt=""></td>
                  <td>${item.value.product.name }</td>
   
            		<td><fmt:formatNumber type="number" groupingUsed="true" value="${item.value.product.price }" /> ¥
            		<p class="m-0 text-muted">
					Sale: <fmt:formatNumber type="number" groupingUsed="true" value="${item.value.product.sale}" /> ¥</p>
            		</td>
                  <td>
					<input type="number" min="1" max="5" class="span1" style="max-width:34px" placeholder="1" id="quanty-cart-${item.key }" size="16" type="text" value="${item.value.quanty }">
				  </td>
				  <td>
					<button data-id="${item.key }" class="btn btn-mini btn-danger edit-cart" >
					<span class="icon-edit"></span>
					</button>
				</td>
				<td>
					<a href="<c:url value="/DeleteCart/${item.key } "/>" class="btn btn-mini btn-danger" type="button"><span class="icon-remove"></span></a>
				</td>
                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${item.value.totalPrice }" /> ¥</td>
                </tr>
				 </c:forEach>
				</tbody>
            </table><br/>
		
	<a href="<c:url value="/trang-chu"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> ショッピング続き </a>
	<a href="<c:url value="/check-out"/>" class="shopBtn btn-large pull-right">進みます <span class="icon-arrow-right"></span></a>

</div>
</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
<script>
$(".edit-cart").on("click",function(){
	var id=$(this).data("id");
	var quanty=$("#quanty-cart-"+id).val();
	window.location="EditCart/"+id+"/"+quanty;
});
</script>
</div>
</body>