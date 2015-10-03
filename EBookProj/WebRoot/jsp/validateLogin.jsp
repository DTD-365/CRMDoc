<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.ebook.model.Customer" %>
<%@page import="com.ebook.model.SessionContainer" %>       
<%@page import="com.ebook.service.CustomerService" %>    
<%@page import="com.ebook.service.serviceImp.CustomerServiceImp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = (String)request.getParameter("name");
		String pwd = (String)request.getParameter("password");
		CustomerService customerService = new CustomerServiceImp();
	
		Customer customer = customerService.getCustomer(name,pwd);
		if (customer==null||customer.getId()==null) {

	%>
			<script type="text/javascript" >
				alert("用户名或者密码错误！");
				window.history.go(-1);
			</script>

	<%
		} else {
		
			if(session.isNew()||(session.getAttribute("sessionContent")==null)) {
				SessionContainer sessionContainer = new SessionContainer();
				sessionContainer.setCustomer(customer);
				session.setAttribute("sessionContent", sessionContainer);
				
			} else {
				
				((SessionContainer)session.getAttribute("sessionContent")).setCustomer(customer);
			}
			response.sendRedirect("my.jsp");
		}
	%>

</body>
</html>