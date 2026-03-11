<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin - Hóa đơn đã thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-nav .nav-link {
            color: rgba(255, 255, 255, 0.7) !important;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="adminController">ADMIN</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="adminController">Đơn hàng hôm nay</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminXacnhanController">Xác nhận đơn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="adminDaThanhToanController">
                        Hóa đơn đã thanh toán
                    </a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${empty sessionScope.admin}">
                        <li class="nav-item">
                            <a class="nav-link fw-bold text-white" href="Admin/adminLogin.jsp">Đăng nhập</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item d-flex align-items-center">
                            <span class="navbar-text text-white me-3 d-none d-md-inline">
                                Xin chào, Admin
                            </span>
                            <a href="adminDangXuatController" class="btn btn-outline-light btn-sm">
                                Đăng xuất
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="text-dark fw-bold text-center">
        LỊCH SỬ HÓA ĐƠN ĐÃ THANH TOÁN
    </h3>
    <hr>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered align-middle">
                    <thead class="table-dark text-center">
                        <tr>
                            <th>Mã Hóa Đơn</th>
                            <th>Tên Khách Hàng</th>
                            <th>Ngày Mua</th>
                            <th>Trạng thái</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="hd" items="${dsDaThanhToan}">
                            <tr>
                                <td class="text-center fw-bold">${hd.maHoaDon}</td>
                                <td>${hd.hoTen}</td>
                                <td>${hd.ngayMua}</td>
                                <td class="text-center">
                                    <span class="badge bg-success">Đã hoàn tất</span>
                                </td>
                                <td class="text-center">
                                    <a href="chiTietController?mahd=${hd.maHoaDon}"
                                       class="btn btn-info btn-sm">
                                        Xem chi tiết
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty dsDaThanhToan}">
                            <tr>
                                <td colspan="5" class="text-center text-muted py-4">
                                    Chưa có hóa đơn nào được thanh toán.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <div class="text-end mt-3">
                <a href="adminController" class="btn btn-secondary">
                    ← Quay lại trang chủ Admin
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
