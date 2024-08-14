<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%-- Import thư viện JSTL để định dạng dd/MM/yyyy --%>


<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Online Shop</title>

        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/main-color.css">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 100%;
                margin: auto;
            }
        </style>

    </head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>

        <!-- Page Contain -->
        <div class="page-contain">

            <!-- Main content -->
            <div id="main-content" class="main-content">


                <!--Block 03: Product Tab-->
                <div class="product-tab z-index-20">
                    <div class="container">
                        <div class="container">
                            <br>
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li> 
                                        <c:forEach var="p" items="${balist}">
                                        <li data-target="#myCarousel" data-slide-to="${p.getId()}"></li>   
                                        </c:forEach>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <a>
                                            <img src="https://abdullahtechmart.com/cdn/shop/files/banner_2.jpg?v=1716982330&width=2560" alt="banner1" width="460" height="345" >
                                        </a>
                                    </div>
                                    <c:forEach var="p" items="${balist}">
                                        <div class="item">
                                            <a> 
                                                <img src="https://c8.alamy.com/comp/2C3T9DK/online-shopping-banner-mobile-payment-and-delivery-service-concept-vector-landing-page-of-ecommerce-business-with-isometric-smartphone-and-hand-holding-pos-terminal-and-box-2C3T9DK.jpg" width="460" height="345">
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>

                        <!--                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                                                    <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                                        <h1 style="color: black; font-weight: 600;color: #05a503; border-bottom: 1px solid #7fff00 ">Newest Blog</h1>
                                                        <div class="row" style="margin-bottom: 50px;">
                                                            <ul class="products-list" style="list-style: none;">
                        <c:forEach var="p" items="${blist}">
                            <li class="product-item col-lg-4 col-xs-6" style="min-height: 350px;">
                                <div class="contain-product layout-default">
                                    <div class="product-thumb">
                                        <a href="./BlogDetail?bid=${p.getId()}" class="link-to-product" style="display: block; width: 300px; height: 200px; padding: auto;">
                                            <img src="${p.getBanner()}" alt="img" width="300" height="200" style="margin-left: 8%;">
                                        </a>
                                    </div>
                                    <div class="info">
                                        <h4 class="product-title"  style="margin-top: 25px;"><a style="color: black;" href="./BlogDetail?bid=${p.getId()}" class="pr-name"> ${p.getBlogTitle()}</a></h4>
                                        <div class="price">
                                            <ins><span class="price-amount" style="color: black; font-weight: 100;font-size: 15px" >
                                                    Posted date: <fmt:formatDate pattern="dd-MM-yyyy" value="${p.getCreateDate()}"/><span class="currencySymbol"></span></ins>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                            
                    </ul>
                </div>
            </div>
        </div>-->

                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                            <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                <h1 style="color: black; font-weight: 600;color: #e6731c; border-bottom: 1px solid #FAC898 ">Newest Product</h1>
                                <div class="row" style="margin-bottom: 50px;">
                                    <ul class="products-list" style="list-style: none;">
                                        <c:forEach var="p" items="${plist}">
                                            <li class="product-item col-lg-4 col-xs-6" style="min-height: 550px;">
                                                <div class="contain-product layout-default">
                                                    <div class="product-thumb">
                                                        <a href="./ProductDetails?pid=${p.getId()}" class="link-to-product" style="display: block; width: 300px; height: 300px; padding: auto;">
                                                            <img src="img/${p.getImg()}" alt="img" width="300" height="300" style="margin-left: 8%;">
                                                        </a>
                                                    </div>
                                                    <div class="info">
                                                        <h4 class="product-title"  style="margin-top: 25px;"><a style="color: #FAC898;" href="./ProductDetails?pid=${p.getId()}" class="pr-name">${p.getName()}</a></h4>
                                                        <div class="price">
                                                            <ins><span class="price-amount" style="color: #FAC898;" >Price: <span class="currencySymbol">$</span>${p.getPrice()}</span></ins>
                                                        </div>

                                                        <div class="price">
                                                            <a href="./AddToCart?pid=${p.getId()}&quantity=1&url=HomePage" style=" color: #e6731c; border-bottom: 1px solid #e6731c;">Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
                    <div class="container">
                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                            <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                <ul class="tabs md-margin-bottom-35-im xs-margin-bottom-40-im">
                                    <li class="tab-element">
                                        <h1 style="color: black; font-weight: 600; color: #e6731c; border-bottom: 1px solid #FAC898 ">Top sellers</h1>
                                    </li>
                                </ul>
                                
                                <div class="row" style="margin-bottom: 50px;">
                                    <ul class="products-list" style="list-style: none;">
                                        <c:forEach var="p" items="${plist1}">
                                            <li class="product-item col-lg-4 col-xs-6">
                                                <div class="contain-product layout-default">
                                                    <div class="product-thumb">
                                                        <a href="./ProductDetails?pid=${p.getId()}" class="link-to-product" style="display: block; width: 300px; height: 300px; padding: auto;">
                                                            <img src="img/${p.getImg()}" alt="img" width="300" height="300" style="margin-left: 8%;">
                                                        </a>
                                                    </div>
                                                        
                                                    <div class="info">
                                                        <h4 class="product-title" style="margin-top: 25px;"><a href="./ProductDetails?pid=${p.getId()}" style="color: black;" class="pr-name">Name: ${p.getName()}</a></h4>
                                                        <div class="price">
                                                            <ins ><span class="price-amount"  style="color: black;">Price: <span class="currencySymbol">$</span >${p.getPrice()}</span></ins>
                                                        </div>
                                                        
                                                        <div class="price">
                                                            <a href="./AddToCart?pid=${p.getId()}&quantity=1&url=HomePage" style=" color: #e6731c; border-bottom: 1px solid #e6731c;" >Add to cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>



        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="assets/js/jquery-3.4.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.nicescroll.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/biolife.framework.js"></script>
        <script src="assets/js/functions.js"></script>
    </body>

</html>