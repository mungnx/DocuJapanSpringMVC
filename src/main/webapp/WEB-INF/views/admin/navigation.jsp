
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <body>

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
		        <li><a href="<c:url value="/admin/oder-manager"/>"><i class="fa fa-bar-chart"></i><span>Orders</span></a></li>
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
		<script src="<c:url value="/assets/admin/js/jquery.nicescroll.js"/>"></script>
		<script src="<c:url value="/assets/admin/js/scripts.js"/>"></script>
		<!--//scrolling js-->
<script src="<c:url value="/assets/admin/js/bootstrap.js"/>"> </script>

    </body>

