<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.box {
	max-width: 450px;
	margin: 60px auto;
	padding: 25px;
	border-radius: 10px;
	background: #fff;
}
</style>
</head>

<body class="bg-light">

<div class="box shadow">
	<h4 class="text-center mb-4">Đăng ký</h4>

	<form action="dangkiController" method="post">

		<div class="mb-3">
			<label>Họ tên</label>
			<input type="text" name="hoten" class="form-control" required>
		</div>

		<div class="mb-3">
			<label>Tên đăng nhập</label>
			<input type="text" name="tendn" class="form-control" required>
		</div>

		<div class="mb-3">
			<label>Mật khẩu</label>
			<input type="password" name="matkhau" class="form-control" required>
		</div>

		<button class="btn btn-success w-100">
			Đăng ký
		</button>
	</form>

	<div class="text-center mt-3">
		Đã có tài khoản?
		<a href="dangnhapController">Đăng nhập</a>
	</div>
</div>

</body>
</html>
