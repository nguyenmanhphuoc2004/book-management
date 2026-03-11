<%@page import="tam.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; 
	charset=ISO-8859-1">
	<title>Insert title here</title>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    CGioHang g = (CGioHang)session.getAttribute("gh");
    String th = request.getParameter("th");
    String sl = request.getParameter("txtsua");

    if(th != null && sl != null){
        int soLuongMoi = Integer.parseInt(sl);
        g.SuaSoLuong(th, soLuongMoi);
        session.setAttribute("gh", g);
    }
    response.sendRedirect("DatHang.jsp");
	%>
</body>
</html>