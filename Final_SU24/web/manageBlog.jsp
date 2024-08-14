<%-- 
    Document   : manageBlog
    Created on : Feb 20, 2024, 2:23:33 PM
    Author     : duypr
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Blog</title>
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
            .input{
                width: 16rem;
                height: 4rem;
            }
        </style>
    </head>
    <body>

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
                        <li>
                            <a style="text-decoration: none;" href="CategoryManager"> Manage Category</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="HomePage">Back</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
        <h1 style="text-align: center;">Manager Blogs</h1>

       

        <%-- Create New Blog Form --%>
        <div style="display: flex; justify-content: flex-end; align-items: end; margin-right: 4rem; margin-bottom: 2rem;">
            <form method="get" action="AddNewBlog">
                <input class="input btn-create" type="submit" name="Blog" value="Create New Blog"/>
            </form>
        </div>

        <style>
            /* CSS for "Create New Blog" button */
            .btn-create {
                background-color: #4CAF50; /* Green */
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn-create:hover {
                background-color: #45a049; /* Darker green on hover */
            }
        </style>

        <%-- Blog Table --%>
        <div>
            <style>
                .table-container {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                }
                table {
                    border: 1px solid black;
                    border-collapse: collapse;
                }
                th, td {
                    text-align: center;
                    padding: 10px;
                }
                th {
                    font-weight: bold;
                }
                /* CSS for Edit Button */
                .edit-button {
                    background-color: #4CAF50; /* Green */
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 16px;
                    margin: 4px 2px;
                    cursor: pointer;
                    border-radius: 4px;
                }
                /* CSS for Delete Button */
                .delete-button {
                    background-color: #f44336; /* Red */
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 16px;
                    margin: 4px 2px;
                    cursor: pointer;
                    border-radius: 4px;
                }
            </style>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Banner</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                        <%-- Loop through blogs and display table rows --%>
                        <c:forEach var="blog" items="${blist}" varStatus="loopStatus">
                            <tr>
                                <td>${blog.getId()}</td>
                                <td><img style="width: 20rem;" src="${blog.banner}" alt="img"/></td>
                                <td>${blog.getBlogTitle()}</td>
                                <td>${blog.getBlogCategoryObject().getName()}</td>
                                <td>
                                    <form method="post" action="AddNewBlog">
                                        <input type="hidden" name="editId" value="${blog.getId()}"/>
                                        <input type="submit" name="Blog" value="Edit" class="edit-button">
                                    </form>
                                </td>
                                <td>
                                    <form method="post" action="AddNewBlog">
                                        <input type="hidden" name="deleteId" value="${blog.getId()}"/>
                                        <input type="submit" name="Blog" value="Delete" class="delete-button">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- Pagination --%>
        <nav style="margin-left: 42%" aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="AddNewBlog?cateId=${param["cateId"]}&name=${param["name"]}&index=1&Blog=Manage Blog">First Page</a></li>

                <%-- Loop through pagination pages --%>
                <c:forEach var="i"  begin="1" end="${numberPage}" step="1">
                    <li class="page-item  ${index==i?"active":""}"><a class="page-link" href="AddNewBlog?cateId=${param["cateId"]}&name=${param["name"]}&index=${i}&Blog=Manage Blog">${i}</a></li>
                    </c:forEach>
                <li class="page-item"><a class="page-link" href="AddNewBlog?cateId=${param["cateId"]}&name=${param["name"]}&index=${numberPage}&Blog=Manage Blog">Last Page</a></li>
            </ul>
        </nav>

    </body>
</html>
