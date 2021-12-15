<%@page import="my.com.dao.impl.ProductDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.com.model.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="my.com.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/product.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/menu.css" />
        <style>
            .pgf{
                margin: auto;
                width: 20%;
            }
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active{
                background-color: red;
                color: green;
            }
            .pagination a:hover:not(.active) {
                background-color: chocolate;
                color: white;
            }
        </style>
        <title>Product</title>
    </head>
    <body>
    <pg:paging pageSize="3">
        <div id="main">
            <div id="head">
                <img src="<%=request.getContextPath()%>/resource/images/load2.png" width="1057px" height="200px" />
            </div>
            <jsp:include page="/view/component/header.jsp"></jsp:include>


            <%
                ProductDAO pdb = new ProductDAOImpl();
                NumberFormat nf = NumberFormat.getInstance();
                nf.setMinimumFractionDigits(0);
                List<Product> arr = pdb.getAllProductOrByCategory("all", -1);
                int start = 0, end = 5;
                if (arr.size() < 5) {
                    end = arr.size();
                }
                if (request.getParameter("start") != null) {
                    start = Integer.parseInt(request.getParameter("start"));
                }
                if (request.getParameter("end") != null) {
                    end = Integer.parseInt(request.getParameter("end"));
                }%>
            <div id="site-wrapper-p" style="float: left; margin-left: 120px">
                <ul class="products homepage">
                    <%
                        List<Product> list = pdb.getListByPage(arr, start, end);
                        for (Product p : list) {
                    %>
                    <pg:item>
                        <li class="preorder"><span class="tagimg "></span> <a
                                href="<%=request.getContextPath()%>/view/detailProduct.jsp?id_pro=<%=p.getId_pro()%>"> <img
                                    src="<%=request.getContextPath()%>/resource/sanpham/<%=p.getImages()%>" width=" 250px"
                                    height="250px" />
                                <h3><%=p.getName_pro()%></h3>
                                <h4>
                                    Price:
                                    <%=nf.format(p.getPrice())%>
                                    VNÐ
                                </h4> <span class="textkm">Sale <strong>0đ</strong>
                                </span>
                                <p class="info">
                                    <span>Manufacturer: <%=p.getSupplier()%></span> 
                                    <span>Price:<%=nf.format(p.getPrice())%> VNÐ</span> <span>Information: <%=p.getInfor()%>
                                </p>
                            </a></li>
                    </pg:item>
                    <%
                        }
                    %>
                </ul>
            </div >
            <div style="clear: both" class="pgf">
                <ul>
                    <%
                        int a, b;
                        int numPage = arr.size() / 5;
                        if ((numPage * 5) < arr.size()) {
                            numPage += 1;
                        }
                        for (int i = 1; i <= numPage; i++) {
                            a = (i - 1) * 5;
                            b = i * 5;
                            if (b > arr.size()) {
                                b = arr.size();
                            }
                    %>
                    <li class="pagination">
                        <a href="<%=request.getContextPath()%>/view/productList.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a>
                    </li>
                    <%
                        }
                    %> 
                </ul>
            </div>
            </div>
    </pg:paging>
    <div id="footer"><jsp:include page="/view/component/footer.jsp"></jsp:include></div>
</body>
</html>
