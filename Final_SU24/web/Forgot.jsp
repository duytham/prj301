<%-- 
    Document   : Forgot
    Created on : Jan 7, 2024, 3:50:09 PM
    Author     : thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Shop</title>
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/main-color.css">
        <style>

            .inline{
                display:inline-block;
            }
        </style>
    </head>

    <body class="biolife-body" onload="generate()">

        <jsp:include page="header.jsp"/>

        <div class="page-contain login-page">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <!--Form Sign In-->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="signin-container">
                                <h1>Forgot password</h1>

                                <form action="Forgot" name="frm-login" method="post">
                                    
                                    <p class="form-row">
                                        <label for="fid-name">Email<span class="requite">*</span></label>
                                        <input type="email" id="fid-name" name="email" value="" class="txt-input">
                                    </p>
<!--                                    <p class="form-row">
                                        <label for="fid-name">Phone<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="phone" value="" class="txt-input">
                                    </p>
                                    
                                    <p class="form-row">
                                        <label for="fid-name">Address<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="address" value="" class="txt-input">
                                    </p>-->

                                    <div class="form-row">
                                        <select name="Q1Id" class="txt-input" >
                                            <option value="">Select question1</option>
                                            <c:forEach var="c" items="${q1list}">
                                                <option value="${c.getQ1_id()}" ${param['categoryId']==c.getQ1_id()?"selected":""}>${c.getQ1_name()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <p class="form-row">                                       
                                        <input type="text" id="fid-pass"  name="q1" value="" class="txt-input">
                                    </p>

                                    <div class="form-row">
                                        <select name="Q2Id" class="txt-input" >
                                            <option value="">Select question2</option>
                                            <c:forEach var="c" items="${q2list}">
                                                <option value="${c.getQ2_id()}" ${param['categoryId']==c.getQ2_id()?"selected":""}>${c.getQ2_name()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <p class="form-row">                                       
                                        <input type="text" id="fid-pass"   name="q2" value="" class="txt-input">
                                    </p>

                                    <p id="key" style="color: red" ></p>
                                    <p class="form-row" style="color: red">
                                        ${messregis}
                                    </p>
                                    <p class="form-row wrap-btn">
                                        <button class="btn btn-submit" id="btnRegister" type="submit">Check User</button>
                                    </p>
                                </form>
                            </div>
                        </div>

                        <!--Form Sign In-->
                        
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
        <script>
        var captcha;
        function generate() {

            // Clear old input
            document.getElementById("submitLogin").value = "";

            // Access the element to store
            // the generated captcha
            captcha = document.getElementById("image");
            var uniquechar = "";

            const randomchar =
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            // Generate captcha for length of
            // 5 with random character
            for (let i = 1; i < 6; i++) {
                uniquechar += randomchar.charAt(
                        Math.random() * randomchar.length)
            }

            // Store generated input
            captcha.innerHTML = uniquechar;
        }

        function printmsg() {
            const usr_input = document
                    .getElementById("submitLogin").value;

            // Check whether the input is equal
            // to generated captcha or not
            if (usr_input == captcha.innerHTML) {
                document.getElementById("btnRegister")
                        .disabled = false;
                var s = document.getElementById("key")
                        .innerHTML = "CapCha Matched";
                generate();
            } else {
                var s = document.getElementById("key")
                        .innerHTML = "CapCha Not Matched";
                generate();
            }
        }
        </script>
    </body>

</html>
