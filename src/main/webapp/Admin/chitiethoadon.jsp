<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết hóa đơn - Admin</title>
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
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/adminController">ADMIN</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminController">Đơn hàng hôm nay</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminLoaiController">Quản lý loại</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/sachAdminController">Quản lý sách</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/adminXacnhanController">Xác nhận đơn</a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto">
                <li class="nav-item d-flex align-items-center">
                    <span class="navbar-text text-white me-3 d-none d-md-inline">
                        Xin chào, Admin
                    </span>
                    <a href="${pageContext.request.contextPath}/adminDangXuatController"
                       class="btn btn-outline-light btn-sm">
                        Đăng xuất
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="text-center fw-bold mb-4">
        CHI TIẾT HÓA ĐƠN 
    </h3>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-dark text-center">
                        <tr>
                            <th>Mã Hóa Đơn</th>
        					<th>Mã Sách</th>
                            <th>Tên sách</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ct" items="${dsChiTiet}">
                            <tr>
                               	<td>${ct.maHoaDon}</td>
           						<td>${ct.maSach}</td>
                                <td>${ct.tenSach}</td>
                                <td class="text-center">${ct.soLuong}</td>
                                <td class="text-end text-danger fw-bold">
                                    ${ct.gia} đ
                                </td>
                                <td class="text-end fw-bold">
                                    ${ct.thanhTien} đ
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty dsChiTiet}">
                            <tr>
                                <td colspan="4" class="text-center text-muted py-4">
                                    Không có chi tiết hóa đơn.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <div class="text-end mt-3">
                <a href="${pageContext.request.contextPath}/adminController"
                   class="btn btn-secondary">
                    ← Quay lại
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
