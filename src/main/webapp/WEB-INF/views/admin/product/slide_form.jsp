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
<div class="">
			<div class="pro-head" >
			<h2> Slide Manager</h2>
			</div>
			<div class="form-group col-md-12">
			<div class="form-group col-md-6">
		<form:form  action="/DocuJapan/admin/slide-save" method="POST" enctype="multipart/form-data" modelAttribute="slide" >
		
	
			<label class="control-label" for="inputFname">Caption<sup>*</sup></label>
			<br/>

			<form:input name="ccaption" type="text" class="form-control" id="inputCaption" placeholder="Nhap mo ta danh muc" path="caption" /> 
			<br/>
			<label class="control-label" for="inputFname">Content<sup>*</sup></label><br/>

			<form:input name="ccontent" type="text" class="form-control" id="inputContent" placeholder="Nhap content" path="content" /> 
			<br/><br/>
			<form:hidden path="id" />
			<form:hidden path="img" />
	
			<label for="image">Choose Image</label>
			<form:input path="file" name="file" id="fileToUpload" type="file" />
			<br/>
			<input id="reset" type="reset" class="btn btn-primary" value="Reset"/> 
			<input  type="submit" value=" Save " class="btn btn-primary" />  		
		</form:form>  	
			
		 </div>
		 
		<div class="col-md-6">	
		<div style="border:2px solid white;height: 250px">
		<div id="image-holder" ></div>
		</div>	
		</div>
      </div>
     
     <div class="clearfix"> </div>
     <h3>${status}</h3>
</div>

	 <div class="work-progres">
        <table class="table table-striped table-bordered table-sm table-hover" id="table-list">
            <thead class="table-dark">
                <tr>
                    <th style="text-align:center">No</th>
                    <th style="text-align:center">Caption</th>
                    <th style="text-align:center">Content</th>
                    <th style="text-align:center">Image</th>
                    <th style="text-align:center">Edit|Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${slides }" varStatus="i">
                <tr>
                 <td style="text-align:center">${i.index +1 }</td>
                  <td>${item.caption }</td>
                  <td>${item.content }</td>
                  <td style="text-align:center"><img width="160" height="80" 
                   src="${pageContext.request.contextPath }/assets/admin/img/${item.img }" alt="${item.img }"></td>
   
  				 <td style="text-align:center"><a href="<c:url value="/admin/edit-slide/${item.id } "/>">Edit</a>|
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
                   