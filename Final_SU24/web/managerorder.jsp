<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- Định nghĩa HTML và thiết lập ngôn ngữ là tiếng Anh -->
<html class="no-js" lang="en">

    <head>
        <!-- Thiết lập mã ký tự và khai báo cài đặt cho trình duyệt -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Tiêu đề trang -->
        <title> Shop</title>

        <!-- Liên kết với các font chữ từ Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">

        <!-- Liên kết với các file CSS từ assets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <!-- <link rel="stylesheet" href="assets/css/style.css"> -->
        <link rel="stylesheet" href="assets/css/main-color.css">
    </head>

    <body class="biolife-body">

        <!-- Thẻ nav định nghĩa thanh điều hướng -->
        <nav class="navbar navbar-default">
            <div class="container">

                <!-- Phần đầu thanh điều hướng (BRAND) -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <!-- Liên kết đến trang chủ, thay thế cho logo -->
                    <a class="navbar-brand" href="HomePage">Online Shop</a>
                </div>

                <!-- Phần thân thanh điều hướng có thể thu gọn (COLLAPSIBLE NAVBAR) -->
                <div class="collapse navbar-collapse" id="alignment-example">
                    <!-- Các liên kết điều hướng -->
                    <ul class="nav navbar-nav">
                        <!-- Các mục điều hướng -->
                        <!-- Các mục có class 'active' là mục đang được chọn -->

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

                        <c:if test="${sessionScope['account'].getRoles().getId()==3}">
                            <li>
                                <a style="text-decoration: none;" href="AddNewBlog?Blog=Manage Blog"> Manage Blog</a>
                            </li> 
                        </c:if>

                        <li>
                            <a style="text-decoration: none;" href="ManagerProduct"> Manage Product</a>
                        </li>
                        <li>
                            <a style="text-decoration: none;" href="ManagerOrder"> Manage Order</a>
                        </li>
                        <li>
                            <a style="text-decoration: none;" href="CategoryManager"> Manage Category</a>
                        </li>
                        <li>
                            <a style="text-decoration: none;" href="HomePage">Back</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Phần nội dung chính -->
        <div id="main-content" class="main-content">
            <div class="container-fluid">

                <!-- Phần giao diện quản lý đơn hàng -->
                <div class="row">
                    <div class="col-md-12">
                        <h1 style="text-align: center;">Manager Order</h1>

                        <!-- Form tìm kiếm và lọc đơn hàng -->
                        <form method="get" action="ManagerOrder" style="width: 90%; padding: 15px; display: flex; justify-content: space-between">
                            <div>
                                <label>Status:</label>
                                <div>
                                    <!-- Dropdown để lọc theo trạng thái đơn hàng -->
                                    <select name="uid">
                                        <option value="">All</option>
                                        <option value="1">Pending</option>
                                        <option value="2">Shipping</option>
                                        <option value="3">Delivered</option>
                                        <option value="4">Canceled</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label>Search:</label>
                                <div>
                                    <!-- Ô nhập liệu để tìm kiếm theo tên người dùng, số điện thoại, địa chỉ, orderId -->
                                    <input type="text" style="width: 250px" placeholder="Search by username, phone, address, orderId" value="${param["search"]}" name="search" class="form-control">
                                </div>
                            </div>
                            <div>
                                <label>From date:</label>
                                <!-- Ô nhập liệu để chọn ngày bắt đầu -->
                                <input type="date" name="fdate" value="${param["fdate"]}" class="form-control">
                            </div>
                            <div>
                                <label>To date:</label>
                                <!-- Ô nhập liệu để chọn ngày kết thúc -->
                                <input type="date" name="tdate" value="${tdate}" class="form-control">
                            </div>
                            <!-- Nút tìm kiếm -->
                            <input class="btn btn-primary" type="submit" value="Find" style="margin-top: 10px; ">
                        </form>
                    </div>

                    <!-- Bảng hiển thị đơn hàng -->
                    <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                        <thead>
                            <!-- Tiêu đề cột bảng -->
                            <tr>
                                <th class="product-name">Order Id </th>
                                <th class="product-price">Order Date</th>
                                <th class="product-price">UserName</th>
                                <th class="product-price">Phone</th>
                                <th class="product-price">Address</th>
                                <th class="product-quantity">Total Bill</th>
                                <th class="product-subtotal">Note</th>
                                <th class="product-subtotal">Status</th>
                                <th class="product-subtotal">Details</th>
                                <th class="product-subtotal">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Vòng lặp hiển thị thông tin đơn hàng -->
                            <c:forEach var="o" items="${ol}">
                                <tr class="cart_item">
                                    <!-- Các cột thông tin đơn hàng -->
                                    <td class="product-thumbnail">
                                        ${o.getId()}
                                    </td>
                                    <td class="product-price">
                                        ${o.getOrderDate()}
                                    </td>
                                    <td class="product-price">
                                        ${o.getUserName()}
                                    </td>
                                    <td class="product-price">
                                        ${o.getPhone()}
                                    </td>
                                    <td class="product-price">
                                        ${o.getAddress()}
                                    </td>
                                    <td class="product-quantity">
                                        ${o.getTotal()}
                                    </td>
                                    <td class="product-subtotal">
                                        ${o.getNotes()}
                                    </td>
                                    <td class="product-subtotal">
                                        ${o.getStatusName()}
                                    </td>
                                    <td class="product-subtotal">
                                        <!-- Liên kết đến trang chi tiết đơn hàng -->
                                        <a href="./OrderDetails?oid=${o.getId()}">Details</a>
                                    </td>
                                    <td class="product-subtotal">
                                        <!-- Hiển thị nút hủy đơn hàng nếu đơn hàng có trạng thái 'Pending' -->
                                        <c:if test="${o.getStatus() == 1}">
                                            <a href="CancelOrder?oid=${o.getId()}" class="btn btn-danger">Cancel order</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Nút cuộn lên đầu trang -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <!-- Liên kết với các file JavaScript từ assets -->
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
