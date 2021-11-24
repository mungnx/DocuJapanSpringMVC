<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<meta charset="UTF-8" >
<title>Slide Manager</title>
<body>
        <div class="page-container">	

            <div class="left-content">

                <div class="mother-grid-inner">

                    <jsp:include page="../header.jsp"></jsp:include>

                    <div class="inner-block">
<div class="chit-chat-layer1">
			<div class="pro-head" >
			<h2> Slide Manager</h2>
			</div>
			<div class="form-group col-md-12">
		<form:form  action="/DocuJapan/admin/slide-save" method="POST" enctype="multipart/form-data" modelAttribute="slide" >
		
	<div class="form-group col-md-6">
			<label class="control-label" for="inputFname">Caption<sup>*</sup></label>
			<br/>

			<form:input name="ccaption" type="text" class="form-control" id="inputFname" placeholder="Nhap mo ta danh muc" path="caption" /> 
			<br/>
			<label class="control-label" for="inputFname">Content<sup>*</sup></label><br/>

			<form:input name="ccontent" type="text" class="form-control" id="inputFname" placeholder="Nhap content" path="content" /> 
			<br/>
		    
			<input type="submit" value="Save" class="btn btn-primary" /> 
	 </div>
	 <div class="form-group col-md-6">
		 	<form:hidden path="id" />
			<form:hidden path="img" />
			
			<label for="image">Choose Image</label>
			<form:input path="file" name="file" id="fileToUpload" type="file" />
			
	</div>
	
	</form:form>    
      </div>
     <div class="clearfix"> </div>
     <h3>${status}</h3>
</div>

	 <div class="work-progres">
        <table class="table table-striped table-bordered table-sm table-hover" id="table-list">
            <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Caption</th>
                    <th>Content</th>
                    <th>Image</th>
                    <th>Edit|Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${slides }" varStatus="i">
                <tr>
                 <td>${i.index +1 }</td>
                  <td>${item.caption }</td>
                  <td>${item.content }</td>
                  <td><img width="160" height="80" 
                   src="${pageContext.request.contextPath }/assets/admin/img/${item.img }" alt="${item.img }"></td>
   
  				 <td><a href="<c:url value="/admin/edit-slide/${item.id } "/>">Edit</a>|
  				 <a href="<c:url value="/admin/del-slide/${item.id } "/>" onclick="return confirm('Delete slide?')">Delete</a>
  				 </td>
                </tr>
				 </c:forEach>
            </tbody>
        </table>
    </div>    
		</div>

                    <jsp:include page="../footer.jsp"></jsp:include>

                </div>

            </div>

            <jsp:include page="../navigation.jsp"></jsp:include>

        </div>

    </body>
                   