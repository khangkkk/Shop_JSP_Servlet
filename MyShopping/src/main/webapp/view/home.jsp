<%@page import="my.com.dao.impl.ProductDAOImpl"%>
<%@page import="my.com.model.User"%>
<%@page import="javax.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.com.model.Product"%>
<%@page import="my.com.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/menu.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/product.css" />
<title>Home</title>
</head>
<body>
	<div id="main">
		<div id="head">
			<img src="<%=request.getContextPath()%>/resource/images/load2.png"
				width="1057px" height="200px" />
		</div>
		<jsp:include page="/view/component/header.jsp"></jsp:include>
		<div id="content">
			<div id="left"><jsp:include page="/view/component/category.jsp"></jsp:include></div>
			<div id="right">
				<%
				ProductDAO productDAO = new ProductDAOImpl();
				List<Product> list = productDAO.getAllProductOrByCategory("all", -1);
				String id_cat = null;
				if (request.getParameter("id_cat") != null) {
					id_cat = request.getParameter("id_cat");
				}
				NumberFormat nf = NumberFormat.getInstance();
				nf.setMinimumFractionDigits(0);
				%>
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">
						<%
						if (id_cat != null) {
							for (Product p : productDAO.getAllProductOrByCategory("allByCat", (Integer.parseInt(id_cat)))) {
						%>

						<li class="preorder"><span class="tagimg "> </span> <a
							href="<%=request.getContextPath()%>/view/detailProduct.jsp?id_pro=<%=p.getId_pro()%>">
								<img
								src="<%=request.getContextPath()%>/resource/sanpham/<%=p.getImages()%>"
								width=" 250px" height="250px" />
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
						for (Product p : productDAO.getAllProductOrByCategory("all", -1)) {
						%>

						<li class="preorder"><span class="tagimg "></span> <a
							href="<%=request.getContextPath()%>/view/detailProduct.jsp?id_pro=<%=p.getId_pro()%>">
								<img
								src="<%=request.getContextPath()%>/resource/sanpham/<%=p.getImages()%>"
								width=" 250px" height="250px" />
								<h3><%=p.getName_pro()%></h3>
								<h4>
									Price:
									<%=nf.format(p.getPrice())%>
									VNĐ
								</h4> <span class="textkm">Sale <strong>0₫</strong>
							</span>
								<p class="info">
									<span>Manufacturer: <%=p.getSupplier()%></span> <span>Price:
										<%=nf.format(p.getPrice())%> VNĐ
									</span> <span>Information: <%=p.getInfor()%>
								</p>
						</a></li>
						<%
						}
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
