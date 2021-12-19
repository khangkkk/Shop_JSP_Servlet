<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/styleAdmin.css" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product List</title>
</head>
<body>
	<div class="navbar">
		<div class="dropdown" style="float: left;">
			<button class="dropbtn">
				<a href="<%=request.getContextPath()%>/view/homeA.jsp">Admin Management</a>
			</button>
		</div>
		<div class="dropdown" style="float: right;">
			<button class="dropbtn">
				<a href="<%=request.getContextPath()%>/logout">Logout</a>
			</button>
		</div>
	</div>

	<div class="main">
		<div class="content">
			<div class="right-content">
				<h1>Product</h1>
			</div>
			<div class="right-content">
				<img src="<%=request.getContextPath()%>/resource/images/plus.png" alt=""
					style="width: 12px; height: 12px;"><a href="http://">Add
					product</a>
			</div>
			<div class="container">
				<div class="wrapper">
					<div class="title">
						<span>Product List</span>
					</div>
					<form action="#">
						<table>
							<tr>
								<th>ID</th>
								<th>Category</th>
								<th>Name of product</th>
								<th>Image</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Manufacturer</th>
								<th>Information</th>
								<th>Action</th>
							</tr>
							<c:forEach items="${lstP}" var="p">
								<tr>
									<th>${p.id_pro}</th>
									<th>${p.name_cat}</th>
									<th>${p.name_pro}</th>
									<th><img
                                    src="<%=request.getContextPath()%>/resource/sanpham/${p.images}" width=" 100px"
                                    height="100px" /></th>
									<th>${p.quantity}</th>
									<th>${p.price}</th>
									<th>${p.supplier}</th>
									<th>${p.infor}</th>
									<td><i class="fa fa-edit" aria-hidden="true"></i> <a
										href="#"> Edit</a>
									<i class="fa fa-trash" aria-hidden="true"></i> <a
										href="<%=request.getContextPath()%>/deleteProduct?id=${p.id_pro}" onclick="return deleteProduct();"> Delete</a></td>
								</tr>
							</c:forEach>
						</table>
						<nav>
							<ul class="pagination" style="padding-top: 20px;">
								<c:if test="${check == 0}">
									<div class="pagination">
										<c:if test="${tag == 1}">
											<li class="page-item"><a class="page-link"
												href="<%=request.getContextPath()%>/viewProductList?page=1">&laquo;Pre</a>
											</li>
										</c:if>
										<c:if test="${tag != 1}">
											<li class="page-item"><a class="page-link"
												href="<%=request.getContextPath()%>/viewProductList?page=${tag-1}">&laquo;Pre</a>
											</li>
										</c:if>
										<c:forEach begin="1" end="${total}" var="i">
											<li class="page-item"><a class="page-link"
												href="<%=request.getContextPath()%>/viewProductList?page=${i}"
												class="${tag == i? "active":""}">${i}</a></li>
										</c:forEach>
										<c:if test="${tag != total}">
											<li class="page-item"><a class="page-link"
												href="<%=request.getContextPath()%>/viewProductList?page=${tag+1}">Next
													&raquo;</a></li>
										</c:if>
										<c:if test="${tag == total}">
											<li class="page-item"><a class="page-link"
												href="<%=request.getContextPath()%>/viewProductList?page=${total}">Next
													&raquo;</a>
										</c:if>
									</div>
								</c:if>
							</ul>
						</nav>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="btnhome">
		<img src="<%=request.getContextPath()%>/resource/images/home.png" alt="" style="width: 12px; height: 12px;"><a
			href="<%=request.getContextPath()%>/view/homeA.jsp">Home</a>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resource/js/myJS.js"></script>
</body>
</html>