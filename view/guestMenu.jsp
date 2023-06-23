<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>


<html>

<head>

<title>購入者メニュー</title>

</head>
<body>

	<%@include file="/common/header.jsp"%>

	<div style="text-align: center">

		<br>
		<br>
		<p><a href="<%= request.getContextPath() %>/view/uniformList.jsp">購入ページ</a></p>
		<p><a href="<%= request.getContextPath() %>/showCart">カート確認ページ</a></p>
		<p><a href="<%= request.getContextPath() %>/logout">メインメニュー</a></p>

	</div>

	<%@include file="/common/footer.jsp"%>

</body>
</html>