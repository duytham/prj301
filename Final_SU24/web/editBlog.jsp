<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Blog</title>

        <!-- Import Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">

        <!-- Import Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <!-- Import custom CSS -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/main-color.css">

        <!-- Import Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <!-- Custom CSS -->
        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 100%;
                margin: auto;
            }

            /* CSS for input fields */
            .input {
                height: 4rem;
                width: 100%;
                margin-bottom: 0.5rem;
            }

            /* CSS for form layout */
            .form-group {
                margin-bottom: 1.5rem;
            }

            /* CSS for submit button */
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                transition-duration: 0.4s;
                cursor: pointer;
                border-radius: 8px;
            }

            /* Hover effect for submit button */
            input[type="submit"]:hover {
                background-color: #45a049; /* Darker green */
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
                            <li>
                                <a style="text-decoration: none;" href="AddNewBlog?Blog=Manage Blog"> Manage Blog</a>
                            </li> 
                        </c:if>
                        <li >
                            <a style="text-decoration: none;" href="ManagerProduct"> Manage Product</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerOrder"> Manage Order</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="CategoryManager"> Manage Category</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="BannerManager"> Manage Banner</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="HomePage">Back</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>

        <%-- Set the variable "b" with the value of "${blist}" --%>
        <c:set var="b" value="${blist}"/>
        <h1 style="text-align: center;">Edit Blog</h1>
        <%-- Form for editing blog --%>
        <div class="container-fluid">
            <form action="AddNewBlog" method="post">
                <input type="hidden" value="${b.getId()}" name="bid"/>
                <!-- Banner input -->
                <div class="form-group">
                    <label for="banner">Banner</label>
                    <input type="text" name="banner" class="form-control input" id="banner" placeholder="Input Banner" value="${b.getBanner()}" required>
                </div>

                <!-- Title input -->
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" name="title" class="form-control input" id="title" placeholder="Input Title" value="${b.getBlogTitle()}" required>
                </div>

                <!-- Category selection -->
                <div class="form-group">
                    <label for="cateId">Category</label>
                    <select class="form-control input" id="cateId" name="cateId" required>
                        <c:forEach var="c" items="${bcl}">
                            <option value="${c.id}" ${param.cateId eq c.id ? 'selected' : ''}>${c.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Introduction input -->
                <div class="form-group">
                    <label for="introduction">Introduction</label>
                    <input type="text" name="introduction" class="form-control input" id="introduction" placeholder="Input Introduction" value="${b.getIntroduction()}" required>
                </div>

                <!-- Body input -->
                <div class="form-group">
                    <label for="body">Body</label>
                    <input type="text" name="body" class="form-control input" id="body" placeholder="Input Body" value="${b.getBody()}" required>
                </div>

                <!-- Conclusion input -->
                <div class="form-group">
                    <label for="conclusion">Conclusion</label>
                    <input type="text" name="conclusion" class="form-control input" id="conclusion" placeholder="Input Conclusion" value="${b.getConclusion()}" required>
                </div>

                <!-- Author input -->
                <div class="form-group">
                    <label for="author">Writer</label>
                    <input type="text" name="author" class="form-control input" id="author" placeholder="Input Author" value="${b.getAuthor()}" required>
                </div>

                <div class="form-group">
                    <label for="author">Image</label>
                    <input type="text" name="image" class="form-control input" id="author" placeholder="Input Image" value="${b.getImg1()}" required>
                </div>

                <!-- Submit button -->
                <input type="submit" name="Blog" value="Update">
            </form>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
