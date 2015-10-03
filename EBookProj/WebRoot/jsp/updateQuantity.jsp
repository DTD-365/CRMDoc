<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.ebook.model.Cart" %>
<%@page import="com.ebook.model.SessionContainer" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"+id).trim());
		Cart cart = ((SessionContainer)session.getAttribute("sessionContent")).getCart();
		
		if (cart !=null ) {
			cart.updateQuantity(id,quantity);
		}
		response.sendRedirect("cart.jsp");
	 %>
</body>
</html>