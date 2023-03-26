<%@ page import="com.webarch.eshopv2.ProductView" %><%--
  Created by IntelliJ IDEA.
  User: MesKaNoVa
  Date: 25/03/2023
  Time: 11:50 am
  To change this template use File | Settings | File Templates.
--%>
<div class="top_bg">
    <div class="container">
        <div class="header_top-sec">
            <div class="top_right">
                <img src="./images/logo2.png" alt="LOGO">
            </div>
            <div class="top_left">
                <div class="social">
                    <ul>
                        <li><a href="https://www.facebook.com/gin.shnklova"><i class="facebook"></i></a></li>
                        <li><a href="https://twitter.com/alaa_maz_3333"><i class="twitter"></i></a></li>
                        <li><a href="https://dribbble.com/session/new?return_to=%2Flearn"><i class="dribble"></i></a></li>
                        <li><a href="https://mail.google.com/mail/u/0/?tab=rm&ogbl#sent?compose=CllgCJTGmzXfvmxcWJGrCPlHMNqtqzFsXmGJTGtgTSFrngdsqcRgsVMNnSQVQFHkmmNlpHnpkkg"><i class="google"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<div class="header_top">
    <jsp:useBean id="view2" class="com.webarch.eshopv2.ProductView">
        <jsp:setProperty name="view2" property="*"></jsp:setProperty>
    </jsp:useBean>
    <%
        session = request.getSession(false);
        view2 = (ProductView) session.getAttribute("viewObject");
        int totalCost = view2.getCartTotal();
    %>
    <div class="container">
        <div class="header_right">
            <div class="cart box_1">
                <a href="cart.jsp">
                    <h3>Your Cart: <span>$<%=totalCost%></span> <img src="images/bag.png" alt=""></h3>
                </a>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--<div class="header_left">
            <ul class="megamenu skyblue">
                <li><a class="color6"><img src="images/user_v2.png" alt=""></a>
                    <div class="megapanel" style="width:13%;">
                        <div class="h_nav">
                            <ul>
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="signup.jsp">Register</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>-->
        <div class="clearfix"></div>
    </div>
</div>

<div class="mega_nav">
    <div class="container">
        <div class="menu_sec">
            <ul class="megamenu skyblue">
                <li><a class="color1" href="index.jsp">Home</a></li>
                <!--<li class="grid"><a class="color2" href="#">furniture</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>Furnitures</h4>
                                    <ul>
                                        <p>This is not yet implemented, come back later. ;-)</p>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>-->
                <li><a class="color5" href="about-us.jsp">About</a></li>
                <li><a class="color6" href="contact-us.jsp">Contact</a></li>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
</div>