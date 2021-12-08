<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Shoppy an Admin Panel Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="<c:url value="/assets/admin/js/skycons.js"/>"></script>
<!--//skycons-icons-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="<c:url value="/assets/admin/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="<c:url value="/assets/admin/css/style.css"/>" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="<c:url value="/assets/admin/js/jquery-2.1.1.min.js"/>"></script> 
<script src="<c:url value="/assets/admin/js/dtsel.js"/>"></script> 
<link href="<c:url value="/assets/admin/css/dtsel.css"/>" rel="stylesheet" type="text/css"> 
<!--icons-css-->
<link href="<c:url value="/assets/admin/css/font-awesome.css"/>" rel="stylesheet"> 
<link rel="shortcut icon" href="<c:url value="/assets/user/ico/favicon.ico" />">
<style type="text/css">.thumb-image{float:left;width:100%;height:250px;padding:5px;}</style>
</head>
    <body>

        <div class="header-main">
            <div class="header-left">
							<div class="logo-name">
									 <a href="<c:url value="/admin"/>"> <h1>DocuJapan</h1>  </a> 								
							</div>
							<div class="clearfix"> </div>
						 </div>
            <div class="header-left">
                
                <!--notification menu end -->
                <div class="profile_details">		
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">	
                                    <span class="prfil-img"><img src="<c:url value="/assets/admin/img/p2.png"/>"> </span> 
                                    <div class="user-name">
                                        <p>${LoginAdmin.userName}</p>
                                        <span>${LoginAdmin.email}</span>
                                    </div>
                                    <i class="fa fa-angle-down lnr"></i>
                                    <i class="fa fa-angle-up lnr"></i>
                                    <div class="clearfix"></div>	
                                </div>	
                            </a>
                            
                            <ul class="dropdown-menu drp-mnu">
                            
                                <li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
                                <li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
                                <li> <a href="<c:url value="/admin/logout"/>">
                                <i class="fa fa-sign-out"></i> Logout</a> </li>
                        
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"> </div>				
            </div>
            <div class="clearfix"> </div>	
        </div>
        <!--heder end here-->
        <!-- script-for sticky-nav -->
        <script>
            $(document).ready(function () {
                var navoffeset = $(".header-main").offset().top;
                $(window).scroll(function () {
                    var scrollpos = $(window).scrollTop();
                    if (scrollpos >= navoffeset) {
                        $(".header-main").addClass("fixed");
                    } else {
                        $(".header-main").removeClass("fixed");
                    }
                });

            });
        </script>

    </body>
</html>
