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
<title>buyItem画面</title>
<style type="text/css">
body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing:1px;
	font-family:Verdana,Helvetica,sans-serif;
	font-size:12px;
	color:#333;
	background:#fff;
}
table{
	text-align:center;
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

table.inputTable-mini {
	margin: 30px;
	width: calc(100% - 60px);
	border-collapse: separate;
	border-spacing: 0;

	text-align: left;
	line-height: 1.5em;

	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
}

table.inputTable-mini th:first-child {
  border-radius: 5px 0 0 0;
}

table.inputTable-mini th:last-child {
  border-radius: 0 5px 0 0;
  border-right: 1px solid #3c6690;
}

table.inputTable-mini th {
	padding: 10px;
	font-weight: bold;
	background: linear-gradient(#FFCC33,yellow);
	border-right: 0.5px solid #ccc;
	border-bottom: 0.5px solid #ccc;
	border-top: 0.5px solid #ccc;
	border-left: 0.5px solid #ccc;
	box-shadow: 0px 1px 1px rgba(255,255,255,0.3) inset;
}

table.inputTable-mini td {
	padding: 10px;
	box-shadow: 0px -3px 5px 1px #eee inset;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	background: white;
}

table.inputTable-mini td input {
	padding: 10px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.inputTable-mini td input[type="text"],
table.inputTable-mini td input[type="password"] {
	width: 100%;
	box-sizing:border-box;
}

table.inputTable-mini, th, td {
	border-collapse: collapse;
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
			<p>BuyItem</p>
		</div>
		<div>
			<s:form action="AddCartAction" theme="simple">
				<table class="inputTable-mini">
					<tr>
						<th scope="row"><s:label value="商品名" /></th>
						<td>
							<s:property value="session.buyItem_name"/><br/>
						</td>
					</tr>
					<tr>
						<th scope="row"><s:label value="値段" /></th>
						<td>
						<s:property value="session.buyItem_price"/>
							<span>円</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><s:label value="購入個数" /></th>
						<td>
							<select name="productCount">

							<option value="1" selected="selected">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><s:label value="支払い方法" /></th>
						<td>
							<input type="radio" name="pay" value="1" checked="checked">現金払い
							<input type="radio" name="pay" value="2">クレジットカード
						</td>
					</tr>
				</table>

				<div class="button_box">
						<s:submit value="カートに追加" class="button" />
					</div>
			</s:form>
				<div>
					<p>前画面に戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>
					<p>マイページは<a href='<s:url action="MyPageAction"/>'>こちら</a></p>
				</div>
		</div>
	</div>
	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>