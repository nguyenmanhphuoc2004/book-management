<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<title>Quản lý Loại Sách</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container-fluid">
<a class="navbar-brand fw-bold" href="adminController">ADMIN</a>
<div class="collapse navbar-collapse">
<ul class="navbar-nav me-auto">
<li class="nav-item"><a class="nav-link" href="adminController">Đơn hàng hôm nay</a></li>
<li class="nav-item"><a class="nav-link active" href="adminLoaiController">Quản lý loại</a></li>
<li class="nav-item"><a class="nav-link" href="sachAdminController">Quản lý sách</a></li>
<li class="nav-item"><a class="nav-link" href="adminXacnhanController">Xác nhận đơn</a></li>
</ul>

        <ul class="navbar-nav ms-auto">
            <c:choose>
                <c:when test="${empty sessionScope.admin}">
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-white" href="Admin/adminLogin.jsp">Đăng nhập</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a href="adminDangXuatController" class="btn btn-outline-light btn-sm">Đăng xuất</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>


</nav>

<div class="container mt-4">
<h3 class="text-center mb-4 fw-bold">QUẢN LÝ LOẠI SÁCH</h3>

<div class="card mb-4 shadow-sm">
    <div class="card-body">
        <form action="adminLoaiController" method="post">
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Mã loại</label>
                    <input type="text" name="txtmaloai" class="form-control" placeholder="Nhập mã loại" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Tên loại</label>
                    <input type="text" name="txttenloai" class="form-control" placeholder="Nhập tên loại" required>
                </div>
                <div class="col-md-4 d-flex align-items-end gap-2">
                    <button type="submit" name="tab" value="add" class="btn btn-primary flex-fill">Thêm</button>
                    <button type="submit" name="tab" value="edit" class="btn btn-success flex-fill">Cập nhật</button>
                </div>
            </div>
        </form>
    </div>
</div>

<table class="table table-hover table-bordered">
    <thead class="table-dark">
        <tr>
            <th>Mã Loại</th>
            <th>Tên Loại</th>
            <th width="150">Thao tác</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="l" items="${dsloai}">
            <tr>
                <td>${l.maloai}</td>
                <td>${l.tenloai}</td>
                <td class="text-center">
                    <a href="adminLoaiController?tab=delete&txtmaloai=${l.maloai}" 
                       class="btn btn-danger btn-sm" onclick="return confirm('Xóa loại này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


</div>
</body>
</html>