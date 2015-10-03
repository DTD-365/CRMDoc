<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.ebook.model.Book" %>
<%@page import="com.ebook.model.Cart" %>
<%@page import="com.ebook.model.Customer" %>
<%@page import="com.ebook.model.OrderDetail" %>
<%@page import="com.ebook.model.Order" %>
<%@page import="com.ebook.service.BookService" %>    
<%@page import="com.ebook.service.serviceImp.BookServiceImp" %>  
<%@page import="com.ebook.model.SessionContainer" %> 

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
		document.getElementById("cartForm").submit();
	}

</script>

</head>


<%
	Object scObj = session.getAttribute("sessionContent");
	Customer customer = null;
	Cart cart = null;
	if ((scObj!=null) && (scObj instanceof SessionContainer)){
		SessionContainer sessionContainer = (SessionContainer)scObj;
		customer = sessionContainer.getCustomer();
		cart = sessionContainer.getCart();
		if (customer == null || customer.getId()==null || cart == null) {
			response.sendRedirect("login.jsp");
		}
	} else {
		response.sendRedirect("login.jsp");
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
							<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
						</div>
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
									<img src="../ad/page_ad.jpg" width="666" height="89" />
									
									
									<table width="100%" border="0" cellspacing="0">
										<tr>
											<td>
												<img src="../images/buy1.gif" width="635" height="38" />
											</td>
										</tr>
										
										<tr>
											<td>
											
												<form id="cartForm" name="cartForm" action="order.jsp" method="post">
												
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

														<td width="10%">
															取消
														</td>
													</tr>
												</table>
												
											<% 

												if (cart != null && cart.totalOrderDetailSize()>0) {

													List<OrderDetail> anOrderDetailList = cart.getOrderDetails();
													for(int i=0; i<cart.totalOrderDetailSize(); i++) {
														OrderDetail anOrderDetail = (OrderDetail)anOrderDetailList.get(i);
														
											%>	

												<input id="ID<%=i+1 %>" name="NM<%=i+1 %>" type="hidden" value="<%=i+1 %>"/>
												
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
															<div id="price<%=i+1 %>"><%=anOrderDetail.getBook().getPrice()*0.5 %></div>
														</td>
														<td width="10%">
															<input 
																id="qid<%=anOrderDetail.getBook().getId()%>" 
																name="quantity<%=anOrderDetail.getBook().getId()%>" 
																type="text" 
																value="<%=anOrderDetail.getQuantity() %>" 
																style="width: 20px" 
																onblur="updateSmallPrice(<%=i+1 %>, <%=cart.totalOrderDetailSize()%>,<%=anOrderDetail.getBook().getId()%>,<%=anOrderDetail.getBook().getPrice()*0.5 %>, cartForm);" 
																/>
														</td>
														<td width="10%">
															<div id="smallPrice<%=i+1 %>"><%=(anOrderDetail.getBook().getPrice()*0.5)*(anOrderDetail.getQuantity()) %></div>
														</td>

														<td width="10%">
															<a href="delete.jsp?id=<%=anOrderDetail.getBook().getId()%>" style="color: #FF0000; font-weight: bold">X</a>
														</td>
													</tr>
												</table>

											<% 
													}
													
											%>
												
												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align: right; padding-right: 40px;">
															<font style="color: #FF6600; font-weight: bold">合计：&nbsp;&nbsp;<font id="totalPrice" ><%=cart.calculateTotalPrice() %></font>元</font>
														</td>
													</tr>
												</table>
												
											<%		
												}
											%>		
											
												</form>
												
												<div style="text-align: right; margin-top: 10px">
													<a href="product_list.jsp"><img src="../images/gwc_jx.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="javascript:doJiezhang();"><img src="../images/gwc_buy.gif" border="0"/></a>
												</div>
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

	<script type="text/javascript">
		
		function updateSmallPrice(rownum, totalrow, bookID, price, cartForm){
			var inputedString=document.getElementById("qid"+bookID).value;
			str=/^[0-9]*$/;
			if(str.test(inputedString)){
				
				document.getElementById("smallPrice"+rownum).innerText = (inputedString * price).toFixed(1);
				document.getElementById("totalPrice").innerText = (calculateTotalPrice(totalrow)).toFixed(1);
				
				document.cartForm.action='updateQuantity.jsp?id='+bookID;
				document.cartForm.submit();
				
				return;
			}else{
				alert("请输入数字！");
			}
		}		
		
		function calculateTotalPrice(totalrow){
			var totalPrice = 0;
			for(var i=1; i<=totalrow; i++) {
				totalPrice = totalPrice + parseFloat(document.getElementById("smallPrice"+i).innerText);
			}
			return totalPrice;
		}
	</script>

</html>
