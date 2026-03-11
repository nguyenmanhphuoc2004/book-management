<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Xác nhận hóa đơn</title>
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
	<a class="nav-link" href="adminLoaiController">Quản lý loại</a>
	</li>
	<li class="nav-item">
	<a class="nav-link" href="sachAdminController">Quản lý sách</a>
	</li>
	<li class="nav-item">
	<a class="nav-link active" href="adminXacnhanController">Xác nhận đơn</a>
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
                        <a href="adminDangXuatController" class="btn btn-outline-light btn-sm">Đăng xuất</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>


</nav>


<div class="container mt-4">
<div class="d-flex justify-content-between align-items-center mb-4">
<h3 class="text-dark fw-bold text-center w-100">DANH SÁCH ĐƠN HÀNG CHỜ XÁC NHẬN</h3>
</div>

<div class="card shadow-sm border-0">
    <div class="card-body p-0">
        <table class="table table-hover table-bordered mb-0">
            <thead class="table-dark text-center">
                <tr>
                    <th width="15%">Mã Hóa Đơn</th>
                    <th width="35%">Tên Khách Hàng</th>
                    <th width="25%">Ngày Mua</th>
                    <th width="25%">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hd" items="${dsChuaXN}">
                    <tr class="align-middle text-center">
                        <td class="fw-bold text-primary">${hd.maHoaDon}</td>
                        <td class="text-start">${hd.hoTen}</td>
                        <td>${hd.ngayMua}</td>
                        <td>
                            <a href="adminXacNhanController?mhd=${hd.maHoaDon}" 
                               class="btn btn-success btn-sm px-3" 
                               onclick="return confirm('Xác nhận khách đã thanh toán hóa đơn này?')">
                               Xác nhận thanh toán
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty dsChuaXN}">
                    <tr>
                        <td colspan="4" class="text-center py-5 text-muted italic">
                            <p class="mb-0">Hiện không có đơn hàng nào chờ xác nhận.</p>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>