<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/styleAdmin.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Add Product</title>
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
				<img src="<%=request.getContextPath()%>/resource/images/detail.png" alt=""
					style="width: 12px; height: 12px" /><a href="<%=request.getContextPath()%>/viewProductList">View
					product</a>
			</div>
			<div class="container">
				<div class="wrapper">
					<div class="title">
						<span>Add product</span>
					</div>
					<form action="#">
						Category
						<div class="row">
							<select name="cars" id="cars">
								<option value="volvo">Volvo</option>
								<option value="saab">Saab</option>
								<option value="mercedes">Mercedes</option>
								<option value="audi">Audi</option>
							</select>
						</div>
						Name of product
						<div class="row">
							<input type="text" name="cat" placeholder="Enter the name" />
						</div>
						Image
						<div class="row">
							<input type="text" name="cat" />
						</div>
						Quantity
						<div class="row">
							<input type="number" name="cat" placeholder="Enter the quantity" pattern="[0-9]+"/>
						</div>
						Price
						<div class="row">
							<input type="number" name="cat" pattern="[0-9]+"/>
						</div>
						Manufacturer
						<div class="row">
							<input type="text" name="cat" />
						</div>
						Information
						<div class="row">
							<input type="text" name="cat" />
						</div>
						<button class="button">Add</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="btnhome">
		<img src="<%=request.getContextPath()%>/resource/images/home.png" alt="" style="width: 12px; height: 12px" /><a
			href="<%=request.getContextPath()%>/view/homeA.jsp">Home</a>
	</div>
</body>
</html>
