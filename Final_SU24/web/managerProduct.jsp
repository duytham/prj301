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
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <link rel="stylesheet" href="assets/css/main-color.css">

    </head>

    <body class="biolife-body">

        <nav class="navbar navbar-default">
            <div class="container">

                <!-- BRAND -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a class="navbar-brand" href="HomePage">Online Shop</a>
                </div>
                <!-- COLLAPSIBLE NAVBAR -->
                <div class="collapse navbar-collapse" id="alignment-example">

                    <!-- Links -->
                    <ul class="nav navbar-nav">

                        <c:if test="${sessionScope['account'].getRoles().getId()==2}">
                            <li>
                                <a style="text-decoration: none;" href="ManagerUser"> Manage User</a>
                            </li>
                            <li>

                            <li>
                                <a style="text-decoration: none;" href="ManagerAdmin"> Manage Admin</a>
                            </li> 

                        </c:if>
                        <li>
                            <a style="text-decoration: none;" href="AddNewBlog?Blog=Manage Blog"> Manage Blog</a>
                        </li> 
                        <li >
                            <a style="text-decoration: none;" href="ManagerProduct"> Manage Product</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerOrder"> Manage Order</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="CategoryManager"> Manage Category</a>
                        </li>
                        <!--                        <li >
                                                    <a style="text-decoration: none;" href="BannerManager"> Manage Banner</a>
                                                </li>
                                                <li >
                                                    <a style="text-decoration: none;" href="BannerManager"> Manage Banner</a>
                                                </li>-->
                        <li >
                            <a style="text-decoration: none;" href="HomePage">Back</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container-fluid">

                <div class="row" >

                    <div class="col-md-12">
                        <h1 style="text-align: center;">Manager Product</h1>
                        <div>    
                            Total Product:<input type="text" style="width: 50px"  value="${total}" name="total" class="" readonly> 
                        </div>


                        <form method="post" action="ManagerProduct" style="width: 90%; padding: 15px; display: flex; justify-content: space-between">
                            <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModalAddNew">Add Product</button>
                            <div>
                                <label >Category:</label>
                                <div>
                                    <select  class="form-control" style="display: block;" name="uid" >
                                        <option value="">Select</option>
                                        <c:forEach var="c" items="${clist}">
                                            <option value="${c.getId()}" ${p.getCategory().getName()==c.getName()?"selected":""} >${c.getName()} </option>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>
                            <div>
                                <label >Stock:</label>
                                <div>
                                    <select name="role">
                                        <option value="">Select</option>
                                        <option value="1">Stocking</option>
                                        <option value="0">Out of stock</option>                                
                                    </select>

                                </div>
                            </div>
                            <div>
                                <label >Search:</label>
                                <div>
                                    <input type="text" style="width: 250px" placeholder="Search product" value="${param["search"]}" name="search" class="form-control">
                                </div>
                            </div>

                            <input class="btn btn-primary" type="submit" value="Find" style="margin-top: 10px; ">


                        </form>

                        <!-- Modal -->
                        <div class="modal fade" id="myModalAddNew" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add New product:</h4>
                                    </div>
                                    <form action="AddNewProduct" method="post" enctype="multipart/form-data">
                                        <div class="modal-body">
                                            <b>Name: </b><input type="text" class="form-control" value="" required name="name"><br>
                                            <b>Price: </b><input type="number" step="0.1" class="form-control"  required value="" name="price"><br>
                                            <b>Category: </b>
                                            <div style="height: 50px; w30pxidth: 100%">
                                                <select  class="form-control" style="display: block;" name="category" >
                                                    <c:forEach var="c" items="${clist}">
                                                        <option value="${c.getId()}" ${p.getCategory().getName()==c.getName()?"selected":""} >${c.getName()} </option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <b>Description: </b><input type="text" class="form-control" required value="" name="descri"><br>
                                            <b>Image link:</b><input required name="photo" type="file" accept="image/*" class="form-control" value=""  ><br>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>

                        <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                            <thead >
                                <tr style="font-size: 20px;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Create Date</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Image</th>
                                    <th scope="col" colspan="2" style="text-align: center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${pl}">
                                    <tr>
                                        <th scope="row">${p.getId()}</th>
                                        <td>${p.getName()}</td>
                                        <td>${p.getPrice()}</td>
                                        <td>${p.getCategory().getName()}</td>
                                        <td>${p.getStock()==1?"Stocking":"Out of stock "}</td>
                                        <td>${p.getCreateDate()}</td>
                                        <td style="width: 30%;">${p.getDescription()}</td>
<!--                                        <td><img style="width:150px;height:150px;"src="http://localhost:9999/OnlineShopPrj/img/${p.getImg()}"></td>-->
                                        <td><img style="width:150px;height:150px;"src="img/${p.getImg()}"></td>
                                        <td ><a href="DeleteProduct?pid=${p.getId()}" class="btn- btn-danger  btn-lg" style="display: block;" > Delete</a></td>
                                        <td> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal${p.getId()}">Edit</button></td>

                                    </tr>
                                    <!-- Modal -->
                                <div class="modal fade" id="myModal${p.getId()}" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Edit product:</h4>
                                            </div>
                                            <form action="EditProduct" method="post" enctype="multipart/form-data">
                                                <div class="modal-body">
                                                    <b>ID: </b><input type="text" class="form-control" name="id" value="${p.getId()}" readonly=""><br>
                                                    <b>Name: </b><input type="text" class="form-control" value="${p.getName()}" name="name"><br>
                                                    <b>Price: </b><input type="number" step="0.1" class="form-control" value="${p.getPrice()}" name="price"><br>
                                                    <b>Category: </b>
                                                    <div style="height: 50px; w30pxidth: 100%">
                                                        <select  class="form-control" style="display: block;" name="category" >
                                                            <c:forEach var="c" items="${clist}">
                                                                <option value="${c.getId()}" ${p.getCategory().getName()==c.getName()?"selected":""} >${c.getName()} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <b>Stock: </b>
                                                    <div style="height: 50px; w30pxidth: 100%">
                                                        <select name="stock">

                                                            <option value="1">Stocking</option>
                                                            <option value="0">Out of stock</option>                                
                                                        </select>
                                                    </div>
                                                    <b>Create Date: </b><input type="date" class="form-control" value="${p.getCreateDate()}" name="creDate"><br>
                                                    <b>Description: </b><input type="text" class="form-control" value="${p.getDescription()}" name="descri"><br>
                                                    <b>Image link:</b><input required name="photo" type="file" accept="image/*" class="form-control" value="" ><br>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

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
        <script>function displayImage(input) {
                var previewImage = document.getElementById("previewImage");
                var file = input.files[0];
                var reader = new FileReader();

                reader.onload = function (e) {
                    previewImage.src = e.target.result;
                    previewImage.style.display = "block";
                }

                reader.readAsDataURL(file);
            }

        </script>

    </body>

</html>