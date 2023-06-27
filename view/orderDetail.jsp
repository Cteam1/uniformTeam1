<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Order" %>
<%@page import="util.MyFormat"%>
<%
	ArrayList<Order> order_list = (ArrayList<Order>) request.getAttribute("order_list");
	MyFormat format = new MyFormat();
	int total =0;
%>
<html>
	<head>
		<title>注文詳細情報</title>
	</head>
	<body>
	<!-- ヘッダー部分 -->
	<%@ include file="/common/header.jsp" %>

	<!-- 注文詳細情報コンテンツ部分 -->
<div style="margin: 50 auto;">
		<h2 style="text-align: center"><font color="blue">注文状況詳細</font></h2>
			<!-- ナビゲーション  -->

		<p style="width:950px; text-align: center"><a href ="<%=request.getContextPath()%>/orderList" >[受注状況一覧へ戻る]</a></p>

		<hr size="4" color="blue" style="width:950px">
	</div>
	<div style="margin:auto; width: 600px">
	<form action="<%=request.getContextPath()%>/payment" id="payment" id="send">
		<table border="1" style="width:600px">

	<%if(order_list != null) {
		for(int i=0;i<order_list.size();i++){
			Order order = (Order)order_list.get(i);
			%>
			<tr>
				<th>No.</th>
				<td><%=order.getOrderid() %></td>
			</tr>

			<tr>
				<th>氏名</th>
				<td><%=order.getName() %></td>
			</tr>

			<tr>
				<th>Mail</th>
				<td><%=order.getEmail() %></td>
			</tr>

			<tr>
				<th>住所</th>
				<td><%=order.getAddress() %></td>
			</tr>

			<tr>
				<th>種類</th>
				<td><%=order.getUniformType() %></td>
			</tr>

			<tr>
				<th>個数</th>
				<td><%=order.getQuantity() %></td>
			</tr>


			<tr>
				<th>会計金額</th>
				<td><%=order.getPrice() %></td>
			</tr>

			<tr>
				<th>発注日</th>
				<td><%=order.getDate() %></td>
			</tr>

			<tr>
				<th>入金状況</th>
				<td><select name="payment" id="payment">
						<option><%= order.getPayment() %></option>
						<option value="入金待ち">入金待ち</option>
						<option value="入金済">入金済</option>

				</select></td>
			</tr>

			<tr>
				<th>発送状況</th>
				<td><select name="send" id="send">
						<option><%= order.getSend() %></option>
						<option value="未">未発送</option>
						<option value="発送準備中">発送準備中</option>
						<option value="発送済">発送済</option>
				</select></td>
			</tr>

			<tr>
				<th>備考欄</th>
				<td><%=order.getMessage() %></td>
			</tr>
<%
			}
			}
%>
		</table>
		<div style="width:950px; text-align: left; margin-left:140px; margin-top:30px"><input type="submit" value="更新" ></div>
		</form>
	</div>
	<div style="margin:50 auto; width:50">


	</div>

			<!-- フッター部分 -->
			<%@ include file="/common/footer.jsp" %>

	</body>
</html>