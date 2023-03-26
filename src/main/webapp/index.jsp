<%@ page import="com.webarch.eshopv2.ProductView" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.webarch.eshopv2.Product" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Furniture Store Management System || Home Page</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/alerts2.css" rel='stylesheet' type='text/css' />


    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat|Raleway:400,200,300,500,600,700,800,900,100' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Aladin' rel='stylesheet' type='text/css'>

    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>
        $(document).ready(function() {
            $(".megamenu").megamenu();
        });
    </script>
    <script src="js/menu_jquery.js"></script>
    <script src="js/simpleCart.min.js"> </script>
    <script src="js/responsiveslides.min.js"></script>
    <script>
        $(function() {
            // Slideshow 1
            $("#slider1").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
            });
        });
    </script>

</head>
<body>
<%@include file="header.jsp"%>
<div class="content">
    <div class="container">
        <div class="slider">
            <ul class="rslides" id="slider1">
                <li><img src="images/banner2.jpg" alt=""></li>
                <li><img src="images/banner1.jpg" alt=""></li>
                <li><img src="images/banner3.jpg" alt=""></li>
            </ul>
        </div>
    </div>
</div>
<div class="top-sellers">
    <div class="container">
        <h3>Available Products</h3>
        <div class="seller-grids">
            <jsp:useBean id="view" class="com.webarch.eshopv2.ProductView">
                <jsp:setProperty name="view" property="*"></jsp:setProperty>
            </jsp:useBean>
            <%
                session = request.getSession(false);
                view = (ProductView) session.getAttribute("viewObject");
                for(int i = 0; i < view.getProductsSize();  i++)
                {
                    Product temp = view.getProducts().get(i);
            %>
            <div class="col-md-3 seller-grid" style="height:300px">
                <img src="images/<%=temp.getImageSrc()%>" alt="" width="100" height="100" />
                <h5><%=temp.getTitle()%></h5>
                <span>ID: <%=temp.getPid()%></span>
                <p>Price: $<%=temp.getPrice()%>/-</p>
                <form method="post" action="cartAdd-servlet">
                    <input type="image" src="images/6_(47).jpg" height="40px" width="40px" value="Add">
                    <input hidden="hidden" name="pid" value="<%=temp.getPid()%>">
                </form>
            </div>
            <%
                }
            %>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="recommendation"></div>
<%@include file="footer.jsp"%>
</body>
</html>