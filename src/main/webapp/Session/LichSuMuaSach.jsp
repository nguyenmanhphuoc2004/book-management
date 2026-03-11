<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="Model.LichSuMuaSach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử mua hàng</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

    body {
        background-color: #f8f9fa;
        margin-top : 20px;
    }
    .navbar .nav-link {
        color: white !important;
        margin-right: 10px;
    }

    .navbar .nav-link:hover {
        color: #ffc107 !important; 
    }

    .navbar-brand {
        color: white !important;
        font-weight: bold;
    }
    .table-container {
        margin: 40px auto;
        width: 90%;
        max-width: 1100px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        padding: 20px;
    }
    th {
        background-color: #0d6efd;
        color: white;
        text-align: center;
    }
    td {
        text-align: center;
        vertical-align: middle;
    }
    .badge-damua {
        background-color: #28a745;
    }
    .badge-chuamua {
        background-color: #dc3545;
    }
</style>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<body>

 <%=request.getAttribute("ketqua") %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	  <div class="container-fluid">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="tcController">Trang chủ</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="giohangController">Giỏ hàng</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Thanh toán</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Lịch sử mua hàng</a>
	      </li>
	      
	     <c:if test="${empty username}">
		     <li class="nav-item">
		       <a class="nav-link" href="dangnhapController">Đăng nhập</a>
		     </li>
	      </c:if>
	      <!-- JSTL -->
		  <c:if test="${not empty username}">
			<li class="nav-item"style >
			 <a class="nav-link" href="">Chào mừng bạn ${username}!</a>
	     	</li>
		  </c:if>
	      
	      <li class="nav-item">
	        <a class="nav-link" href="dangxuatController">Đăng xuất</a>
	      </li>
	    </ul>
	    
	    <form class="d-flex" action="tcController" method="post">
	    	<input class="form-control me-2" type="text" name="txttk" placeholder="Search">
	    	<button class="btn btn-primary" type="submit" >Search</button>
	    </form>
	  </div>
	</nav>
	
	
	<div class="row">
        <!-- Cột bên trái -->
        <div class="col-sm-3">
        
<!--         lấy danh sách loại -->
       		<c:forEach var="L" items="${dsloai}">
       			<a href="tcController?ml=${L.getMaloai()}">${L.getTenloai()}<hr> </a>
       		</c:forEach>
       		
        </div>
        
  <!-- 	<!-- Cột bên phải -->
        <div class="col-sm-9 ">
	        <div class="table-container">
			    <h2 class="text-center mb-4 text-primary">Lịch sử mua hàng</h2>
			
			    <table class="table table-bordered table-hover align-middle">
			        <thead>
			            <tr>
			                <th>Mã KH</th>
			                <th>Tên sách</th>
			                <th>Giá</th>
			                <th>Số lượng mua</th>
			                <th>Thành tiền</th>
			                <th>Đã mua</th>
			                <th>Ngày mua</th>
			            </tr>
			        </thead>
			        <fmt:setLocale value="vi_VN" />
			        <tbody>
			            <c:choose>
			                <c:when test="${not empty lsms}">
			                    <c:forEach var="item" items="${lsms}">
			                        <tr>
			                            <td>${item.getMakh()}</td>
			                            <td>${item.getTensach()}</td>
			                            <td><fmt:formatNumber value="${item.getGia()}" pattern="#,##0" /> ₫</td>
			                            <td>${item.getSoluongmua()}</td>
			                            <td><fmt:formatNumber value="${item.getThanhtien()}" type="currency" currencySymbol="₫" /></td>
			                            <td>
			                                <c:choose>
			                                    <c:when test="${item.isDamua()}">
			                                        <span class="badge badge-damua">Đã mua</span>
			                                    </c:when>
			                                    <c:otherwise>
			                                        <span class="badge badge-chuamua">Chưa mua</span>
			                                    </c:otherwise>
			                                </c:choose>
			                            </td>
			                            <td><fmt:formatDate value="${item.getNgaymua()}" pattern="dd/MM/yyyy" /></td>
			                        </tr>
			                    </c:forEach>
			                </c:when>
			                <c:otherwise>
			                    <tr>
			                        <td colspan="7" class="text-center text-muted">Không có dữ liệu lịch sử mua hàng</td>
			                    </tr>
			                </c:otherwise>
			            </c:choose>
			        </tbody>
			    </table>
			</div>
        </div>
    </div>




<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
 --%>
 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử mua hàng</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f8f9fa;
        margin-top: 20px;
    }

    .navbar .nav-link {
        color: white !important;
        margin-right: 10px;
    }

    .navbar .nav-link:hover {
        color: #ffc107 !important;
    }

    .table-container {
        margin: 40px auto;
        width: 90%;
        max-width: 1100px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        padding: 20px;
    }

    th {
        background-color: #0d6efd;
        color: white;
        text-align: center;
    }

    td {
        text-align: center;
        vertical-align: middle;
    }

    .badge-damua {
        background-color: #28a745;
    }

    .badge-chuamua {
        background-color: #dc3545;
    }
</style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="tcController">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="giohangController">Giỏ hàng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#">Lịch sử mua hàng</a>
            </li>

            <c:if test="${empty username}">
                <li class="nav-item">
                    <a class="nav-link" href="dangnhapController">Đăng nhập</a>
                </li>
            </c:if>

            <li class="nav-item">
                <a class="nav-link" href="dangxuatController">Đăng xuất</a>
            </li>
        </ul>

        <form class="d-flex" action="tcController" method="post">
            <input class="form-control me-2" type="text" name="txttk" placeholder="Search">
            <button class="btn btn-primary" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="row">
    <!-- MENU TRÁI -->
    <div class="col-sm-3 p-3">
        <c:forEach var="L" items="${dsloai}">
            <a href="tcController?ml=${L.maloai}" class="d-block mb-2">
                ${L.tenloai}
            </a>
            <hr>
        </c:forEach>
    </div>

    <!-- NỘI DUNG PHẢI -->
    <div class="col-sm-9">
        <div class="table-container">
            <h2 class="text-center mb-4 text-primary">Lịch sử mua hàng</h2>

            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Mã KH</th>
                        <th>Tên sách</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Trạng thái</th>
                        <th>Ngày mua</th>
                    </tr>
                </thead>

                <fmt:setLocale value="vi_VN"/>

                <tbody>
                    <c:choose>
                        <c:when test="${not empty lsms}">
                            <c:forEach var="item" items="${lsms}">
                                <tr>
                                    <td>${item.makh}</td>
                                    <td>${item.tensach}</td>
                                    <td>
                                        <fmt:formatNumber value="${item.gia}" pattern="#,##0"/> ₫
                                    </td>
                                    <td>${item.soluongmua}</td>
                                    <td>
                                        <fmt:formatNumber value="${item.thanhtien}" pattern="#,##0"/> ₫
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.damua}">
                                                <span class="badge badge-damua">Đã mua</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-chuamua">Chưa mua</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${item.ngaymua}" pattern="dd/MM/yyyy"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>

                        <c:otherwise>
                            <tr>
                                <td colspan="7" class="text-center text-muted">
                                    Không có dữ liệu lịch sử mua hàng
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 