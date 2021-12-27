<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resource/css/styleHomeA.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home Admin</title>
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
		<div class="nav">
			<div class="left-content">
				<div class="formP">
					<form action="#">
						<h1>Product</h1>
						<h3>
							<a href="<%=request.getContextPath()%>/addProduct"><img
								src="<%=request.getContextPath()%>/resource/images/plus.png" alt="" style="width: 14px; height: 14px" />Add
								Product</a>
						</h3>
						<br />
						<h3 class="more-bot">
							<a href="<%=request.getContextPath()%>/viewProductList"><img
								src="<%=request.getContextPath()%>/resource/images/detail.png" alt=""
								style="width: 14px; height: 14px" />View
								Product List</a>
						</h3>
					</form>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="right-content">
				<div class="formU">
					<form action="#">
						<h1>User</h1>
						<br />
						<h3 class="more-bot2">
							<a href="<%=request.getContextPath()%>/viewUserList"><img
								src="<%=request.getContextPath()%>/resource/images/detail.png" alt=""
								style="width: 14px; height: 14px" />View
								User List</a>
						</h3>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
