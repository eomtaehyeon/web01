<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>   <!-- DAO인스턴스 -->
<%@ page import = "java.io.PrintWriter" %>   <!-- 출력 도와주는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
   <!-- JSP에서 클래스의 setter 함수를 호출하는 것과 같은 역할 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Action</title>
</head>
<body>

<%
   // 현재 로그인이 되어있는데 회원가입을 할 경우 로그인되어있음을 알려주기
   String userID = null;
   if(session.getAttribute("userID") != null){ // 세션의 userID가 존재하면 가져오기
      
      userID = (String) session.getAttribute("userID");
   
   }
   if(userID != null){
   
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('이미 로그인되었습니다.')");
      script.println("location.href='index.jsp'");
      script.println("</script>");
      
   }

   // 유효성 검사
   if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null || user.getUserGender()==null){
      
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력되지 않은 항목이 있습니다.')");
      script.println("history.back()");
      script.println("</script>");
      return;
      
   } else {
      
      UserDAO userDAO = new UserDAO();
      int result = userDAO.join(user);
      if(result==1){ // 회원가입 성공
         
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("location.href='login.jsp'");
         script.println("</script>");
         
      } else if(result==-1){ // 중복 발생
         
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('아이디가 이미 존재합니다.')");
         script.println("history.back()"); // 뒤로가기
         script.println("</script>");
         
      } else { 
         
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('알 수 없는 오류가 발생하였습니다.')");
         script.println("history.back()"); // 뒤로가기
         script.println("</script>");
         
      }
   }

   

%>
</body>
</html>