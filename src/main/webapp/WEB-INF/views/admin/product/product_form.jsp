<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<head>
<meta charset="UTF-8">
<title>Products Manager</title>

<style type="text/css">
#pagination {
	display: flex;
	justify-content: center;
}

#pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

#pagination a.active {
	background-color: #f89406;
	color: white;
	border: 1px solid #f89406;
	
}

#pagination a:hover:not (.active ) {
	background-color: #ddd;
}
</style>
</head>
<body>
<div class="page-container">	
<div class="left-content">
 <div class="mother-grid-inner">

                    <jsp:include page="../header.jsp"></jsp:include>
<div class="inner-block">
<div class="pro-head" >
			<h2> Product Manager</h2>
			</div>
<div class="work-progres">
<a style="text-align:left" href="<c:url value="/admin/product-detail"/>" type="button" class="btn btn-primary" >Add New</a>
<h4 style="text-align:right">Total: ${toltalData } Items</h4>
        <table class="table table-hover table-striped table-bordered table-sm " id="table-list">
            <thead class="table-dark">
                <tr>
                    <th style="text-align:center">Image</th>
                    <th style="text-align:center">Product Name</th>
                    <th style="text-align:center">Category</th>
                    <th style="text-align:center">Price</th>
                    <th style="text-align:center">Sale</th>                
                    <th style="text-align:center">NewArrive</th>
                    <th style="text-align:center">HighLight</th>
                    <th style="text-align:center">Created</th>
                    <th style="text-align:center">Updated</th>
                    
                    <th style="text-align:center">Edit|Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${allProductsPaginate }" >
                <tr>
                <td><img width="80" height="80"  src="<c:url value="/assets/user/img/${item.img }"/>" alt="${item.id_product }"></td>
                  <td>${item.name }</td>
                  <c:forEach var="c" items="${categories }" >
                  <c:if test="${item.id_category==c.id }">
                  <td style="text-align:center">${c.name} </td>
                  </c:if>
                  </c:forEach>
                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${item.price }" /> ¥</td>
                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${item.sale }" /> ¥</td>
                  <td style="text-align:center">${item.new_product }</td>
                  <td style="text-align:center">${item.highlight }</td>
                  <td style="text-align:center">${item.created_at }</td>
                  <td style="text-align:center">${item.updated_at }</td>
                  
   
  				 <td style="text-align:center"><a href="<c:url value="/admin/product-detail/${item.id_product } "/>">Edit</a>|
  				 <a href="<c:url value="/admin/del-product/${item.id_product } "/>" onclick="return confirm('Delete product?')">Delete</a>
  				 </td>
                </tr>
				 </c:forEach>
		
            </tbody>

        </table>
         
       <div id="pagination">
				<c:forEach var="item" begin="1" end="${ paginateAll.toltalPage}" varStatus="loop">

					<c:if test="${(loop.index)== paginateAll.currentPage }">
						<a href="<c:url value="/admin/product-manager/${loop.index }"/>"
							class="active">${loop.index }</a>
					</c:if>
					<c:if test="${(loop.index) != paginateAll.currentPage }">
						<a href="<c:url value="/admin/product-manager/${loop.index }"/>">${loop.index }</a>
					</c:if>
				</c:forEach>
			</div>
			</div>
    </div>
    
     <jsp:include page="../footer.jsp"></jsp:include>
    </div>
    <jsp:include page="../navigation.jsp"></jsp:include>
    
    </div>  
    </div>	 
</body>
</html>