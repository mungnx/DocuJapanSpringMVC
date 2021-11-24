<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<meta charset="UTF-8" >
<title>Category Manager</title>
<body>
<div class="page-container">	

            <div class="left-content">

                <div class="mother-grid-inner">

                    <jsp:include page="../header.jsp"></jsp:include>
<div class="inner-block">
<div class="chit-chat-layer1">
			<div class="pro-head" >
			<h2> Category Manager</h2>
			</div>
			<form:form  action="/DocuJapan/admin/category-save" method="POST" modelAttribute="category" >
			<form:hidden path="id" />
		<div class="form-row">
		 <div class="form-group col-md-6">
			<label class="control-label" for="inputFname">Category Name<sup>*</sup></label>
			<form:input name="cname" type="text" class="form-control" id="inputFname" placeholder="Nhap ten danh muc" path="name"/> 
	
			</div>
	
		 <div class="form-group col-md-6">
			<label class="control-label" for="inputFname">Caption<sup>*</sup></label>

			<form:input name="ccaption" type="text" class="form-control" id="inputFname" placeholder="Nhap mo ta danh muc" path="caption" /> 

			</div>
		
		 <input type="submit" value="Save Category" class="btn btn-primary" />  
	 </div>
	</form:form>       
      
     <div class="clearfix"> </div>
     <h3>${delstatus}</h3>
</div>

	 <div class="work-progres">
        <table class="table table-hover table-bordered " id="table-list">
            <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Category Name</th>
                    <th>Caption</th>
                    <th>Edit|Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${categories }" varStatus="i">
                <tr>
                 <td>${i.index +1 }</td>
                  <td>${item.name }</td>
                  <td>${item.caption }</td>
   
  				 <td><a href="<c:url value="/admin/edit-category/${item.id } "/>">Edit</a>|
  				 <a href="<c:url value="/admin/del-category/${item.id } "/>" onclick="return confirm('Delete category?')">Delete</a>
  				 </td>
                </tr>
				 </c:forEach>
            </tbody>
        </table>
       
    </div>    

		</div>
		<div class="span1"> &nbsp;</div>
		
		 <jsp:include page="../footer.jsp"></jsp:include>

                </div>

            </div>

            <jsp:include page="../navigation.jsp"></jsp:include>

        </div>	
</body>
