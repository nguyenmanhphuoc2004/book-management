<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Quản lý Sách - Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.navbar-nav .nav-link {
color: rgba(255, 255, 255, 0.7) !important;
}
.img-preview {
width: 50px;
height: 70px;
object-fit: cover;
border-radius: 4px;
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
				<a class="nav-link active" href="sachAdminController">Quản lý sách</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="adminXacnhanController">Xác nhận đơn</a>
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
	                        <span class="navbar-text text-white me-3 d-none d-md-inline">Xin chào, Admin</span>
	                        <a href="adminDangXuatController" class="btn btn-outline-light btn-sm">Đăng xuất</a>
	                    </li>
	                </c:otherwise>
	            </c:choose>
	        </ul>
	    </div>
	</div>
</nav>

<div class="container-fluid mt-4">
<h3 class="text-center mb-4 fw-bold">HỆ THỐNG QUẢN LÝ SÁCH</h3>

<div class="row">
    <!-- Form nhập liệu bên trái -->
    <div class="col-md-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Thông tin sách</h5>
            </div>
            <div class="card-body">
                <form action="sachAdminController" method="post">
                    <div class="mb-2">
                        <label class="form-label small fw-bold">Mã sách</label>
                        <input type="text" name="txtmasach" class="form-control" placeholder="Mã sách" required>
                    </div>
                    <div class="mb-2">
                        <label class="form-label small fw-bold">Tên sách</label>
                        <input type="text" name="txttensach" class="form-control" placeholder="Tên sách" required>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-2">
                            <label class="form-label small fw-bold">Số lượng</label>
                            <input type="number" name="txtsoluong" class="form-control" placeholder="Số lượng" required>
                        </div>
                        <div class="col-6 mb-2">
                            <label class="form-label small fw-bold">Giá bán</label>
                            <input type="number" name="txtgia" class="form-control" placeholder="Giá" required>
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label small fw-bold">Loại sách</label>
                        <select name="txtmaloai" class="form-select">
                            <c:forEach var="l" items="${dsloai}">
                                <option value="${l.maloai}">${l.tenloai}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-2">
                        <label class="form-label small fw-bold">Tác giả</label>
                        <input type="text" name="txttacgia" class="form-control" placeholder="Tác giả">
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Ảnh bìa</label>
                        <input type="file" name="txtanh" class="form-control">
                    </div>
                    <div class="d-grid gap-2">
                        <button name="tab" value="add" class="btn btn-primary">Thêm mới</button>
                        <button name="tab" value="edit" class="btn btn-success">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <div class="col-md-8">
        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover mb-0">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>Ảnh</th>
                                <th>Mã sách</th>
                                <th>Tên sách</th>
                                <th>Giá</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="s" items="${dssach}">
                                <tr class="align-middle">
                                    <td class="text-center">
                                        <img src="${s.anh}" class="img-preview shadow-sm border" onerror="this.src='https://via.placeholder.com/50x70?text=No+Image'">
                                    </td>
                                    <td class="text-center fw-bold text-secondary">${s.masach}</td>
                                    <td>${s.tensach}</td>
                                    <td class="text-end fw-bold text-danger">${s.gia} đ</td>
                                    <td class="text-center">
                                        <a href="sachAdminController?tab=delete&txtmasach=${s.masach}" 
                                           class="btn btn-outline-danger btn-sm"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa sách này?')">
                                           Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty dssach}">
                                <tr>
                                    <td colspan="5" class="text-center py-4 text-muted">Không có dữ liệu sách nào.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</div>

<!-- Bootstrap JS Bundle -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>