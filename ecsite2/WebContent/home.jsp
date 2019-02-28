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
<title>Home画面</title>
<style type="text/css">
body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing;1px;
	font-family:Verdana,Helvetica,sans-serif;
	font-size:12px;
	color:#333;
	background:#fff;
}
table{
	margin:0 auto;
}


#top{
	width:780px;
	margin:30px auto;
	border:1px solid #333;
}

#header{
	width:100%;
	height:80px;
	background-color:black;
}

#main{
	width:100%;
	height:500px;
	text-align:center;
}
#footer{
	width:100%;
	height:80px;
	background-color:black;
	clear:both;
}



.loginbox{
	width:400px;
	height:200px;
	position:relative;
	margin:0 auto;
}

.btn{
	border:1px solid black;
	padding:10px 30px;
	color:black;
	margin-right:5px;
	font-size:13px;
	text-decoration:none;
	font-family:sans-serif;
}

.btn-one{
	background-color:darkorange;
	position:absolute;
	top:0;
	left:0;
}
.btn-two{
	position:absolute;
	top:0;
	left:100px;
}
.btn-two:hover{
	background-color:darkorange;
	transition:all 0.5s ease-in;
}

.btn-three{
	position:absolute;
	top:0;
	left:220px;
}

.btn-three:hover{
	background-color:black;
	transition:all 0.5s ease-in;
	color:white;
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
			<p>Home</p>
		</div>
	<div class="loginbox">
			<s:form action="HomeAction">
					<a href="http://localhost:8080/ecsite2/HomeAction.action" class="btn btn-one">Buy</a>
			</s:form>

			<s:form action="AdminAction">
					<a href="http://localhost:8080/ecsite2/admin.jsp" class="btn btn-two">Admin</a>
			</s:form>

			<s:form action="InquiryAction">
					<a href="http://localhost:8080/ecsite2/inquiry.jsp" class="btn btn-three">Contact</a>
			</s:form>

			<s:form action="CartAction">
					<a href="http://localhost:8080/ecsite2/cart.jsp" class="btn btn-four">Cart</a>
			</s:form>
	</div>
			<s:if test="#session.id !=null">
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
			</s:if>
	</div>
	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>