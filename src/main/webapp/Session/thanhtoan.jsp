<%@page import="Model.GioHang"%>
<%@page import="Model.GioHangBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; margin-top: 20px; }
        .navbar .nav-link { color: white !important; margin-right: 10px; }
        .navbar .nav-link:hover { color: #ffc107 !important; }
        
        /* Sidebar styling đồng bộ với ảnh mẫu */
        .category-list { background: white; border-radius: 8px; overflow: hidden; }
        .category-item { 
            border-bottom: 1px solid #eee !important; 
            padding: 12px 15px;
            color: #0d6efd;
            text-decoration: none;
            display: block;
        }
        .category-item:hover { background-color: #f1f1f1; }

        .table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 25px;
        }
        th { background-color: #0d6efd; color: white; text-align: center; }
        td { text-align: center; vertical-align: middle; }
        .total-section { 
            background: #fff3cd; 
            padding: 20px; 
            border-radius: 12px; 
            border: 1px solid #ffeeba; 
            margin-top: 25px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="tcController">Trang chủ</a></li>
            <li class="nav-item"><a class="nav-link" href="giohangController">Giỏ hàng</a></li>
            <li class="nav-item"><a class="nav-link active" href="#">Thanh toán</a></li>
            <li class="nav-item"><a class="nav-link" href="HtlichsuController">Lịch sử mua hàng</a></li>
            
            <c:if test="${empty username}">
                <li class="nav-item"><a class="nav-link" href="dangnhapController">Đăng nhập</a></li>
            </c:if>
            <c:if test="${not empty username}">
                <li class="nav-item"><a class="nav-link" href="#">Chào mừng ${username.hoten}!</a></li>
                <li class="nav-item"><a class="nav-link" href="dangxuatController">Đăng xuất</a></li>
            </c:if>
        </ul>
        <form class="d-flex" action="tcController" method="post">
            <input class="form-control me-2" type="text" name="txttk" placeholder="Tìm kiếm sách...">
            <button class="btn btn-primary" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container-fluid px-4">
    <div class="row">
        <div class="col-sm-3">
            <div class="category-list border shadow-sm">
                <c:forEach var="L" items="${dsloai}">
                    <a href="tcController?ml=${L.maloai}" class="category-item">
                        ${L.tenloai}
                    </a>
                </c:forEach>
            </div>
        </div>

        <div class="col-sm-9">
            <div class="table-container">
                <h2 class="text-center mb-4 text-primary fw-bold">XÁC NHẬN THÔNG TIN ĐƠN HÀNG</h2>
                
                <table class="table table-bordered table-hover shadow-sm">
                    <thead>
                        <tr>
                            <th style="width: 45%">Tên sách</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            GioHangBO gh = (GioHangBO)session.getAttribute("gh");
                            if(gh != null && gh.getDs().size() > 0) {
                                for(GioHang h : gh.getDs()) {
                        %>
                        <tr>
                            <td class="text-start ps-4"><%=h.getTensach()%></td>
                            <td><span class="badge bg-light text-dark border px-3 py-2"><%=h.getSoluong()%></span></td>
                            <td><fmt:formatNumber value="<%=h.getGia()%>" pattern="#,##0"/> ₫</td>
                            <td class="fw-bold text-primary">
                                <fmt:formatNumber value="<%=h.getThanhtien()%>" pattern="#,##0"/> ₫
                            </td>
                        </tr>
                        <%      } 
                            } else { %>
                        <tr><td colspan="4" class="py-5 text-muted">Giỏ hàng trống.</td></tr>
                        <% } %>
                    </tbody>
                </table>
                
                <div class="total-section d-flex justify-content-between align-items-center">
                    <div>
                        <h4 class="mb-1">Tổng cộng thanh toán:</h4>
                        <span class="display-6 text-danger fw-bold">
                            <fmt:formatNumber value="<%= (gh != null) ? gh.Tong() : 0 %>" pattern="#,##0"/> ₫
                        </span>
                    </div>
                    <div>
                        <a href="htgioController" class="btn btn-outline-secondary me-2 px-4 py-2">Quay lại giỏ hàng</a>
                        <a href="lichsumuasachController?action=confirm" class="btn btn-success btn-lg px-5 shadow">
                            XÁC NHẬN ĐẶT HÀNG
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>