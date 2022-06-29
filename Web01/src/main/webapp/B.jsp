<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%= request.getParameter("age") %> --%>
	<%-- <% out.println(request.getParameter("age")); %> --%>
	
	<%
	// 무조건 String으로 받아오기 때문에 형변환 필요
	int a = Integer.parseInt(request.getParameter("num1"));
	int b = Integer.parseInt(request.getParameter("num2"));
	int result = a+b;
	out.println("첫번째 값 : " + a);
	
	response.setHeader("result", result + "");
	%>
	<br>
	<%
	out.println("두번째 값 : " + b);
	%>
	<br>
	<%
	out.println("결과 값 : " + result);
	%>
	<br>
	
	// B에서 출력하지 않고 결과값을  A로 전달하여 출력하기
	<%
	String URL = "A.jsp";
	
/* 	// 1. 주소가 드러나는 방식
	String appendURL = "?result="+result;
	response.sendRedirect(URL+appendURL); */
	
	// 2. 주소가 드러나지 않는 방식
	pageContext.getSession().setAttribute("result", result);
	response.sendRedirect(URL);

	%>
</body>
</html>