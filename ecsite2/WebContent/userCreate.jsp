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
<title>UserCreate画面</title>
<style type="text/css">
body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing;1px;
	font-family:sans-serif;
	font-size:16px;
	color:#777;
	background:#efefef;
}

#login-box
{
    position: relative;
    margin:0 auto;
    height: 400px;
    background: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.6);
    width: 600px;
}

.left-box
{
    position: absolute;
    top:0;
    left:0;
     width: 300px;
     padding:40px;
     box-sizing:border-box;
}



h1
{
    margin: 0 0 20px 0;
    font-weight: 300;
    font-size: 28px;
}

input[type="text"],
input[type="password"]
{
    display: block;
    box-sizing: border-box;
    margin-bottom: 20px;
    padding: 4px;
    width:220px;
    height:32px;
    border:none;
    outline:none;
    border-bottom: 1px solid #aaa;
    font-family: sans-serif;
    font-size: 15px;
}

input[type="submit"]
{
    margin-bottom: 22px;
    width: 120px;
    height: 32px;
    background:#f44336;
    border:none;
    border-radius:4px;
    color:#fff;
    font-family:sans-serif;
    text-transform:uppercase;
    cursor:pointer;
}

input[type="submit"]:hover
{
	background:orange;
}

.or
{
	position:absolute;
	top:180px;
	left:280px;
	width:40px;
	height:40px;
	background:#efefef;
	border-radius:50%;
	box-shadow:0 2px 4px rgba(0,0,0,0.6);
	line-height:40px;
}

.right-box
{
    position: absolute;
    top:0;
    right:0;
     width: 300px;
     padding:40px;
     box-sizing:border-box;
     display:block;
     font-size:28px;
     margin-bottom:40px;
     text-shadow:0 2px 4px rgba(0,0,0,0.3);
}

.signinwith
{
	display:block;
}

button
{
	margin:20px 0;
	width:220px;
	height:36px;
	border:none;
	border-radius:4px;
	font-family:sans-serif;
	cursor:pointer;
	color:white;
}

.facebook
{
	background:#3B5998;
}

.twitter
{
	background:#1DA1F2;
}

.google
{
	background:#DB4437;
}





#top{
	width:780px;
	margin:30px auto;
	border:1px solid #333;
}

#header{
	width:100%;
	height:80px;
}

#main{
	width:100%;
	height:500px;
	text-align:center;
}
#footer{
	width:100%;
	height:80px;
	clear:both;
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
			<p>UserCreate</p>
		</div>
		<div>
			<s:if test="errorMessage!=''">
				<s:property value="errorMessage" escape="false"/>
			</s:if>
		
			<s:form action="UserCreateConfirmAction">
				<div id="login-box">
					<div class="left-box">
						<h1>Sign Up</h1>
						<input type="text" name="loginUserId" placeholder="Login id" value=""/>
						<input type="password" name="loginPassword" placeholder="Password" value=""/>
						<input type="text" name="userName" placeholder="Username" value=""/>
						<input type="submit" value="Sign up"/>
					</div>
					<div class="right-box">
            <span class="signinwith">Sign in with<br/>Social Network</span>
            
            <button class="social facebook">Login with Facebook</button>
            <button class="social twitter">Login with Twitter</button>
            <button class="social google">Login with Google+</button>
        </div>
        <div class="or">OR</div>
				</div>
			</s:form>
			
			<div>
				<span>前画面に戻る場合は</span>
				<a href='<s:url action="AdminAction"/>'>こちら</a>
			</div>
		</div>	
	</div>
	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>