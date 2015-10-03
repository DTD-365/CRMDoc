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
									分类
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">计算机</a>
								</td>
							</tr>

							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">外语</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">艺术</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">经管</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">人文社科</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">少儿</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">生活</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp"> 进口原版</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">科技</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">考试</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">励志</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">学术</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">小说</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">古籍</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">哲学</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">旅游</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">法律</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">宗教</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">历史</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">地理</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">政治</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">军事</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">心理学</a>
								</td>
							</tr>
							<tr>
								<td class="listtd">
									<img src="../images/miniicon.gif" width="9" height="6" />
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="product_list.jsp">传记</a>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<div style="text-align: right; margin: 5px 10px 5px 0px">
							<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;旅游&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;图书列表
						</div>

						
						<% 
							BookService bookService = new BookServiceImp();
							List<Book> booklist =  bookService.queryBook("");
						
						%>

						<table cellspacing="0" class="listcontent">
							<tr>
								<td>
									<h1>
										商品目录
									</h1>
									<hr />
									<h1>
										计算机类
									</h1>
									&nbsp;&nbsp;&nbsp;&nbsp;共<%= booklist.size()%>种商品
									<hr />
									<img src="../images/miniicon2.gif" />
									&nbsp;&nbsp;&nbsp;&nbsp;计算机类的子分类&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;JAVA&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;ASP.NET&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;网站设计&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;图形处理

									<div style="margin-top: 20px; margin-bottom: 5px">
										<img src="../images/productlist.gif" width="631" height="38" />
									</div>

									<table cellspacing="0" class="booklist">
									
										<tr>
										<%
											
											for(int i=0; i<booklist.size(); i++) {
											Book book = (Book)booklist.get(i);
										%>								
											<td>
												<div class="divbookpic">
													<p>
														<a href="info.jsp?id=<%=book.getId()%>"><img src="../<%=book.getImage_url() %>" width="115" height="129" border="0"/></a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="info.jsp?id=<%=book.getId()%>"><%=book.getTitle() %><br /> 售价： <%=book.getPrice() %> </a>
												</div>
											</td>
										<%
												if((i+1)%4==0){
										%>	
										</tr>
										<tr>											
										<%
												}
											}
										%>	
										
										</tr>
									</table>


									<div class="pagination">
										<ul>
											<li class="disablepage">
												<< 上一页
											</li>

										<%
											int pageNum = (int)(booklist.size()/3);
											System.out.println("++++pageNum++++" + pageNum);
											for(int i=0; i<pageNum; i++) {
										%>

											<li class="currentpage">
												<a href="#"><%=i%></a>
											</li>

										<%
											}
										%>	
											
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
		</div>


		<%@ include file="bottom.jsp" %>
</body>
</html>
