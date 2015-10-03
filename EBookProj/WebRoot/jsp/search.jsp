<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="com.ebook.model.Book" %>
<%@page import="com.ebook.service.BookService" %>    
<%@page import="com.ebook.service.serviceImp.BookServiceImp" %>  

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

		<div id="divpagecontent">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td width="25%">
						<table width="100%" border="0" cellspacing="0"
							style="margin-top: 30px">
							<tr>
								<td class="listtitle">
									缩小搜索范围
								</td>
							</tr>

							<tr>
								<td class="listtd">
									<br />
									<p>
										关键字：
										<input type="text" name="textfield2" class="inputtable" />
									</p>

									<p>
										类&nbsp;&nbsp;&nbsp;&nbsp;别：
										<select name="select">
											<option value="文学">
												文学
											</option>
											<option value="生活">
												生活
											</option>
											<option value="艺术">
												艺术
											</option>
											<option value="经管">
												经管
											</option>
											<option value="人文社科">
												人文社科
											</option>
										</select>
									</p>
									<p style="text-align: center">
										<input name="确定" type="submit" class="inputbutton" value="提交" />
									</p>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<div style="text-align: right; margin: 5px 10px 5px 0px">
							<a href="index.html">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;公告新闻&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;文章标题
						</div>
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0">
										<tr>
											<td style="padding: 10px">
												以下
												<strong>3617</strong> 条结果按
												<strong>销量</strong> 排列 每页显示
												<strong>20</strong>条
												<hr />
												
												<% 
													String keyword = request.getParameter("keyword");
													BookService bookService = new BookServiceImp();
													List<Book> booklist =  bookService.queryBook(keyword);

													for(int i=0; i<booklist.size(); i++) {
													Book book = (Book)booklist.get(i);
												%>													
												<table border="0" cellspacing="0" class="searchtable">
													<tr>
														<td width="20%" rowspan="2">
															<div class="divbookpic">
																<p>
																	<a href="info.jsp?id=<%=book.getId()%>"><img src="../bookcover/dayongxiaohua.jpg" width="115" height="129" border="0" /></a>
																</p>
															</div>
														</td>
														<td colspan="2">
															<font class="bookname"><%=book.getTitle()%></font>
															<br />
															作者：<%=book.getAuthor()%> 著
															<br />
															<%=book.getDescription()%>
														</td>
													</tr>
													<tr>
														<td>
															售价：
															<font color="#FF0000">￥<%=book.getPrice()%></font>&nbsp;&nbsp;&nbsp;&nbsp;原价：
															<s>￥30.00</s>
														</td>
														<td style="text-align: right">
															<a href="cart.jsp?id=<%=book.getId()%>"><img src="../images/buy.gif" width="91" height="27" border="0" style="margin-bottom: -8px" /></a>
														</td>
													</tr>
												</table>

		
												<%
													}
												%>	



												<div class="pagination">
													<ul>
														<li class="disablepage">
															<< 上一页
														</li>
														<li class="currentpage">
															1
														</li>
														<li>
															<a href="#">2</a>
														</li>
														<li>
															<a href="#">3</a>
														</li>
														<li>
															<a href="#">4</a>
														</li>
														<li>
															<a href="#">5</a>
														</li>
														<li>
															<a href="#">6</a>
														</li>
														<li>
															<a href="#">7</a>
														</li>
														<li>
															<a href="#">8</a>
														</li>
														<li>
															<a href="#">9</a>...
														</li>
														<li>
															<a href="#">15</a>
														</li>
														<li>
															<a href="#">16</a>
														</li>
														<li class="nextpage">
															<a href="#">下一页 >></a>
														</li>
													</ul>
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
</html>
