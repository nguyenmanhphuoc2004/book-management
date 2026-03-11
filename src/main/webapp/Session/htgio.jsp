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


<%

	response.setCharacterEncoding("UTF-8");
%>

<body>

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
	        <a class="nav-link" href="thanhtoanController">Thanh toán</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="lichsumuasachController">Lịch sử mua hàng</a>
	      </li>
	      
	     <c:if test="${empty username}">
		     <li class="nav-item">
		       <a class="nav-link" href="dangnhapController">Đăng nhập</a>
		     </li>
	      </c:if>
	      <!-- JSTL -->
		  <c:if test="${not empty username}">
			<li class="nav-item"style >
			 <a class="nav-link" href="">Chào mừng bạn ${username.hoten}!</a>
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
	        	<h2> Danh sách các mặt hàng trong giỏ</h2>
				<%
					GioHangBO gh=(GioHangBO)session.getAttribute("gh");
					if(gh!=null){
				%>
				<form method="post" action="suaxoaController" accept-charset="UTF-8">
					<table class="table table-bordered table-striped">
					    <thead>
					        <tr>
					            <th>Chọn</th>
					            <th>Ảnh</th>
					            <th>Tên hàng</th>
					            <th>Giá</th>
					            <th>Số lượng</th>
					            <th>Thành tiền</th>
					            <th>Hành động</th>
					        </tr>
					    </thead>
					    <tbody>
					    
					    <% for(GioHang h: gh.getDs()){  %>
					        <tr>
					            <td><input type="checkbox" name="chonxoa" value="<%=h.getMasach()%>"></td>
				             	<td><img src="<%=h.getAnh()%>" width="50"/></td>	 
					            <td><%=h.getTensach() %></td>
					            <td><%=h.getGia() %></td>
					            
					            <td>
								   <div class="d-flex align-items-center">
								        <!-- Số lượng cũ (nằm bên trái) -->
								        <span class="me-4" ><%=h.getSoluong() %></span>
								
								        <!-- Form sửa (nằm bên phải) -->
								        <input type="number" min="1" name=<%=h.getMasach() %> style="width:50px" >
								        <button type="submit" name="butsua" value="<%=h.getMasach() %>">
								        +
								        </button>
								   </div>
								</td>
					
					            <td><%=h.getThanhtien()%></td>
					            <td>
					                <a href="suaxoaController?xoa=<%=h.getMasach()%>" class="btn btn-danger btn-sm">Xóa</a>
					            </td>
					        </tr>
				    <%}%>
					    </tbody>
					</table>
						
		<div class="d-flex justify-content-between align-items-center mt-3">
    
			    <!-- Nhóm nút xóa -->
			    <div>
			        <button type="submit" class="btn btn-outline-warning me-2">
			            Xóa đã chọn
			        </button>
			
			        <a href="suaxoaController?xoatatca=1"
			           class="btn btn-danger"
			           onclick="return confirm('Bạn có chắc chắn muốn xóa toàn bộ giỏ hàng?')">
			           Xóa tất cả
			        </a>
			    </div>
			
			    <!-- Tổng tiền + nút mua -->
					<div class="d-flex align-items-center">
					    <div class="fw-bold fs-5 me-3 text-danger">
					        Tổng tiền: <%=gh.Tong()%> VNĐ
					    </div>
					    <a href="thanhtoanController" class="btn btn-success btn-lg px-4">Mua</a>
					</div>
					</div>
				</form>
				<%
					}else {
						out.print("Giỏ hàng rỗng"); 
					}
				%>
	        </div>
        </div>
    </div>
	
</body>
</html>