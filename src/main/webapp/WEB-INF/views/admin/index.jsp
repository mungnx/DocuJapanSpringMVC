<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<html>
<head>
<meta charset="UTF-8">
<title>Panel Manager</title>

    </head>
    <body>

        <div class="page-container">	

            <div class="left-content">

                <div class="mother-grid-inner">

                    <jsp:include page="header.jsp"></jsp:include>

                    <jsp:include page="content.jsp"></jsp:include>

                    <jsp:include page="footer.jsp"></jsp:include>

                </div>

            </div>

            <jsp:include page="navigation.jsp"></jsp:include>

        </div>

    </body>
</html>
