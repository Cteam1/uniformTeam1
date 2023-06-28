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

		<%@ include file="/common/header.jsp"%>
		<!-- 各機能へのリンク -->
		<table style="margin: auto; width: 850px; text-align: center;">
		<tr>
			<td style="width: 160px">
				<a href="<%=request.getContextPath()%>/view/guestMenu.jsp">【購入者メニュー】</a>
			</td>
			<td style="width: 508px; font-size: 24px">カート追加確認</td>
			<td style="width: 160px"></td>
		</tr>
	</table>
	<hr style="text-align: center; background-color: blue; width:auto; height: 5px">
	<br>
	<br>

		<!-- カートに入れた書籍を示すテーブル -->
		<div style= "text-align:center">

		<h3>下記の商品をカートに追加しました。</h3>

		<table style="margin:0 auto">
			<tr>
				<th>ユニフォームA</th>
				<td><%=tempList.get(0).getQuantity()%>着</td>
			</tr>
			<tr>
				<th>ユニフォームB</th>
				<td><%=tempList.get(1).getQuantity()%>着</td>
			</tr>
			<tr>
				<th>ユニフォームC</th>
				<td><%=tempList.get(2).getQuantity()%>着</td>
			</tr>
		</table>
		</div>


			<form action="<%= request.getContextPath() %>/showCart">
				<input type="submit" value="カート確認" style="margin-left:800px">
			</form>


			<%@ include file="/common/footer.jsp"%>


	</body>
</html>
