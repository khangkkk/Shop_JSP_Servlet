<%@page import="my.com.dao.impl.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="my.com.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.com.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/menu.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/product.css" />
</head>
<body>
	<div id="main">
		<div id="head">
			<img src="<%=request.getContextPath()%>/resource/images/load2.png" width="1057px" height="200px" />
		</div>

		<jsp:include page="/view/component/header.jsp"></jsp:include>

		<div id="content">
			<div id="left"><jsp:include page="/view/component/search_menu.jsp"></jsp:include></div>
			<div id="right">
				<%
				ProductDAO productDAO = new ProductDAOImpl();
				List<Product> list = productDAO.getAllProductOrByCategory("all", -1);
				String name_pro = "";
				String name_cat = "";
				if (request.getParameter("name_cat") != null && request.getParameter("name_pro") != null) {
					name_cat = request.getParameter("name_cat");
					name_pro = request.getParameter("name_pro");
				}
				NumberFormat nf = NumberFormat.getInstance();
				nf.setMinimumFractionDigits(0);
				%>
				<%
				String err = "";
				if (request.getAttribute("err") != null) {
					err = (String) request.getAttribute("err");
				%>
				<h3><%=err%></h3>
				<%
				}
				%>

				<%
				if (productDAO.searchProduct(name_pro, name_cat).size() == 0 && err == "") {
				%>
				<h3>No matching products found!</h3>
				<%
				}
				%>
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">

						<%
						if (name_cat != null || name_pro != null) {
							for (Product p : productDAO.searchProduct(name_pro, name_cat)) {
						%>

						<li class="preorder"><span class="tagimg "> </span> <a
							href="<%=request.getContextPath()%>/view/detailProduct.jsp?id_pro=<%=p.getId_pro()%>"> <img
								src="<%=request.getContextPath()%>/resource/sanpham/<%=p.getImages()%>" width=" 250px" height="250px" />
								<h3><%=p.getName_pro()%></h3>
								<h4>
									Price:
									<%=nf.format(p.getPrice())%>
									VNĐ
								</h4> <span class="textkm">Sale <strong>0₫</strong>
							</span>
								<p class="info">
									<span>Manufacturer: <%=p.getSupplier()%>
									</span> <span>Price: <%=nf.format(p.getPrice())%> VNĐ
									</span> <span>Information: <%=p.getInfor()%>
								</p>
						</a></li>

						<%
						}
						} else {
						%>
						<h3>Please enter search information!</h3>
						<%
						}
						%>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="/view/component/footer.jsp"></jsp:include></div>
	</div>
</body>
</html>
