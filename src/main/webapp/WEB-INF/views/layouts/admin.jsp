<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<title><decorator:title default="Master-layout"></decorator:title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- font awesome styles -->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
<decorator:head/>
</head>
<body>

<div class="page-container">	
   <div class="left-content">
	   <div class="mother-grid-inner">
 <!--header start here-->
	<%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
<!--header end here-->
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
 <decorator:body></decorator:body>
<!--inner block end here-->
<!--copy rights start here-->
<%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
<!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
   <div class="sidebar-menu">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
			      <!--<img id="logo" src="" alt="Logo"/>--> 
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="<c:url value="/admin/"/>"> <i class="fa fa-tachometer"></i><span>Dashboard</span></a></li>
		      		  
		      
		        <li id="menu-academico" ><a href="<c:url value="/admin/#"/>"><i class="fa fa-file-text"></i><span>Pages</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
		          	 <li id="menu-academico-boletim" ><a href="<c:url value="/admin/#"/>">Login</a></li>
		            <li id="menu-academico-avaliacoes" ><a href="<c:url value="/admin/#"/>">Sign Up</a></li>		           
		          </ul>
		        </li>
		         <li><a href="<c:url value="/admin/slide-manager"/>"><i class="fa fa fa-cogs"></i><span>Slides</span></a></li>
		        <li><a href="<c:url value="/admin/product-manager"/>"><i class="fa fa-shopping-cart"></i><span>Products</span></a></li>
		         <li><a href="<c:url value="/admin/category-manager"/>"><i class="fa fa-book nav_icon"></i><span>Categories</span></a></li>
		        <li><a href="#"><i class="fa fa-envelope"></i><span>Mailbox</span><span class="fa fa-angle-right" style="float: right"></span></a>
		        	 <ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="<c:url value="/admin/#"/>">Inbox</a></li>
			            <li id="menu-academico-boletim" ><a href="<c:url value="/admin/#"/>">Compose email</a></li>
		             </ul>
		        </li>
		
		         
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>

<script type="text/javascript">
instance = new dtsel.DTS('input[name="created_at"]',  {
    direction: 'BOTTOM',
    dateFormat: "yyyy-mm-dd",
    showTime: false,
    timeFormat: "HH:MM:SS"
});
</script>
<!--scrolling js
		<script src="<c:url value="/assets/admin/js/jquery.nicescroll.js"/>"></script>-->
		<script src="<c:url value="/assets/admin/js/scripts.js"/>"></script>
		<!--//scrolling js-->
<script src="<c:url value="/assets/admin/js/bootstrap.js"/>"> </script>

</body>