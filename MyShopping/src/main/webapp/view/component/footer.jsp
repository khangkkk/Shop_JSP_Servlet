<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css">
        <title>Footer</title>
        <style>
            footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}
        </style>

    </head>
    <body>
        <footer>
            <p>
                Created with <i class="fa fa-heart"></i> by
                <a target="_blank" href="https://www.facebook.com/nguyenvan.khang.31521">...</a>
            </p>
        </footer>

    </body>
</html>
