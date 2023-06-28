<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order"%>
<%@page import="util.MyFormat"%>
<%
	ArrayList<Order> order_list = (ArrayList<Order>) request.getAttribute("order_list");
	MyFormat format = new MyFormat();
%>
<html>
<head>
<title>注文詳細情報</title>
</head>
<body>
	<!-- ヘッダー部分 -->
	<%@ include file="/common/header.jsp"%>

	<!-- 注文詳細情報コンテンツ部分 -->
	<div style="margin: 50 auto;">
		<h2 style="text-align: center">
			<font color="blue">注文状況詳細</font>
		</h2>
		<!-- ナビゲーション  -->

		<p style="width: 950px; text-align: center">
			<a href="<%=request.getContextPath()%>/view/orderList.jsp">[受注状況一覧へ戻る]</a>
		</p>

		<hr size="4" color="blue" style="width: 950px">
	</div>

		<form action="<%=request.getContextPath()%>/payment" id="payment"
			id="send">
			<table border="1" style="width: 400px; margin:0 auto">

				<%
					if (order_list != null) {
						for (int i = 0; i < 1; i++) {
							Order order = (Order) order_list.get(i);
				%>
				<tr style="text-align:center">
					<th>No.</th>
					<td><%=order.getOrderid()%></td>
				</tr>

				<tr style="text-align:center">
					<th>氏名</th>
					<td><%=order.getName()%></td>
				</tr>

				<tr  style="text-align:center">
					<th>Mail</th>
					<td><%=order.getEmail()%></td>
				</tr>

				<tr style="text-align:center">
					<th>住所</th>
					<td><%=order.getAddress()%></td>
				</tr>

				<%
					}
					}
				%>
				<tr style="text-align:center">

						<th rowspan="<%=order_list.size()%>" >購入内容</th>


					<%
					for(int i=0; i < order_list.size();i++){
						Order order = (Order) order_list.get(i);

					%>

					<td style="text-align:center"><%=order.getUniformType()%>×<%=order.getQuantity()%></td>
</tr>
					<%
					}
						%>

				<%
					for (int i = 0; i < 1; i++) {
						Order order = (Order) order_list.get(i);
				%>



				<tr style="text-align:center">
					<th>会計金額</th>
					<td><%=order.getPrice()%></td>
				</tr>

				<tr style="text-align:center">
					<th>発注日</th>
					<td><%=order.getDate()%></td>
				</tr>

				<tr style="text-align:center">
					<th>入金状況</th>
					<td><%if(order.getPayment().equals("入金済み")){ %>
							<select name="payment" id="payment">
							<option value="入金済み">入金済み</option>
							</select>
						<%}else if(order.getPayment().equals("未入金")){ %>
							<select name="payment" id="payment">
							<option><%=order.getPayment()%></option>
							<option value="入金済み">入金済み</option>
							</select>
						<%}%>
					</td>
				</tr>

				<tr style="text-align:center">
					<th>発送状況</th>
					<td><%if(order.getSend().equals("発送済み")){ %>
							<select name="payment" id="payment">
							<option value="発送済み">発送済み</option>
							</select>
						<%}else if(order.getSend().equals("発送準備中")){ %>
							<select name="send" id="send">
							<option><%=order.getSend()%></option>
							<option value="発送済み">発送済</option>
							</select>
						<%}else if(order.getSend().equals("未発送")) {%>
							<select name="send" id="send">
							<option><%=order.getSend()%></option>
							<option value="発送済み">発送済</option>
							</select>
						<%} %>
					</td>
				<tr style="text-align:center">
					<th>備考欄</th>
					<td><%=order.getMessage()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<div style="width: 950px; text-align: left; margin-left: 850px; margin-top: 30px">
				<%
				for (int i = 0; i < 1; i++) {
					Order order = (Order) order_list.get(i);
				if(order.getSend().equals("未発送") || order.getSend().equals("発送準備中")){ %>
				<input type="submit" value="更新">
								<%
					}}
				%>
			</div>
		</form>

	<div style="margin: 50 auto; width: 50"></div>

	<!-- フッター部分 -->
	<%@ include file="/common/footer.jsp"%>

</body>
</html>