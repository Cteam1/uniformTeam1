<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order,util.*"%>

<%
	MyFormat obj = new MyFormat();

	ArrayList<Order> order_list = (ArrayList<Order>) request.getAttribute("order_list");
	ArrayList<Order> order_list_group = (ArrayList<Order>) request.getAttribute("order_list_group");

%>

<html>

<head>

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
					for (int i = 0; i < order_list_group.size(); i++) {
			%>
			<tr style="text-align: center">
				<td><%= order_list.size() - i %></td>
				<td><%= order_list_group.get(i).getName() %></td>
				<td><%= obj.moneyFormat(order_list_group.get(i).getPrice() * order_list_group.get(i).getQuantity()) %></td>
				<td><%= order_list_group.get(i).getDate() %></td>
				<td><%= order_list_group.get(i).getPayment() %></td>
				<td><%= order_list_group.get(i).getSend() %></td>
				<td>
					<a href="<%= request.getContextPath() %>/orderDetail?name=<%= order_list.get(i).getName() %>&order_time=<%= order_list.get(i).getOrderTime() %>">詳細</a></td>
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
