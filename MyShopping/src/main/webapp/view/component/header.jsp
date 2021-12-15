<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
</head>
<body>

	<%
	String username = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("username")) {
		username = cookie.getValue();
			}
		}
	}
	if (username != null) {
	%>
	<div id="head-link">
		<div id='menungang'>
			<ul>
				<li class='last'><a
					href="<%=request.getContextPath()%>/view/home.jsp"><span>Home</span></a></li>
				<li class='last'><a
					href="<%=request.getContextPath()%>/view/productList.jsp"><span>Product</span></a></li>
				<li class='last'><a href="#"><span>Cart</span></a></li>
				<li class='last'><a
					href="<%=request.getContextPath()%>/view/search_page.jsp"><span>Search</span></a></li>
				<%
				if (username.equals("test")) {
				%>
				<li class='last'><a href="listpro"><span>Manage
							Product</span></a></li>
				<%
				}
				%>
				<li class='last' style="float: right;"><a
					href="<%=request.getContextPath()%>/logout"><span>Logout</span></a></li>
				<li class='last' style="float: right;"><a
					href="<%=request.getContextPath()%>/editAccount?username=<%=username%>"><span><%=username%></span>
				</a></li>
			</ul>
		</div>
	</div>
	<%
	} else {
	%>
	<div id="head-link">
		<div id='menungang'>
			<ul>
				<li class='last'><a
					href="<%=request.getContextPath()%>/view/home.jsp"><span>Home</span></a></li>
				<li class='last'><a
					href="<%=request.getContextPath()%>/view/productList.jsp"><span>Product</span></a></li>
				<li class='last'><a
					href="<%=request.getContextPath()%>/view/search_page.jsp"><span>Search</span></a></li>
				<li class='last' style="float: right;"><a
					href="<%=request.getContextPath()%>/view/register.jsp"><span>Register</span></a></li>
				<li class='last' style="float: right;"><a
					href="<%=request.getContextPath()%>/view/login.jsp"><span>Login</span></a></li>
			</ul>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>
