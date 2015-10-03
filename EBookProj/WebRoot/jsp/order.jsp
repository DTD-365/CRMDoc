<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.ebook.model.Cart" %>
<%@page import="com.ebook.model.OrderDetail" %>
<%@page import="com.ebook.model.SessionContainer" %> 
<%@page import="com.ebook.model.Customer" %>    

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

<script type="text/javascript">
	function doJiezhang(){
		document.getElementById("orderForm").submit();
	}

</script>

</head>

<%
	Object scObj = session.getAttribute("sessionContent");
	Customer customer = new Customer();
	if ((scObj!=null) && (scObj instanceof SessionContainer)){
		SessionContainer sessionContainer = (SessionContainer)scObj;
		customer = sessionContainer.getCustomer();
		if (customer == null || customer.getId()==null) {
			response.sendRedirect("login.jsp");
		}
	}
%>


<body class="main">
<%@ include file="top.jsp" %>

		<div id="divpagecontent">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td width="25%">
						<table width="100%" border="0" cellspacing="0"
							style="margin-top: 30px">
							<tr>
								<td class="listtitle">
									配送方式、时间及费用
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="news.html">普通快递送货上门</a>
								</td>
							</tr>

							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="news.html">特快专递送货上门(EMS)</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="news.html">申通快递送货上门</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="news.html">普通邮寄</a>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<div style="text-align: right; margin: 5px 10px 5px 0px">
							<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
							<a href="cart.html">&nbsp;购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
						</div>
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0">
										<tr>
											<td>
												<img src="../images/buy2.gif" width="635" height="38" />
												<p>
													早上好：XXX先生！欢迎您来到商城结算中心
												</p>
											</td>
										</tr>
										<tr>
											<td>
											
												<form id="orderForm" name="orderForm" action="orderfinal.jsp" method="post">											
												<table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">
															序号
														</td>
														<td width="40%">
															商品名称
														</td>
														<td width="10%">
															市场价
														</td>
														<td width="10%">
															优惠价
														</td>
														<td width="10%">
															数量
														</td>
														<td width="10%">
															小计
														</td>
													</tr>
												</table>
												
											<% 
												Object obj = session.getAttribute("sessionContent");
												Cart cart = null;
												if ((obj!=null) && (obj instanceof SessionContainer)){
													SessionContainer sessionContainer = (SessionContainer)obj;
													cart = sessionContainer.getCart();
												
													if (cart != null && cart.totalOrderDetailSize()>0) {
	
														List<OrderDetail> anOrderDetailList = cart.getOrderDetails();
														for(int i=0; i<cart.totalOrderDetailSize(); i++) {
															OrderDetail anOrderDetail = (OrderDetail)anOrderDetailList.get(i);
															
															String str = "quantity" + anOrderDetail.getBook().getId();
															String quantityValue = request.getParameter(str); 
															
															anOrderDetail.setQuantity(Integer.parseInt(quantityValue));
														
											%>										
															
												<input id="rowid" name="bookid" type="hidden" value="<%=anOrderDetail.getBook().getId() %>"/>
												
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">
															<%=i+1 %>
														</td>
														<td width="40%">
															<%=anOrderDetail.getBook().getTitle() %>
														</td>
														<td width="10%">
															<%=anOrderDetail.getBook().getPrice() %>
														</td>
														<td width="10%">
															<%=anOrderDetail.getBook().getPrice()*0.5 %>
														</td>
														<td width="10%">
															<input name="quantity<%=anOrderDetail.getBook().getId()%>" type="text" value="<%= quantityValue %>" style="width: 20px" />
														</td>
														<td width="10%">
															<%=(anOrderDetail.getBook().getPrice()*0.5)*(anOrderDetail.getQuantity()) %>
														</td>
													</tr>
												</table>
												
											<% 
														} 
													}
												}
											%>														
												
												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align: right; padding-right: 40px;">
															<font style="color: #FF0000">合计：&nbsp;&nbsp;<%=cart.calculateTotalPrice() %>元</font>
														</td>
													</tr>
												</table>
												
												<p>
													收货地址：
													<input name="text" type="text" value="<%=customer==null ? "" : customer.getAddress() %>" style="width: 350px" />
													&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#">【确认】</a>
													<br />
													收货人：&nbsp;&nbsp;&nbsp;&nbsp;
													<input name="text" type="text" value="<%=customer==null ? "" : customer.getName() %>"	style="width: 150px" />
													&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#">【确认】</a>
													<br />
													联系方式：
													<input name="text" type="text" value="<%=customer==null ? "" : customer.getPhone() %>" style="width: 150px" />
													&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#">【确认】</a>

												</p>
												<hr />
												<p style="text-align: right">
													<a href="javascript:doJiezhang();"><img src="../images/gif53_029.gif" width="204" height="51" border="0" /></a>
												</p>


												</form>

											</td>
										</tr>
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
