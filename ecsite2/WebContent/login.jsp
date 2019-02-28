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
<title>Login画面</title>
<style type="text/css">
body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing;1px;
	font-family:sans-serif;
	font-size:12px;
	color:#333;
 	background-image:url(img/photo.jpg);
 	background-size:cover;
 	background-position:center;
}

.avatar{
	width:100px;
	height:100px;
	border-radius:;
	position:absolute;
	top:-10%;
	left:calc(50% - 50px);
}

.loginbox{
	width:320px;
	height:400px;
	background:gray;
	color:#fff;
	top:380px;
	left:50%;
 	position:absolute;
 	transform:translate(-50%,-50%);
	box-sizing:border-box;
	padding:70px 30px;
	}

h1{
	margin:0;
	padding:0;
	text-align:center;
	font-size:22px;
}

.loginbox p{
	margin:0;
	padding:0;
	font-weight:bold;
}

.loginbox input{
	width:100%;
	margin-bottom:20px;
}
.loginbox input[type="text"],input[type="password"]
{
	border:none;
	border-bottom:1px solid #fff;
	background:transparent;
	outline:none;
	height:40px;
	color:#fff;
	font-size:16px;
}

.loginbox input[type="submit"]
{
	border:none;
	outline:none;
	height:40px;
	background:#fb2525;
	color:#fff;
	fontsize:18px;
	border-radius:20px;
}

.loginbox input[type="submit"]:hover
{
	cursor:pointer;
	background:#ffc107;
	color:#000;
}

.loginbox2 p{
	text-decoration:none;
	font-size:12px;
	line-height:20px;
	color:#fff;
}

.loginbox2 a:hover{
	color:#ffc107;
}


#top{
}

#header{

}

#main{
	text-align:center;
}
#footer{

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

		</div>
		<div>
		<div class="loginbox">
		<img src="img/icon.png" class="avatar">
			<h1>Login Here</h1>
			<s:form action="LoginAction">
					<p>Username</p>
					<input type="text" name="loginUserId" placeholder="Enter Username">
					<p>Password</p>
					<input type="password" name="loginPassword" placeholder="Enter Password">
					<input type="submit" name="" value="Login">

			<div class="loginbox2">
				<p>新規ユーザー登録は<a href='<s:url action="UserCreateAction"/>'>こちら</a></p>
				<p>Homeへ戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>
					</div>
				</s:form>
			</div>
			</div>
		</div>

	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>