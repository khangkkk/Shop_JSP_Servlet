<%@page import="my.com.dao.impl.UserDAOImpl"%>
<%@page import="my.com.model.User"%>
<%@page import="my.com.dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/resource/css/login.css"
	rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update account</title>
</head>
<body>
	<%
	String err = "";
	if (request.getAttribute("err") != null) {
		err = (String) request.getAttribute("err");
	}
	String username = request.getParameter("username");
	//UserDAO userDAO = new UserDAOImpl();
	//User user = userDAO.getAcc(username);
	%>

	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="<%=request.getContextPath()%>/resource/images/top-note.png" alt="" />
				<h2>Update account</h2>
				<lable></lable>
			</div>
			<form action="<%=request.getContextPath()%>/editAccount" method="POST">
				<li style="color: red">${mess}</li> Username
				<li><input type="text" class="text" value="${u.username}"
					readonly name="username"><a href="#" class=" icon2 user2"></a></li>Full
				name
				<li><input type="text" value="${u.fullname}"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {
                                           this.value = '${u.fullname}';}"
					name="fullname"><a href="#" class=" icon2 user2"></a></li> Date of
				birth
				<li><input type="date" value="${u.dob}"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {
                                           this.value = '${u.dob}';
                                       }"
					name="dob"><a href="#" class=" icon2 lock2"></a></li> Sex
				<li><input type="text" value="${u.gender}"
					list="exampleList" onfocus="this.value = '';"
					onblur="if (this.value == '') {
                                           this.value = '${u.gender}';
                                       }"
					name="gender"> <datalist id="exampleList">
						<option value="Male">
						<option value="Female">
					</datalist><a href="#" class=" icon2 lock2"></a></li> Email
				<li><input type="text" value="${u.email}"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {
                                           this.value = '${u.email}';}"
					name="email"><a href="#" class=" icon2 lock2"></a></li> Phone
				<li><input type="text" value="${u.phone}"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {
                                           this.value = '${u.phone}';
                                       }"
					name="phone"><a href="#" class=" icon2 lock2"></a></li> Address
				<li><input type="text" value="${u.address}"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {
                                           this.value = '${u.address}';
                                       }"
					name="address"><a href="#" class=" icon2 lock2"></a></li>


				<div class="submit two">
					<input type="submit" value="UPDATE"> <input type="hidden"
						value="${u.idUser}" name="id">
				</div>
				<h5>
					<a href="<%=request.getContextPath()%>/view/home.jsp">Home</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>