<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<body class="main">
<%@ include file="top.jsp" %>

<%
	CustomerService customerService = new CustomerServiceImp();
	
	Integer id = Integer.parseInt(request.getParameter("id"));
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String sex = request.getParameter("sex");
	String answer = request.getParameter("answer");
	String question = request.getParameter("question");


	Customer customer = new Customer();
	customer.setId(id);
	customer.setEmail(email);
	customer.setName(name);
	customer.setPassword(password);
	customer.setAddress(address);
	customer.setPhone(phone);
	customer.setSex(sex);
	customer.setAnswer(answer);
	customer.setQuestion(question);
	
	customerService.updateCustomer(customer);
	
%>

		<div id="divpagecontent">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td width="25%">
						<table width="100%" border="0" cellspacing="0"
							style="margin-top: 30px">
							<tr>
								<td class="listtitle">
									我的帐户
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="modifyuserinfo.html">用户信息修改</a>
								</td>
							</tr>

							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="orderlist.html">订单查询</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="#">帐户余额</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="#">我的收藏</a>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<div style="text-align: right; margin: 5px 10px 5px 0px">
							<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
							<a href="my.html">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;修改成功
						</div>

						<table cellspacing="0" class="infocontent">
							<tr>
								<td style="padding: 20px; text-align: center">
									<table width="70%" border="0" cellspacing="0"
										style="margin-top: 70px">
										<tr>
											<td style="width: 98">
												<img src="../images/success.gif" width="98" height="119" />
											</td>
											<td style="padding-top: 30px">
												<font style="font-weight: bold; color: #FF0000">您的用户信息修改成功！</font>
												<br />
												<br />
												<a href="my.html">返回我的帐户</a>
											</td>
										</tr>
									</table>
									<p>
										&nbsp;
									</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>


		<%@ include file="bottom.jsp" %>
</body>
</html>
