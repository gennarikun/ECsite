<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Style-Type" content="text/css"/>
		<meta http-equiv="Content-Script-Type" content="text/javascript"/>
		<meta http-equiv="imagetoolbar" content="no"/>
		<meta name="description" content=""/>
		<meta name="keywords" content=""/>
		<title>カート画面</title>
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
	margin-bottom:0;
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
		<script>
			function checkValue(check)
			{
				var checkList = document.getElementsByClassName("checkList");
				var checkFlag = 0;
				for( var i = 0; i < checkList.length; i++ )
				{
					if(checkFlag == 0)
					{
						if(checkList[i].checked)
						{
							checkFlag = 1;
							break;
						}
					}
				}
				if(checkFlag == 1)
				{
					document.getElementById('delete_btn').disabled="";
				}
				else
				{
					document.getElementById('delete_btn').disabled="true";
				}
			}
		</script>
	</head>
	<body>
		<div id="header">
			<div id="pr">
			</div>
		</div>
		<div id="main">
			<div id="top">
				<p>カート画面</p>
			</div>

			<s:if test="#session.cartInfoDtoList.size()>0">
				<s:form id="form" action="abcAction">
				<table class="inputTable-mini">
						<tr>
							<th scope="row"><s:label value="商品名" /></th>
							<td><s:property value="session.buyItem_name"/></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="値段" /></th>
							<td><s:property value="session.buyItem_price"/><span>円</span></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="購入個数" /></th>
							<td><s:property value="session.product_count"/><span>個</span></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="合計金額" /></th>
						</tr>
					<tbody>
						<s:iterator value="#session.cartInfoDtoList">
							<tr>
								<td><s:checkbox name="checkList" class="checkList" value="checked" fieldValue="%{productId}" onchange="checkValue(this)" /></td>
								<td><s:property value="itemPrice" />円</td>
								<td><s:property value="productCount" /></td>
							</tr>
							<s:hidden name="itemPrice" value="%{itemPrice}" />
							<s:hidden name="productCount" value="%{productCount}" />
						</s:iterator>
					</tbody>
				</table>
				<p class="totalPrice">
					カート合計金額 : <span><s:property value="#session.totalPrice" />円</span>
				</p>
				<div class="button_box">
					<s:submit value="決済" class="button"/>
				</div>

				<div class="button_box">
					<s:submit value="削除" id="delete_btn" class="button" onclick="this.form.action='DeleteCartAction';"  disabled="true"/>
				</div>
			</s:form>
		</s:if>
		</div>
		<s:else>
			<div class="notFoundMsgBox">
				カート情報がありません。
			</div>
		</s:else>
	</body>
</html>