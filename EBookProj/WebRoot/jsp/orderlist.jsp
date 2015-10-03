<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.ebook.model.Customer" %>
<%@page import="com.ebook.model.Order" %>
<%@page import="com.ebook.model.SessionContainer" %>       
<%@page import="com.ebook.service.OrdersService" %> 
<%@page import="com.ebook.service.serviceImp.OrdersServiceImp" %>  

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

	<%
		OrdersService ordersService = new OrdersServiceImp();
	
		Object obj = session.getAttribute("sessionContent");
		Customer customer = new Customer();
		List<Order> resultOrderList = new ArrayList<Order>();
		if ((obj!=null) && (obj instanceof SessionContainer)){
			SessionContainer sessionContainer = (SessionContainer)obj;
			customer = sessionContainer.getCustomer();
			
			resultOrderList = ordersService.getOrder(customer);
		} 
	%>

<%@ include file="top.jsp" %>

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
									<a href="modifyuserinfo.jsp">用户信息修改</a>
								</td>
							</tr>

							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="orderlist.jsp">订单查询</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="news.jsp">帐户余额</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="news.jsp">我的收藏</a>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<div style="text-align: right; margin: 5px 10px 5px 0px">
							<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
							<a href="my.html">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单查询
						</div>
						<table cellspacing="0" class="infocontent">
							<tr>
								<td style="padding: 20px">
									<p>
										欢迎XXX光临XXX商城！
									</p>
									<p>
										您已经成交了3笔交易，有
										<font style="color: #FF0000">1</font>项交易正在处理中...
									</p>
									<table width="100%" border="0" cellspacing="0"
										class="tableopen">
										<tr>
											<td bgcolor="#A3E6DF" class="tableopentd01">
												订单号
											</td>
											<td bgcolor="#A3E2E6" class="tableopentd01">
												总价
											</td>
											<td bgcolor="#A3D7E6" class="tableopentd01">
												收件人
											</td>
											<td bgcolor="#A3CCE6" class="tableopentd01">
												订单时间
											</td>
											<td bgcolor="#A3B6E6" class="tableopentd01">
												状态
											</td>
										</tr>
										
										<%
											for(Order order : resultOrderList) {
														
										%>
										
										
										<tr>
											<td class="tableopentd02">
												<a href="order_detail.jsp?orderid=<%=order.getId()%>"><%=order.getOrder_number() %></a>
											</td>
											<td class="tableopentd02">
												<%=order.getTotal_price()%>
											</td>
											<td class="tableopentd02">
												<%=customer.getName()%>
											</td>
											<td class="tableopentd02">
												<%=order.getCreated_at()%>
											</td>
											<td class="tableopentd03">
												<%=order.getStatus() %>
											</td>
										</tr>
										
										<%
											}
										%>
										

									</table>
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
