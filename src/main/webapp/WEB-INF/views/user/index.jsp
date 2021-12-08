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
		<div>
			<jsp:include page="header.jsp"></jsp:include>


			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">
					<div class="carousel-inner">
						<c:forEach var="item" items="${slides }" varStatus="index">
							<c:if test="${index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${not index.first }">
								<div class="item">
							</c:if>
							<img
								src="${pageContext.request.contextPath }/assets/admin/img/${item.img }"
								alt="${item.img }">
							<div class="carousel-caption">
								<h4 class="d-none d-md-block">${item.caption }</h4>
								<p>
									<span>${item.content}</span>
								</p>
							</div>
					</div>
					</c:forEach>
				</div>
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next">&rsaquo;</a>

			</div>
		</div>
		<div class="row">

			<jsp:include page="category.jsp"></jsp:include>
			<jsp:include page="content.jsp"></jsp:include>


		</div>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>

