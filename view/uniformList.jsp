<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Uniform"%>

<%
	ArrayList<Uniform> uniform_list = (ArrayList<Uniform>) request.getAttribute("uniform_list");
%>

<html>
<head>
<title>商品一覧</title>
</head>

<body>

	<%@include file="/common/header.jsp"%>

	<div>
		<h3 style="text-align: center">商品一覧</h3>
		<hr style="height: 2; background-color: #000000">
	</div>


	<div style="margin: 0 auto; width: 900">
		<form action="<%=request.getContextPath() %>/insertCart">
			<table>
				<tr>
					<th style="background-color: #6666ff; width: 300">種類</th>
					<th style="background-color: #6666ff; width: 300">価格</th>
					<th style="background-color: #6666ff; width: 300">在庫数</th>
					<th style="background-color: #6666ff; width: 300">個数</th>
					<th style="background-color: #6666ff; width: 300"></th>
				</tr>
				<%
					if (uniform_list != null) {
						for (int i = 0; i < uniform_list.size(); i++) {
				%>

				<tr>
					<td style="text-align: center">><%=uniform_list.get(i).getUniformType()%></td>
					<td style="text-align: center"><%=uniform_list.get(i).getPrice()%></td>
					<td style="text-align: center"><%=uniform_list.get(i).getStock()%></td>
					<td><input type="text" name="stock"></td>
					<td><a
						href="<%=request.getContextPath()%>/insertCart?uniformid<%=uniform_list.get(i).getUniformid()%>">カートに入れる</a></td>
				</tr>

				<%
					}
				}
				%>

			</table>
		</form>
	</div>

	<%@include file="/common/footer.jsp" %>

</body>
</html>