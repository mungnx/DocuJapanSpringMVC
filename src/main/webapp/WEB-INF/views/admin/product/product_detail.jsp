<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>Product Detail</title>
<body>

<div class="page-container">	

            <div class="left-content">

                <div class="mother-grid-inner">

                    <jsp:include page="../header.jsp"></jsp:include>
	<div class="inner-block">
			<div class="pro-head">
				<h2>Add|Edit Product</h2>

			</div>
			<h4>${addstatus}</h4>
			<form:form action="/DocuJapan/admin/product-save" method="POST"
				modelAttribute="product">
				<form:hidden path="id_product" />
				<div class="form-row">
					<div class="form-group col-md-4">
						<label class="control-label" for="inputFname">Product Name<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product name input here" path="name" />
					<br/>
						<label class="control-label" for="inputFname">Category<sup>*</sup></label>
						<form:select path="id_category" class="form-control">
							<option value="-1">Select a type</option>
							<c:forEach var="c" items="${categories}">
								<option value="${c.id}"
									${product.id_category == c.id ? 'selected=""' : ''}>${c.name}</option>
							</c:forEach>
						</form:select>
							<br/>
							
						<label class="control-label" for="inputFname">Price<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Price input here" path="price" />
							<br/>
						<label class="control-label" for="inputFname">Product Sale</label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product sale input here" path="sale" />
						<br/>	
						<label class="control-label" for="inputFname">Size<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product size(L,M,S)" path="size" />
							<br/>
						<label class="control-label" for="inputFname">New Product :  </label>
						
						 Yes <form:radiobutton path="new_product" value="true"/>  
        				 No <form:radiobutton path="new_product" value="false"/>
        				 <br/>
						<label class="control-label" for="inputFname"> HighLight :  </label>
						
						Yes <form:radiobutton path="highlight" value="true" />
						No <form:radiobutton path="highlight" value="false" />		
						<br/>
						
						<form:hidden  path="created_at" />
						
						<form:hidden path="updated_at" />
						
						<form:hidden path="img"/>
									
						<label class="control-label" for="inputFname">Image<sup>*</sup>
						</label>
						
						<img width="80" height="80"  src="<c:url value="/assets/user/img/${product.img }"/>" alt="${product.img }">
						</div>			
						
					</div>

					<div class="form-group col-md-8">

						<label class="control-label" for="inputFname">Detail<sup>*</sup></label>

						<form:textarea name="ccaption" type="text" class="form-control" rows="13"
							id="inputFname" placeholder="Product detail" path="detail" /><br/>
						<label class="control-label" for="inputFname">Short introduction<sup>*</sup></label>
						<form:textarea name="cname" type="text" class="form-control" rows="7"
							id="inputFname" placeholder="Product introduction input here"
							path="title" />
							<hr/>
						
						
					<input type="submit" value="Save Product" class="btn btn-primary" />
				</div>
			</form:form>
			<div class="clearfix"></div>
		</div>
	<jsp:include page="../footer.jsp"></jsp:include>

                </div>

            </div>

            <jsp:include page="../navigation.jsp"></jsp:include>

        </div>
</body>