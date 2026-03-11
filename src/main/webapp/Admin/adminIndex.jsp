<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Quản lý</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="adminController">ADMIN</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="adminController">Đơn hàng hôm nay</a></li>
                <li class="nav-item"><a class="nav-link" href="adminLoaiController">Quản lý loại</a></li>
                <li class="nav-item"><a class="nav-link" href="sachAdminController">Quản lý sách</a></li>
                <li class="nav-item"><a class="nav-link" href="adminXacnhanController">Xác nhận đơn</a></li>
                <li class="nav-item"><a class="nav-link" href="adminDaThanhToanController">Hóa đơn đã thanh toán</a></li>
            </ul>
            
            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${empty sessionScope.admin}">
                        <li class="nav-item">
                            <a class="nav-link fw-bold text-white" href="Admin/adminLogin.jsp">Đăng nhập</a>
                        </li>
                    </c:when>
                    <c:otherwise>
<%--                         <li class="nav-item">
                            <span class="navbar-text text-white me-3">Xin chào, ${sessionScope.admin}</span>
                        </li> --%>
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
        <h2 class="text-center mb-4">DANH SÁCH ĐƠN HÀNG HÔM NAY</h2>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Mã Hóa Đơn</th>
                    <th>Tên Khách Hàng</th>
                    <th>Ngày Mua</th>
                    <th>Trạng Thái</th>
                    <th>Chi Tiết</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hd" items="${dsHoadon}">
                    <tr>
                        <td>${hd.maHoaDon}</td>
                        <td>${hd.hoTen}</td>
                        <td>${hd.ngayMua}</td>
                        <td>
					               <c:choose>
					    <c:when test="${hd.daMua}">
					        <span class="badge bg-success">Đã thanh toán</span>
					    </c:when>
					    <c:otherwise>
					        <span class="badge bg-warning text-dark">Chờ xác nhận</span>
					    </c:otherwise>
</c:choose>
                        </td>
                        <td><a href="${pageContext.request.contextPath}/chiTietController?mahd=${hd.maHoaDon}"
   class="btn btn-info btn-sm">
    Xem
</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>