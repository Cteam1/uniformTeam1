<%@page contentType="text/html; charset=UTF-8"%>

<%
	String error = (String) request.getAttribute("error");
	String cmd = (String) request.getAttribute("cmd");
%>

<html>
<head>
<title>エラー</title>
</head>

<body>

	<%@include file="/common/header.jsp"%>

	<div>
		<h2 style="text-align: center">●●エラー●●</h2>
	</div>

	<div style="text-align: center">
		<p><%=error%></p>
	</div>

	<div style="text-align: center">
		<%
			if (cmd.equals("logout")) {
		%>
		<p>
			<a href="<%=request.getContextPath()%>/logout">管理者ログイン画面に戻る</a>
		</p>
		<%
			} else if (cmd.equals("uniformList")) {
		%>
		<p>
			<a href="<%=request.getContextPath()%>/uniformList">商品一覧に戻る</a>
		</p>
		<%
			} else if (cmd.equals("guestMenu")) {
		%>
		<p>
			<a href="<%=request.getContextPath()%>/guestMenu">購入者メニュー画面に戻る</a>
		</p>
		<%
			} else if (cmd.equals("showCart")) {
		%>
		<p>
			<a href="<%=request.getContextPath()%>/showCart">カート確認画面に戻る</a>
		</p>
		<%
			} else if (cmd.equals("menu")) {
		%>
		<p>
			<a href="<%=request.getContextPath()%>/view/menu.jsp">メインメニュー画面に戻る</a>
		</p>
		<%
			}
		%>
	</div>

	<%@include file="/common/footer.jsp"%>

</body>
</html>
