<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.ebook.model.Book" %>
<%@page import="com.ebook.model.Cart" %>
<%@page import="com.ebook.model.OrderDetail" %>
<%@page import="com.ebook.service.BookService" %>    
<%@page import="com.ebook.service.serviceImp.BookServiceImp" %>  
<%@page import="com.ebook.model.SessionContainer" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Integer id = Integer.parseInt(request.getParameter("id"));
		BookService bookService = new BookServiceImp();
		Book book =  bookService.getBook(id);

		SessionContainer sessionContainer = (SessionContainer)session.getAttribute("sessionContent");
		Cart cart = null;
		if (sessionContainer.getCart()!=null){
			
			cart = sessionContainer.getCart();
			
			OrderDetail anOrderDetail = new OrderDetail();
			anOrderDetail.setBook(book);
			anOrderDetail.setQuantity(1);
			
			cart.addOrderDetail(anOrderDetail);
		
		} else {
		
			cart = new Cart();
			
			OrderDetail anOrderDetail = new OrderDetail();
			anOrderDetail.setBook(book);
			anOrderDetail.setQuantity(1);
			
			cart.addOrderDetail(anOrderDetail);
			sessionContainer.setCart(cart);
			session.setAttribute("sessionContent", sessionContainer);
		}

		request.getRequestDispatcher("cart.jsp").forward(request,response);
		//response.sendRedirect("cart.jsp");
	 %>
</body>
</html>