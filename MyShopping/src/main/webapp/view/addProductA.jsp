<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resource/css/styleAdmin.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Add Product</title>
</head>
<body>
	<div class="navbar">
		<div class="dropdown" style="float: left;">
			<button class="dropbtn">
				<a href="<%=request.getContextPath()%>/view/homeA.jsp">Admin
					Management</a>
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
				<img src="<%=request.getContextPath()%>/resource/images/detail.png"
					alt="" style="width: 12px; height: 12px" /><a
					href="<%=request.getContextPath()%>/viewProductList">View
					product</a>
			</div>
			<div class="container">
				<div class="wrapper">
					<div class="title">
						<span>Add product</span>
					</div>
					<h4 style="padding-left: 5%; color: red;">${mess}</h4>
					<form action="<%=request.getContextPath()%>/addProduct"
						method="POST">
						Category
						<div class="row">
							<select name="categoryP" id="">
								<c:forEach items="${lstCat}" var="c">
									<option value="${c.id_cat}">${c.name_cat}</option>
								</c:forEach>
							</select>
						</div>
						Name of product
						<div class="row">
							<input type="text" name="nameP" placeholder="Enter the name" required/>
						</div>
						Image
						<div class="row">
							<input type="text" name="imageP" />
						</div>
						Quantity
						<div class="row">
							<input type="number" name="quantityP"
								placeholder="Enter the quantity" pattern="[0-9]+" required/>
						</div>
						Price
						<div class="row">
							<input type="number" name="priceP" pattern="[0-9]+" required/>
						</div>
						Manufacturer
						<div class="row">
							<input type="text" name="manufacturerP" required/>
						</div>
						Information
						<div class="row">
							<input type="text" name="inforP" />
						</div>
						<button class="button">Add</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="btnhome">
		<img src="<%=request.getContextPath()%>/resource/images/home.png"
			alt="" style="width: 12px; height: 12px" /><a
			href="<%=request.getContextPath()%>/view/homeA.jsp">Home</a>
	</div>
</body>
</html>
