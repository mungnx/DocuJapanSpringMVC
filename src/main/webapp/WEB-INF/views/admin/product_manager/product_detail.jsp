<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>Product Detail</title>
<body>
	<div class="inner-block">
			<div class="pro-head">
				<h2>Add|Edit Product</h2>

			</div>
			<h4>${addstatus}</h4>
			<form:form action="/DocuJapan/admin/product-save" method="POST"
				modelAttribute="product">
				<form:hidden path="id_product" />
				<div class="form-row">
					<div class="form-group col-md-6">
						<label class="control-label" for="inputFname">Product Name<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product name input here" path="name" />
					
						<label class="control-label" for="inputFname">Category<sup>*</sup></label>
						<form:select path="id_category" class="form-control">
							<option value="-1">Select a type</option>
							<c:forEach var="c" items="${categories}">
								<option value="${c.id}"
									${product.id_category == c.id ? 'selected=""' : ''}>${c.name}</option>
							</c:forEach>
						</form:select>
							
						<label class="control-label" for="inputFname">Price<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Price input here" path="price" />
						<label class="control-label" for="inputFname">Product Sale<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product sale input here" path="sale" />
							
						<label class="control-label" for="inputFname">Size<sup>*</sup></label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product size(L,M,S)" path="size" />
							<hr/>
						<label class="control-label" for="inputFname">New Product<sup>*</sup></label>
						
						 Yes <form:radiobutton path="new_product" value="true"/>  
        				 No <form:radiobutton path="new_product" value="false"/>
        				 
						<label class="control-label" for="inputFname"> | HighLight<sup>*</sup></label>
						
						Yes <form:radiobutton path="highlight" value="true" />
						No <form:radiobutton path="highlight" value="false" />					
						
					</div>

					<div class="form-group col-md-6">

						<label class="control-label" for="inputFname">Detail<sup>*</sup></label>

						<form:textarea name="ccaption" type="text" class="form-control"
							id="inputFname" placeholder="Product detail" path="detail" />
						<label class="control-label" for="inputFname">Short introduction<sup>*</sup></label>
						<form:textarea name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product introduction input here"
							path="title" />
							<label class="control-label" for="inputFname">Created at<sup>*</sup>
						</label>
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product create at 2020-04-09(YYYY-MM-DD)" path="created_at" />
							<label class="control-label" for="inputFname">Updated at<sup>*</sup>
						</label>
						<form:hidden path="updated_at" />
						
						<label class="control-label" for="inputFname">Image<sup>*</sup>
						</label>
						
						<form:input name="cname" type="text" class="form-control"
							id="inputFname" placeholder="Product image URL(.JPG, .PNG)" path="img" />
						<img width="80" height="80"  src="<c:url value="/assets/user/img/${product.img }"/>" alt="${product.img }">
						</div>
						
					<input type="submit" value="Save Product" class="btn btn-primary" />
				</div>
			</form:form>
			<div class="clearfix"></div>
		</div>
	
</body>