<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .login-box {
            max-width: 400px;
            margin: 60px auto;
            padding: 25px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
        }
    </style>
</head>

<body class="bg-light">

<!-- Navbar -->
<!-- <nav class="navbar navbar-expand-sm bg-light">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="#">Trang chủ</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Giỏ hàng</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Thanh toán</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Lịch sử mua hàng</a></li>
            <li class="nav-item"><a class="nav-link" href="dangnhapController">Đăng nhập</a></li>
            <li class="nav-item"><a class="nav-link" href="tcController">Đăng xuất</a></li>
        </ul>

        <form class="d-flex">
            <input class="form-control me-2" type="text" placeholder="Search">
            <button class="btn btn-primary" type="button">Search</button>
        </form>
    </div>
</nav> -->

<!-- Form đăng nhập -->
<div class="login-box shadow-sm">
    <h3 class="text-center mb-4">Đăng nhập</h3>

    <form action="dangnhapController" method="post">

        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <% 
            Integer dem = (Integer) session.getAttribute("Solansai");
            if(dem != null && dem >= 3){ 
        %>
            <div class="mb-3">
                <img src="simpleCaptcha.jpg" class="mb-2"/>
                <input type="text" class="form-control" name="answer" placeholder="Nhập captcha">
            </div>
        <% } %>

        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>

        <p class="text-danger text-center mt-3">
            <%= (request.getAttribute("tb") != null ? request.getAttribute("tb") : "") %>
        </p>
    </form>

    <div class="text-center mt-3">
        Chưa có tài khoản? <a href="#">Đăng ký</a>
    </div>
</div>

</body>
</html>
