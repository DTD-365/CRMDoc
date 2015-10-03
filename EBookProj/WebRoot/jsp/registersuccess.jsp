<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.ebook.model.Customer" %>    
<%@page import="com.ebook.service.CustomerService" %>    
<%@page import="com.ebook.service.serviceImp.CustomerServiceImp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="all" name="robots"/>
<meta name="author" content="Fisher" />
<meta name="Copyright" content="Copyright 2007-2008, 版权所有 www.reefdesign.cn" />
<meta name="description" content="reefdesign" />
<meta name="keywords" content="reefdesign" />
<title>电子书城</title>
<link rel="shortcut icon" href="favicon.ico" >
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
</head>

<%
	CustomerService service = new CustomerServiceImp(); 
	String name = request.getParameter("name");
	
	Integer resultID = (service.getCustomer(name)).getId();
	if(resultID!=null) {
%>
	<script type="text/javascript" >
		alert("此用户已经有人使用了，请换一个！");
		window.history.go(-1);
	</script>
<%		
	} else {

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String sex = request.getParameter("sex");
	String answer = request.getParameter("answer");
	String question = request.getParameter("question");

	Customer customer = new Customer();
	customer.setAddress((null==address)?" ":address); 
	customer.setQuestion((null==question)?" ":question); 
	customer.setAnswer((null==answer)?" ":answer); 
	customer.setEmail((null==email)?" ":email); 
	customer.setName((null==name)?" ":name); 
	customer.setPassword((null==password)?" ":password); 
	customer.setPhone((null==phone)?" ":phone); 
	customer.setSex((null==sex)?" ":sex); 

	service.updateCustomer(customer);
	
	}
%>

<body class="main">
<%@ include file="top.jsp" %>


<div id="divcontent">
<table width="850px" border="0" cellspacing="0">
  <tr>
    <td style="padding:30px; text-align:center"><table width="60%" border="0" cellspacing="0" style="margin-top:70px">
      <tr>
        <td style="width:98"><img src="../images/IconTexto_WebDev_009.jpg" width="128" height="128" /></td>
        <td style="padding-top:30px"><font style="font-weight:bold; color:#FF0000">注册成功</font><br />
            <br />
          <a href="index.html">5秒后自动为您转跳回首页</a></td>
      </tr>
    </table>
    <h1>&nbsp;</h1></td>
    </tr>
</table>
</div>

<%@ include file="bottom.jsp" %>

</body>
</html>
