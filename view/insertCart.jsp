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
	<body>

		<!-- 各機能へのリンク -->
		<h2>カート追加</h2>
		<p>
			<h3>下記の商品をカートに追加しました。</h3>
		</p>

		<!-- カートに入れた書籍を示すテーブル -->
		<table>
			<tr>
				<td>ユニフォームA</td>
				<td><%= tempList.get(0).getQuantity() %></td>
			</tr>
			<tr>
				<td>ユニフォームB</td>
				<td><%= tempList.get(1).getQuantity() %></td>
			</tr>
			<tr>
				<td>ユニフォームC</td>
				<td><%= tempList.get(2).getQuantity() %></td>
			</tr>
		</table>

		<p>
			<form action="<%= request.getContextPath() %>/showCart">
				<input type="submit" value="カート確認">
			</form>
		</p>
	</body>
</html>
