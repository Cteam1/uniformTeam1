<%@page import="bean.MultiBuy"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType= "text/html; charset=UTF-8" %>

<%
ArrayList<MultiBuy> tempList = (ArrayList<MultiBuy>)request.getAttribute("tempList");
%>

<html>
	<head>
		<title>カート追加確認</title>
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
		<table style="margin:0 auto; text-align:center;" border="1">
			<tr>
				<th style="background-color: #dcdcdc; width: 150">ユニフォームA</th>
				<td style="width: 150"><%=tempList.get(0).getQuantity()%>&nbsp;着</td>
			</tr>
			<tr>
				<th style="background-color: #dcdcdc; width: 150">ユニフォームB</th>
				<td style="width: 150"><%=tempList.get(1).getQuantity()%>&nbsp;着</td>
			</tr>
			<tr>
				<th style="background-color: #dcdcdc; width: 150">ユニフォームC</th>
				<td style="width: 150"><%=tempList.get(2).getQuantity()%>&nbsp;着</td>
			</tr>

		</table>
		<br>
		<br>
		<form action="<%= request.getContextPath() %>/showCart">
				<input type="submit" value="カート確認">
		</form>
		</div>

		<%@ include file="/common/footer.jsp"%>


	</body>
</html>
