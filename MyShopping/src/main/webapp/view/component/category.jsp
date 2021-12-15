
<%@page import="my.com.dao.impl.CategoryDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="my.com.model.Category"%>
<%@page import="my.com.dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <%
            CategoryDAO catDAO = new CategoryDAOImpl();
            List<Category> list = catDAO.getAllCat();
        %>
        <div class="container">
            <nav>
                <ul class="mcd-menu">
                    <%
                        for (Category c : list) {

                    %>
                    <li><a href="<%=request.getContextPath()%>/view/home.jsp?id_cat=<%=c.getId_cat()%>"> <i class="fa fa-home"><img
                                    src="<%=request.getContextPath()%>/resource/images/<%=c.getId_cat()%>.png"></i>
                            <strong><%=c.getName_cat()%></strong> <small><%=c.getDescribe()%></small>
                        </a></li>
                        <%
                            }
                        %>
                </ul>
            </nav>
        </div>
    </body>
</html>
