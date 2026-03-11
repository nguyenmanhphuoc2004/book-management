<%@page import="Model.GioHang"%>
<%@page import="Model.GioHangBO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sach"%>
<%@page import="Model.SachBO"%>
<%@page import="Model.Loai"%>
<%@page import="Model.LoaiBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Mua sách online</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
        margin-top: 20px; 
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
</style>
  
</head>

<!-- giohangController, JSTL sẽ dùng như JSP: biến của JSTL file jsp sẽ dùng lại ko cần request -->
<!-- thymeleaf -->
<!-- đăng nhập 3 lần đưa ra captcha -->
<!-- kết nối csdl -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!-- JSTL -->
<%-- 	<c:if test="${not empty username}">
	    Chào mừng bạn ${username}!
	</c:if> --%>

<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	  <div class="container-fluid">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="tcController">Công ty sách</a>
	      </li>
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
	        <a class="nav-link" href="HtlichsuController">Lịch sử mua hàng</a>
	      </li>
	      
	      <c:if test="${empty username}">
		     <li class="nav-item">
		       <a class="nav-link" href="dangnhapController">Đăng nhập</a>
		     </li>
		     <li class="nav-item">
		<a class="nav-link" href="dangkiController">Đăng ký</a>
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
	        <div class="row">
	        
<!--         lấy danh sách sách -->
				<c:forEach var="S" items="${dssach}">
		        	<div class="col-sm-3">
			        	<img src ="${S.getAnh()}"> <br>
			        	${S.getTensach()} <br>
			        	${S.getTacgia()} <br>
			        	${S.getGia()} <br>
			        	<a href="giohangController?masach=${S.getMasach()}&&tensach=${S.getTensach()}&&gia=${S.getGia()}&&anh=${S.getAnh()}"><img src="Session/buynow.jpg"></a>
		        	</div>
				</c:forEach>
	        </div>
        </div>


        
    </div>
	
</body>
</html>