<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>

<html>

<head>

<title>管理者メニュー</title>

</head>
<body>

	<%@include file="/common/header.jsp"%>

	<div style="text-align: center">

		<br>
		<br>
		<p><a href="<%= request.getContextPath() %>/orderList">注文一覧</a></p>
		<p><a href="<%= request.getContextPath() %>/logout">ログアウト</a></p>
		<p><a href="<%= request.getContextPath() %>/view/menu.jsp">メインメニュー</a></p>

	</div>

	<%@include file="/common/footer.jsp"%>

</body>
</html>