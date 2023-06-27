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
		<p><a href="<%=request.getContextPath() %>/view/menu.jsp">[メニュー]</a></p>
		<h2 style="text-align: center">商品一覧</h2>
		<hr style="height: 2; background-color: #000000">
	</div>


	<div style="margin: 0 auto; width: 1000">
		<form action="<%=request.getContextPath()%>/insertCart">
			<table>
				<tr>
					<th style="background-color: #6666ff; width: 300">種類</th>
					<th style="background-color: #6666ff; width: 300">価格</th>
					<th style="background-color: #6666ff; width: 300">在庫数</th>
					<th style="background-color: #6666ff; width: 100">個数</th>
				</tr>
				<%
					if (uniform_list != null) {
						for (int i = 0; i < uniform_list.size(); i++) {
				%>

				<tr>
					<td style="text-align: center">><%=uniform_list.get(i).getUniformType()%></td>
					<td style="text-align: center"><%=uniform_list.get(i).getPrice()%></td>
					<td style="text-align: center"><%=uniform_list.get(i).getStock()%></td>
					<td><input type="text" name="quantity<%=i%>"><input
						type="hidden" name="uniform<%=i%>"
						value="<%=uniform_list.get(i).getUniformid()%>"></td>
				</tr>

				<%
					}
					}
				%>

			</table>

			<input type="submit" value="カートに追加"
				style="margin: 50 500; width: 100">
		</form>
	</div>

	<%@include file="/common/footer.jsp"%>

</body>
</html>