<%@ page import="tam.CGioHang" %>
<%@page import="Model.Sach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.SachBO"%>
<%@page import="tam.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>


<body class="container mt-4">
	
	<a href="tcController">Trang chủ</a>

	<h2 class="text-primary">Đặt Hàng</h2>
	<form method="post" action="giohangController" class="mb-4">
	    <div class="mb-3">
	        <label class="form-label">Tên hàng</label>
	        <input type="text" class="form-control" name="txtth" value="<%=(session.getAttribute("tensach") != null ? session.getAttribute("tensach") : "") %>" >
	    </div>
	    <div class="mb-3">
	        <label class="form-label">Giá</label>
	        <input type="text" class="form-control" name="txtgia" value="<%=(session.getAttribute("giasach") != null ? session.getAttribute("giasach") : "") %>" >
	    </div>
	    <div class="mb-3">
	        <label class="form-label">Số lượng</label>
	        <input type="text" class="form-control" name="txtsl" value="<%=(session.getAttribute("soluong") != null ? session.getAttribute("soluong") : "") %>">
	    </div>
	    <button type="submit" class="btn btn-success" name="un1" value="Dat Hang">Đặt Hàng</button>
	</form>


<!-- 			Giỏ hàng -->
	<h3 class="mt-4">Giỏ hàng</h3>
	<%
	if(session.getAttribute("gh") != null){
	    CGioHang g=(CGioHang)session.getAttribute("gh");
	    int sh=g.ds.size();
	    if(sh>0){
	%>
	<form method="post" action="giohangController" accept-charset="UTF-8">
	<table class="table table-bordered table-striped">
	    <thead>
	        <tr>
	            <th>Chọn</th>
	            <th>Tên hàng</th>
	            <th>Giá</th>
	            <th>Số lượng</th>
	            <th>Thành tiền</th>
	            <th>Hành động</th>
	        </tr>
	    </thead>
	    <tbody>
	    <%for(int i=0;i<sh;i++){ %>
	        <tr>
	            <td><input type="checkbox" name="chonxoa" value="<%=g.ds.get(i).getTenhang()%>"></td>
	            <td><%=g.ds.get(i).getTenhang() %></td>
	            <td><%=g.ds.get(i).getGia() %></td>
	            
	            <td>
				   <div class="d-flex align-items-center">
				        <!-- Số lượng cũ (nằm bên trái) -->
				        <span class="me-4" ><%=g.ds.get(i).getSoluong() %></span>
				
				        <!-- Form sửa (nằm bên phải) -->
				        <form method="post" action="sua.jsp" class="d-flex ms-2">
				        	<input type="hidden" name="th" value="<%=g.ds.get(i).getTenhang()%>">
				            <input type="text" name="txtsua" class="form-control form-control-sm" style="width:100px">
				            <button type="submit" class="btn btn-warning btn-sm">Sửa</button>
				        </form>
				   </div>
				</td>
	
	            <td><%=g.ds.get(i).getThanhtien()%></td>
	            <td>
	                <a href="giohangController?xoa=<%=g.ds.get(i).getTenhang()%>" class="btn btn-danger btn-sm">Xóa</a>
	            </td>
	        </tr>
	    <%}%>
	    </tbody>
	</table>
	
	<div class="d-flex justify-content-between">
	    <div>
	        <button type="submit" class="btn btn-outline-danger">Xóa các mặt hàng đã chọn</button>
	        <a href="giohangController?xoatatca=1" class="btn btn-danger">Xóa tất cả</a>
	    </div>
	    <div class="fw-bold fs-5">Tổng tiền: <%=g.Tongtien()%> VNĐ</div>
	</div>
	</form>
	<%
	    } else {
	%>
	<div class="alert alert-info">Giỏ hàng trống.</div>
	<% }
	} %>
</body>
</html>
