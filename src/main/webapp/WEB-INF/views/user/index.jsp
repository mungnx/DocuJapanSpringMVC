<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
    </head>
 
    <body>

        <div class="container">
         
             <jsp:include page="header.jsp"></jsp:include>
            

                <div class="row">               
      
                     <jsp:include page="category.jsp"></jsp:include>
                    
                    <jsp:include page="content.jsp"></jsp:include>
					
					</div>
                    
					<jsp:include page="footer.jsp"></jsp:include>
            
</div>
    </body>
</html>

