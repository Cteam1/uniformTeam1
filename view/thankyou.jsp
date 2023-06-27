<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>ユニフォーム受注管理システム</title>
</head>
<body>
	<%@ include file="/common/header.jsp" %>

	<a href="<%=request.getContextPath() %>/view/guestMenu.jsp">[購入者メニュー]</a>

	<h2 style="margin: auto; width: 850px ; margin-top: 30px;">ご注文ありがとうございます。</h2>
	<h2 style="margin: auto; width: 850px ;">ご入金をよろしくお願いいたします。</h2>

	<hr style="text-align:center ; width:850px; double #000; background-color:black; height: 5px;">

	<%@ include file="/common/footer.jsp" %>
</body>
</html>