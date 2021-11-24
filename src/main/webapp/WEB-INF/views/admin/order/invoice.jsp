<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<head>
<meta charset="UTF-8">
<title>Order Details</title>

</head>
<body>
<div class="page-container">	
<div class="left-content">
 <div class="mother-grid-inner">

                    <jsp:include page="../header.jsp"></jsp:include>
						<div class="inner-block">
							<!-- Row start -->
		 <div class="pro-head" >
			<h2> Order Details</h2>
			</div>
		 
							<c:forEach var="item" items="${invoice }"  >						
									
									<div class="form-group col-md-9">
									<br/>
									
										<h4>Name: <strong>${item.username}</strong></h4>
										<br/>
										<h4>Phone: ${item.phone}</h4>
										<br/>
										<h4>Address: 
											${item.address}
										</h4>
										<br/>
										<h4>Note: 
											${item.note}
										</h4>
									<br/>
								
								</div>
								 <div class="form-group col-md-3">
							<br/>
								
											<div>Order Date: <strong><fmt:formatDate type="date" value="${item.created_at }" /></strong></div><br/>
											<br/><hr/>
											<div>Total: <strong><fmt:formatNumber type="number" groupingUsed="true" value="${item.total }" /> ¥</strong></div>
											</div>
										</c:forEach>
							 <div class="work-progres">
        							<table class="table table-striped table-bordered table-sm table-hover">
											<thead>
												<tr>
													<th>Product Name</th>
													<th>Price</th>
													<th>Quantity</th>
													<th>Sub Total</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="item" items="${invoices }"  >
												<tr>
													<td>
														${item.productName }
														<p class="m-0 text-muted">
														size: ${item.size}
														</p>
													</td>
													<td><fmt:formatNumber type="number" groupingUsed="true" value="${item.price }" /> ¥
													<p class="m-0 text-muted">
														sale: <fmt:formatNumber type="number" groupingUsed="true" value="${item.sale}" /> ¥
														</p>
													</td>
													<td>${item.quanty }</td>
													<td><fmt:formatNumber type="number" groupingUsed="true" value="${item.total }" /> ¥</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
							
							<!-- Row end -->
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
    </div>
    <jsp:include page="../navigation.jsp"></jsp:include>
    
    </div>  
    </div>	 
</body>
</html>