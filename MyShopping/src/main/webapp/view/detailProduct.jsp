<%@page import="my.com.dao.impl.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="my.com.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Product</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/detail.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/menu.css" />
        <style type="text/css">
            #main {
                width: 1060px;
                padding: 0;
                margin-left: auto;
                margin-right: auto;
            }

            #head {
                height: 200px;
                background-color: #F5F5F5;
                border: 1px solid #CDCDCD;
                margin-bottom: 5px;
                margin-top: 5px;
            }

            #head-link {
                height: 50px;
                line-height: 30px;
                border: 1px solid #CDCDCD;
                background-color: #F5F5F5;
                margin-bottom: 5px;
                clear: both;
            }

            #content {
                width: 1060px;
                min-height: 430px;
                border: 1px solid #CDCDCD;
                float: left;
                margin-bottom: 5px;
                clear: both;
            }

            #footer {
                height: 50px;
                clear: both;
                border: 1px solid #CDCDCD;
                background-color: #F8F8FF;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>

        <%
            // ham nay de lay ma san pham truyen qua tren thanh dia chj
            String id_pro = "";
            if (request.getParameter("id_pro") != null) {
                id_pro = request.getParameter("id_pro");
            }

            ProductDAO productDAO = new ProductDAOImpl();
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMinimumFractionDigits(0);
        %>
        <div id="main">
            <div id="head">
                <img src="<%=request.getContextPath()%>/images/load2.png" width="1057px" height="200px" />
            </div>
                       <jsp:include page="/view/component/header.jsp"></jsp:include>      
            <div id="content">
                <div class="left-1">
                    <img
                        src="<%=request.getContextPath()%>/resource/sanpham/<%=productDAO.getProductInformation(Integer.parseInt(id_pro))
                                .getImages()%>"
                        width="200px" height="200px" />
                </div>
                <div class="left-2">
                    <table>
                        <tr class="row1">
                            <td class="col2" colspan="2"
                                style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=productDAO.getProductInformation(Integer.parseInt(id_pro))
                                        .getName_pro()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Manufacturer:</td>
                                <td class="col2"><%=productDAO.getProductInformation(Integer.parseInt(id_pro))
                                        .getSupplier()%></td>
                        </tr>

                        <tr class="row2">
                            <td class="col1">Price:</td>
                                <td class="col2"><%=nf.format(productDAO.getProductInformation(Integer.parseInt(id_pro))
                                        .getPrice())%> VNĐ</td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Quantity:</td>
                            <td class="col2"><%=productDAO.getProductInformation(Integer.parseInt(id_pro))
                                        .getQuantity()%></td>
                        </tr>
                    </table>
                </div>
                <div
                    style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                    <a
                        href="#"><img
                            src="<%=request.getContextPath()%>/resource/images/giohang.png" /></a>
                    <form action="cart" method="post">
                        <input type="number" min="1" value="1" name="quantity"/>
                        <input type="hidden" value="setCart" name="command"/>
                        <input type="hidden" value="<%=id_pro%>" name="id_pro"/>
                        <input type="submit" value="Add to cart">
                    </form>	
                </div>              
                <div class="left-3">
                    <article> <input type="checkbox" id="read_more"
                                     role="button"> <label for="read_more" onclick=""
                                     style="width: 770px; margin-left: 150px; margin-right: auto;"><span>View detail information</span> <span>Close</span></label> <section>
                            <table>

                                <tr rowspan="2">
                                    <td class="detail-1">Information</td>
                                    <td class="detail-2">Updating</td>
                                </tr>


                            </table>
                        </section> 
                    </article>
                </div>

            </div>
            <div id="footer"><jsp:include page="/view/component/footer.jsp"></jsp:include></div>
        </div>    
    </body>
</html>
