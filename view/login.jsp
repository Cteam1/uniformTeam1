<%@ page contentType="text/html; charset=UTF-8"%>
<%
String message =(String)request.getAttribute("message");
%>

<html>
<head>
<title>ユニフォーム受注管理システム</title>
</head>
<body>
	<!-- ここでヘッダー読み込み -->

	<div style="margin-bottom: 350px">
		<form action="<%=request.getContextPath()%>/login" method="post">
			<table style="margin: auto;">
				<tr>
					<td style="text-align: center; background-color: #6495ed; width: 100px">管理者ID</td>
					<td><input type="text" name="admin" size="30"></input></td>
				</tr>
				<tr>
					<td style="text-align: center; background-color: #6495ed;">パスワード</td>
					<td><input type="password" name="pass" size="30"></input></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input	type="submit" value="ログイン"></input></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- ここでフッダー読み込み -->
</body>
</html>