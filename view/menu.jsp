<%@page import="bean.MultiBuy"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
ArrayList<MultiBuy> multiBuys = new ArrayList<MultiBuy>();

session.setAttribute("multiBuyList", multiBuys);
%>
<html>
<head>
<title>ユニフォーム受注管理システム</title>
</head>
<body>
	<%@ include file="/common/header.jsp" %>

	<hr style="text-align: center; background-color: black; width:auto; height: 5px">
	<h2 style="text-align: center;">MENU</h2>
	<hr style="text-align: center; background-color: black; width:auto; height: 5px">
	<div style="margin-bottom: 350px">
		<table style="margin: auto; border: 0;">
			<tr><td><a href="<%=request.getContextPath() %>/view/guestMenu.jsp">【ストアトップへ】</a></td></tr>

			<tr><td><a href="<%=request.getContextPath() %>/view/login.jsp">【管理者ログイン】</a></td></tr>
		</table>
	</div>
	<%@ include file="/common/footer.jsp" %>
</body>
</html>
