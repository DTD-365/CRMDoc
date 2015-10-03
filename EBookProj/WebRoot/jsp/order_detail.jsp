<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.ebook.model.Order" %>
<%@page import="com.ebook.model.OrderDetail" %>
<%@page import="com.ebook.service.OrdersService" %> 
<%@page import="com.ebook.service.serviceImp.OrdersServiceImp" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta content="all" name="robots" />
		<meta name="author" content="Fisher" />
		<meta name="Copyright"
			content="Copyright 2007-2008, 版权所有 www.reefdesign.cn" />
		<meta name="description" content="reefdesign" />
		<meta name="keywords" content="reefdesign" />
		<title>电子书城</title>
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" rev="stylesheet" href="../css/style.css"
			type="text/css" media="all" />
	</head>
	
<%@include file="top.jsp" %>
	
	<body class="main">

		<div id="divpagecontent">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td width="25%">
						<table width="100%" border="0" cellspacing="0"
							style="margin-top: 30px">
							<tr>
								<td class="listtitle"> 
									这是你这个订单的 详细信息 
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="orderlist.jsp">>>返回订单查询</a>
								</td>
							</tr>

						</table>
					</td>
					<td>
						<div style="text-align: right; margin: 5px 10px 5px 0px">
							<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
							<a href="#product_list.html">&nbsp;旅游</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;大勇和小花的欧洲日记
						</div>
						<%
							Integer orderid = Integer.parseInt(request.getParameter("orderid"));
							Order order = new Order();
							order.setId(orderid);
							OrdersService orderService = new OrdersServiceImp();
							List<OrderDetail> orderDetailList = orderService.getOrderDetail(order);
						 %>
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
									<img src="../ad/page_ad.jpg" width="645" height="84" />
									<%
										for(OrderDetail orderDetail:orderDetailList){
									 %>
									<table width="100%" border="0" cellspacing="0">
										<tr>
											<td width="30%">

												<div class="divbookcover">
													<p>
														<img src="../<%=orderDetail.getBook().getImage_url() %>" />
													</p>
												</div>
											
											</td>
											<td style="padding: 20px 5px 5px 5px">
												<img src="../images/miniicon3.gif" width="16" height="13" />
												<font class="bookname">&nbsp;&nbsp;<%=orderDetail.getBook().getTitle() %></font>
												<hr />
												作者：<%=orderDetail.getBook().getAuthor() %>
												<hr />
												售价：
												<font color="#FF0000">￥<%=orderDetail.getBook().getPrice() %></font>&nbsp;&nbsp;&nbsp;&nbsp;
												<hr />
												购买数量：<%=orderDetail.getQuantity() %>
												<hr />
												出版社：<%=orderDetail.getBook().getPublisher() %>
												<hr />
												<p>
													<b>内容简介：</b>
												</p>
												<%=orderDetail.getBook().getDescription() %>
											</td>
										</tr>
									</table>
									<%} %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

<%@include file="bottom.jsp" %>


	</body>
</html>
