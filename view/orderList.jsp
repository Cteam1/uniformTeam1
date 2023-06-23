<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>

<%
	/*
		金額の形式を変更するオブジェクト
		MyFormat obj = new MyFormat();
	*/
	ArrayList<Order> order_list = (ArrayList<Order>) request.getAttribute("order_list");

%>

<html>

<head>2100

<title>受注一覧</title>

</head>
<body>

	<%@include file="/common/header.jsp"%>

	<hr style="height: 2; background-color: #000000" />

	<div style="text-align: center">

		<table style="margin: 0 auto">
			<tr>
				<th style="background-color: #6666FF; width: 300">No.</th>
				<th style="background-color: #6666FF; width: 300">氏名</th>
				<th style="background-color: #6666FF; width: 300">合計金額</th>
				<th style="background-color: #6666FF; width: 300">発注日</th>
				<th style="background-color: #6666FF; width: 300">入金状況</th>
				<th style="background-color: #6666FF; width: 300">発注状況</th>
				<th style="background-color: #6666FF; width: 300"></th>
			</tr>
			<%
				if (order_list != null) {
					for (int i = 0; i < order_list.size(); i++) {
			%>
			<tr style="text-align: center">
				<td><%= order_list.size() - i %></td>
				<td><%= order_list.get(i).getName() %></td>
				<td><%= order_list.get(i).getPrice() %></td>
				<td><%= order_list.get(i).getDate() %></td>
				<td><%= order_list.get(i).getPayment() %></td>
				<td><%= order_list.get(i).getSend() %></td>
				<td>
					<a href="<%= request.getContextPath() %>/orderDetail?orderid=<%= order_list.get(i).getOrderid() %>">詳細</a></td>
				</tr>
			<%
					}
				}
			%>
		</table>

	</div>

	<%@include file="/common/footer.jsp"%>

</body>
</html>