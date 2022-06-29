<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="B.jsp">
	<input name="num1" type="text">
	<input name="num2" type="text">
	<button type="submit">Sum!</button>
</form>
<%
/* 	// 1. 주소가 드러나는 방식
	String resultFromB = (String)request.getParameter("result");
	out.println(resultFromB); */
	
	// 2. 주소가 드러나지 않는 방식
	String resultFromB = String.valueOf(pageContext.getSession().getAttribute("result"));
	out.println(resultFromB);
	
%>
</body>
</html>