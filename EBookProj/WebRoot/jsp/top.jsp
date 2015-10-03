<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
	<div id="divhead">
		<table cellspacing="0" class="headtable">
			<tr>
				<td>
					<img src="../images/logo.gif" width="95" height="30" />
				</td>
				<td style="text-align: right">
					<img src="../images/cart.gif" width="26" height="23" style="margin-bottom: -4px" />&nbsp;
					<a href="cart.jsp">购物车</a> |
					<a href="#">帮助中心</a> |
					<a href="my.jsp">我的帐户</a> |
					<a href="register.jsp">新用户注册</a>
				</td>
			</tr>
		</table>
	</div>

	<div id="divmenu">
	<a href="product_list.html">文学</a>　　
	<a href="product_list.html">生活</a>　　
	<a href="product_list.html">计算机</a>　　
	<a href="product_list.html">外语</a>　　
	<a href="product_list.html">经管</a>　　
	<a href="product_list.html">励志</a>　　
	<a href="product_list.html">社科</a>　　
	<a href="product_list.html">学术</a>　　
	<a href="product_list.html">少儿</a>　　
	<a href="product_list.html">艺术</a>　　
	<a href="product_list.html">原版</a>　　
	<a href="product_list.html">科技</a>　　
	<a href="product_list.html">考试</a>　　
	<a href="product_list.html">生活百科</a>　　
	<a href="product_list.jsp" style="color:#FFFF00">全部商品目录</a>
	</div>
	
	<div id="divsearch">
		<form action="search.jsp" method="post" name="searchForm">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td style="text-align: right; padding-right: 220px">
					Search
					<input type="text" name="keyword" class="inputtable" />
					<a href="javascript:validate();"><img src="../images/serchbutton.gif" border="0" style="margin-bottom: -4px"/></a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script type="text/javascript">
		
		function validate(){
			if (document.searchForm.keyword.value=="") {
				alert("please input keyword");
				return;
			}
			document.searchForm.submit();
		}
	</script>
	
	
	
	
	
	
	
