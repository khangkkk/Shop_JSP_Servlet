<%@page import="my.com.dao.impl.CategoryDAOImpl"%>
<%@page import="my.com.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.com.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search menu</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/category.css" />

</head>
<body>
	<%
	CategoryDAO categoryDAO = new CategoryDAOImpl();
	List<Category> list = categoryDAO.getAllCat();
	String err = "";
	%>
	<div class="container">
		<nav>
			<ul class="mcd-menu">
				<li>
					<form accept-charset="utf-8" method="POST" action="<%=request.getContextPath()%>/search"
						name="SearchServlet">
						<p>
							<label for="tensp">Product name</label> <br> <input
								accept-charset="utf-8" type="text" name="name_pro"
								style="width: 97%">
						</p>
						<p>
							<label for="theloai">Category</label> <br> <select
								accept-charset="utf-8" name="name_cat" style="width: 100%">
								<option value="" selected="selected">--Select category--</option>
								<%
								for (Category c : list) {
								%>
								<option accept-charset="utf-8" value="<%=c.getName_cat()%>"><%=c.getName_cat()%></option>
								<%
								}
								%>
							</select>
						</p>
						<input type="submit" value="Search" name="timKiem">
					</form>
				</li>
				<li style="color: red"><%=err%></li>
			</ul>
		</nav>
	</div>
</body>
</html>
