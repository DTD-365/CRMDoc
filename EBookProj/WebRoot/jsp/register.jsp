<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function doRegister1(){
		document.getElementById("mainForm").submit();
	}
	
	function doRegister2(){
		//alert("1---" + document.forms["main"].password.value);
		//alert("2---" + document.main.name.value);
		//alert("3---"+document.forms[0]);
		document.main.submit();
	}
</script>

</head>

<body class="main">

<%@ include file="top.jsp" %>

<form name="main" id="mainForm" action="registersuccess.jsp" method="post">
<div id="divcontent">

<table width="850px" border="0" cellspacing="0">
  <tr>
    <td style="padding:30px"><h1>新会员注册</h1>
    
					<table width="70%" border="0" cellspacing="2" class="upline">
						<tr>
							<td style="text-align: right; width: 20%">
								会员邮箱：
							</td>
							<td style="width: 40%">
								<input type="text" class="textinput" name="email"/>
							</td>
							<td>
								<img src="../images/check_use.gif" width="111" height="24" />
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								会员名：
							</td>
							<td>
								<input type="text" class="textinput"  name="name"/>
							</td>
							<td>
								<img src="../images/check_use.gif" width="111" height="24" />
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								密码：
							</td>
							<td>
								<input type="password" class="textinput"  name="password"/>
							</td>
							<td>
								<font color="#999999">密码设置至少6位，请区分大小写</font>
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								重复密码：
							</td>
							<td>
								<input type="password" class="textinput" name="repassword"/>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								性别：
							</td>
							<td colspan="2">
								&nbsp;&nbsp;
								<input type="radio" name="sex" value="M" />男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sex" value="F" />女
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								联系方式：
							</td>
							<td colspan="2">
								<input type="text" class="textinput" name="phone"/>
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								发货地址：
							</td>
							<td colspan="2">
								<input type="text" class="textinput" style="width: 350px" name="address"/>
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>

					<h1>密码保护信息 (以下信息用于取回密码以及处理其他帐户问题，请您慎重填写并牢记)</h1>
					<table width="70%" border="0" cellspacing="2" class="upline">
						<tr>
							<td width="16%" style="text-align: right; width: 20%">
								密码保护问题：
							</td>
							<td width="47%" style="width: 50%">
								<select class="textinput" style="width: 230px; height: 20px" name="question">
									<option value="0">
										- 选择一个问题 -
									</option>
									<option value="1">
										您的宠物的名字？
									</option>
									<option value="2">
										您就读的第一所学校的名称？
									</option>
									<option value="3">
										少年时代心目中的英雄是谁？
									</option>
									<option value="4">
										您最喜欢的休闲运动是什么？
									</option>
									<option value="5">
										您最喜欢哪支运动队？
									</option>
									<option value="6">
										您最喜欢的运动员是谁？
									</option>
									<option value="7">
										您的第一辆汽车或自行车是什么牌子的？
									</option>
								</select>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								答案：
							</td>
							<td colspan="2">
								<input type="text" class="textinput" name="answer"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<font color="#999999">不能少于4个字符，不区分大小写</font>
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								备用邮箱：
							</td>
							<td>
								<input type="text" class="textinput" name="backupmail"/>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td style="text-align: right">
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>


					<h1>注册校验</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">
									输入校验码：
								</td>
								<td style="width: 50%">
									<input type="text" class="textinput" name="checkcode"/>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td style="text-align: right">
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>

						<h1>服务条款</h1>
						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td>
									<textarea name="textarea" class="textarea" name="servicecondition"></textarea>
								</td>
							</tr>
						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center">
									<a href="javascript:doRegister1();">
									<img src="../images/signup.gif" border="0"/>
									</a>
								</td>
								<td style="padding-top: 20px; text-align: center">
									<a href="registersuccess.jsp">
									<img src="../images/signup.gif" border="0" onclick="doRegister2();"/>
									</a>
								</td>
								
							</tr>
						</table>
		</td>	
	</tr>
</table>

</div>
</form>

<%@ include file="bottom.jsp" %>

</body>
</html>
