<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>
<meta http-equiv="Content-Script-Type" content="text/javascript"/>
<meta http-equiv="imagetoolbar" content="no"/>
<meta name="description" content=""/>
<meta name="keywords" content=""/>
<title>admin画面</title>
<style type="text/css">
body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing;1px;
	font-family:Verdana,Helvetica,sans-serif;
	font-size:12px;
	background:#efefef;
}

h1
{
	color:black;
}

.loginbox input[type=submit]
{	width:200px;
	border:none;
	outline:none;
	height:40px;
	background:#fb2525;
	color:#fff;
	font-size:18px;
	border-radius:10px;
}

.loginbox input[type="submit"]:hover
{
	cursor:pointer;
	background:#ffc107;
	color:#000;
}

#top{
	width:100px;
	margin: 0 auto;
	color:#000;
	text-align:center;
}

#top h1{
	border-bottom:1px solid black;	
}

#header{
	width:100%;
	height:80px;
	
}

#main{
	width:;
	height:500px;

}

#footer{
	width:100%;
	height:80px;
	
	clear:both;
}

.loginbox{
	width:600px;
	background:lightgray;
	height:200px;
	position:relative;
	margin:0 auto;
}



.box{
	position:absolute;
	top:0;
	left:0;
	padding:10px;
	color:#fff;
	box-sizing:border-box;
	text-align:center;
	width:300px;
}

.box2{
	position:absolute;
	top:0;
	right:0;
	padding:10px;
	color:#fff;
	box-sizing:border-box;
	text-align:center;
	width:300px;
}

.logout p{
	text-align:center;
	font-size:12px;
	position:absolute;
	top:50%;
	right:45%;
	color:black;
	
}

.logout a:hover{
	color:#ffc107;
}

</style>
</head>
<body>
	<div id="header">
		<div id="pr">
		</div>
	</div>
	<div id="main">
		<div id="top">
			<h1>ADMIN</h1>
		</div>
		 <div class="loginbox">
		<div class="box">
		 <h1>PRODUCT</h1>
			<s:form action="ItemCreateAction">
					<input type="submit" value="New Create">
			</s:form>
			
			<s:form action="ItemListAction">
					<input type="submit" value="Product List">
			</s:form>
		</div>
		<div class="box2">
		 <h1>USER</h1>
			<s:form action="UserCreateAction">
					<input type="submit" value="New Create">
			</s:form>
			
			<s:form action="UserListAction">
					<input type="submit" value="User List">
			</s:form>
			</div>
		</div>	
	</div>
	<div class="logout">
	
<%-- 		<s:if test="#session.id !=null"> --%>
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
<%-- 			</s:if> --%>
	</div>
	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>