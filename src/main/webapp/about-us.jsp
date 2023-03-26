<%--
  Created by IntelliJ IDEA.
  User: MesKaNoVa
  Date: 25/03/2023
  Time: 12:17 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Online Furniture Management System | Contact Us</title>
  <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
  <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
  <link href="css/style.css" rel='stylesheet' type='text/css' />
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
<div class="contact">
  <div class="container">
    <ol class="breadcrumb">
      <li><a href="index.jsp">Home</a></li>
      <li class="active">About Us</li>
    </ol>
    <div class="contact-head">
      <h2>About Us</h2>
      <div class="col-md-6 contact-left" style="padding-top: 30px">
        <p>Hello there, this is us.</p>
      </div>
      <div class="col-md-6 contact-right">
        <img class="img-responsive" src="images/banner3.jpg" alt="about img">
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
