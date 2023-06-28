<%@page import="bean.MultiBuy"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType= "text/html; charset=UTF-8" %>

<%
ArrayList<MultiBuy> tempList = (ArrayList<MultiBuy>)request.getAttribute("tempList");
%>

<html>
	<head>
		<title>カートに入れました。</title>
	</head>
	<header>
	<%@ include file="/common/header.jsp"%>
	</header>
	<body>

		<!-- 各機能へのリンク -->
		<h2 style="text-align:center">カート追加</h2>

	<hr style="text-align: center; background-color: black; width:auto; height: 2px">

		<h3 style="text-align:center">下記の商品をカートに追加しました。</h3>


		<!-- カートに入れた書籍を示すテーブル -->
		<table style="margin-left:630px">
			<tr>
				<th>ユニフォームA</th>
				<td><%=tempList.get(0).getQuantity()%></td>
			</tr>
			<tr>
				<th>ユニフォームB</th>
				<td><%=tempList.get(1).getQuantity()%></td>
			</tr>
			<tr>
				<th>ユニフォームC</th>
				<td><%=tempList.get(2).getQuantity()%></td>
			</tr>
		</table>


			<form action="<%= request.getContextPath() %>/showCart">
				<input type="submit" value="カート確認" style="margin-left:800px">
			</form>

			<footer>
			<%@ include file="/common/footer.jsp"%>
			</footer>

	</body>
</html>
