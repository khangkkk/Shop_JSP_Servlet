<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resource/css/login.css"
	rel='stylesheet' type='text/css' />
<title>Register</title>
</head>
<body>
	<%
	String err = "";
	if (request.getAttribute("err") != null) {
		err = (String) request.getAttribute("err");
	}
	%>
	<!--/start-login-two-->
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img
					src="<%=request.getContextPath()%>/resource/images/top-note.png"
					alt="" />
				<h2>Register</h2>
				<label></label>
			</div>
			<form action="<%=request.getContextPath()%>/registerAccount"
				method="POST">
				<li style="color: red"><%=err%></li> Username
				<li><input type="text" class="text" value="${uname}" name="username"
					required><a href="#" class=" icon2 user2"></a></li> Password
				<li><input type="password" value="" name="password" required><a
					href="#" class=" icon2 lock2"></a></li> Re-Password
				<li><input type="password" value="" name="password" required><a
					href="#" class=" icon2 lock2"></a></li>

				<div class="p-container">
					<label class=""><input type="checkbox" name="checkbox"><i></i>I
						agree to <a href="#">The terms of service</a></label>
				</div>
				<div class="submit two">
					<input type="submit" value="Register">
				</div>
				<h5>
					<a href="<%=request.getContextPath()%>/view/login.jsp">Login</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>
