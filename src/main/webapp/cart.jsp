<%@ page import="com.webarch.eshopv2.ProductView" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.webarch.eshopv2.CartItem" %>
<%--
  Created by IntelliJ IDEA.
  User: MesKaNoVa
  Date: 25/03/2023
  Time: 11:11 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Online Furniture Store Management System|| Cart Page</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary JavaScript plugins) -->
    <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/alerts2.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Furnyish Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
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
    <!-- start menu -->
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
        // You can also use "$(window).load(function() {"
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
<div class="cart_main">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="index.jsp">Home</a></li>
            <li class="active">Cart</li>
        </ol>
        <div class="cart-items">
            <h2>My Shopping Bag</h2>

            <form action="" method="post">
                <div id="shopping-cart">
                    <a id="btnEmpty" href="cartRemove-servlet?removal=all" style="color:red">Empty Cart</a>
                    <table class="table table-bordered" cellpadding="10" cellspacing="1">
                        <thead>
                        <tr>
                            <th style="text-align:center;">Product Image</th>
                            <th style="text-align:center;">Product Name</th>
                            <th style="text-align:center;">Quantity</th>
                            <th style="text-align:center;">Unit Price ($)</th>
                            <th style="text-align:center;">Price ($)</th>
                            <th style="text-align:center;">Edit</th>
                            <th style="text-align:center;">Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                                <jsp:useBean id="view" class="com.webarch.eshopv2.ProductView"/>
                                <jsp:setProperty name="view" property="*"/>
                                <%
                                    int tid = 0;
                                    view = (ProductView) session.getAttribute("viewObject");
                                    for(CartItem item : view.getCart())
                                    {
                                %>
                                        <tr>
                                            <form method="post" action="cartEdit-servlet"></form> <!-- simple workaround to prevent the missed form bug -->
                                            <td><img src="images/<%=item.getImageSrc()%>" height='100' width='200'></td>
                                            <td><%=item.getTitle()%></td>
                                            <td style="text-align:center;"><%=item.getQuantity()%></td>
                                            <td style="text-align:center;"><%=item.getPrice()/item.getQuantity()%></td>
                                            <td style="text-align:center;"><%=item.getPrice()%></td>
                                            <td style="text-align:center;">
                                                <form method="post" action="cartEdit-servlet">      <!-- the bug happened here, form for first row wasn't created -->
                                                    <input type="number" min="1" max="99" name="newQuantity" value="<%=item.getQuantity()%>" style="margin-bottom: 5px;">
                                                    <input type="image" src="images/3597089.png" value="edit">
                                                    <input type="hidden" value="<%=tid%>" name="tid">
                                                </form>
                                            </td>
                                            <td style="text-align:center;">
                                                <form method="post" action="cartRemove-servlet">
                                                    <input type="image" src="images/icon-delete.png" value="submit">
                                                    <input type="hidden" name="removal" value="one">
                                                    <input type="hidden" name="tid" value="<%=tid%>">
                                                </form>
                                            </td>
                                        </tr>
                                <%
                                   tid++; }
                                %>
                        </tbody>
                    </table>
                    <div class="cart-total">

                        <a class="continue" href="index.jsp">Continue to basket</a>

                        <div class="price-details">
                            <h3>Price Details</h3>
                            <span>Total</span>
                            <span class="total"><%=view.getCartTotal()%></span>
                            <span>Discount</span>
                            <span class="total">0%</span>

                            <div class="clearfix"></div>
                        </div>
                        <h4 class="last-price" style="padding-bottom: 20px">TOTAL</h4>

                        <span class = "total final"><%=view.getCartTotal()%></span>

                        <div class="clearfix"></div>
                        <input type="submit" value="Place Order" class="btn btn-primary" name="submit" id="submit">

                    </div>
                    <%
                        if(view.getCart().isEmpty())
                        {
                    %>
                    <div class="no-records">Your Cart is Empty</div>
                    <%
                        }
                    %>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
