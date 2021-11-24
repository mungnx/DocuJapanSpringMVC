<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<head>
<meta charset="UTF-8">
<title>Orders Manager</title>

</head>
<body>
<div class="page-container">	
<div class="left-content">
 <div class="mother-grid-inner">

                    <jsp:include page="../header.jsp"></jsp:include>
<div class="inner-block">
<div class="pro-head" >
			<h2> Oder Manager</h2>
			</div>
		<a href="<c:url value="/admin/product-detail"/>" type="button" class="btn btn-primary" >Add New</a>  

<div class="work-progres">
<h4>Total: ${oders.size() } Items</h4><br/>
        <table class="table table-striped table-bordered table-sm table-hover " id="table-list">
            <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Customer Name</th>
                    <th>Address</th>
                    <th>Phone</th>                
           		    <th>Quantity</th>
                    <th>Total</th>
                    <th>Oder Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${oders }"  >
                <tr>
                <td>${item.id}</td>
                  <td>${item.username }</td>
                  <td>${item.address }</td>
                  <td>${item.phone }</td>
                  <td>${item.quanty }</td>
                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${item.total }" /> ¥</td>
                  <td>${item.created_at }</td>
   				 <td><a href="<c:url value="/admin/invoice-manager/${item.id } "/>">Detail</a>|
  				 <a href="<c:url value="/admin/del-oder/${item.id } "/>" onclick="return confirm('Delete product?')">Delete</a>
  				 </td>
                </tr>
				 </c:forEach>
		
            </tbody>

        </table>
         
			</div>
    </div>
    
     <jsp:include page="../footer.jsp"></jsp:include>
    </div>
    <jsp:include page="../navigation.jsp"></jsp:include>
    
    </div>  
    </div>	 
</body>
</html>