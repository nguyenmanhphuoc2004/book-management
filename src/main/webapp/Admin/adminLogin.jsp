<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-dark text-white text-center"><h3>Đăng nhập Admin</h3></div>
                    <div class="card-body">
                        <form action="/Buoi5/adminController" method="post">
                            <div class="mb-3">
                                <label>Tên đăng nhập:</label>
                                <input type="text" name="txtun" class="form-control" required>
                            </div>
                            <div class="mb-3">	
                                <label>Mật khẩu:</label>
                                <input type="password" name="txtpw" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                        </form>
                        <c:if test="${not empty error}">
                            <div class="text-danger mt-2 text-center">${error}</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>