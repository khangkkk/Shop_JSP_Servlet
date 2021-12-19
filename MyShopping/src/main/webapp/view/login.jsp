<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/resource/css/login.css"
	rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<%
	String err = "";
	if (request.getAttribute("err") != null) {
		err = (String) request.getAttribute("err");
	}
	%>
	<div class="login-01">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head">
				<img
					src="<%=request.getContextPath()%>/resource/images/top-lock.png"
					alt="" />
				<h1>LOGIN</h1>

				<span></span>
			</div>
			<form action="<%=request.getContextPath()%>/login" method="POST">
				<%
				String mess = "";
				if (request.getAttribute("mess") != null) {
					mess = (String) request.getAttribute("mess");
				%>
				<li style="color: red"><%=mess%></li>
				<%
				}
				%>
				<li style="color: red"><%=err%></li> Username
				<li><input type="text" class="text" value="" name="username"
					pattern="[a-zA-Z0-9]{4,24}" required><a href="#"
					class=" icon user"></a></li> Password
				<li><input type="password" value="" name="password" required
					pattern="[.]{4,24}"><a href="#" class=" icon lock"></a></li>
				<div class="p-container">
					<input type="checkbox" name="remember" checked><i>Remember
					me</i>
					<h6>
						<a href="#">Forgot your password?</a>
					</h6>
					<div class="clear"></div>
				</div>
				<div class="submit">
					<input type="submit" value="SIGN IN">
				</div>

				<h5>
					You have no account?<a
						href="<%=request.getContextPath()%>/view/register.jsp">
						Register now</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>
