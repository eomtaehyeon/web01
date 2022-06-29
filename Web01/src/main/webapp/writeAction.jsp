<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>   <!-- DAO인스턴스 -->
<%@ page import = "java.io.PrintWriter" %>   <!-- 출력 도와주는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"></jsp:useBean>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
   String userID = null;
   if(session.getAttribute("userID") != null){ // 세션의 userID가 존재하면 가져오기
      userID = (String) session.getAttribute("userID");
   }
      
   if(userID == null){ 

      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('로그인 해주세요.')");
      script.println("location.href='login.jsp'");
      script.println("</script>");
      
   } else{
      
      if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){ 
            // 제목이나 내용이 비어있을 경우
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('제목 또는 내용이 비어있습니다.')");
         script.println("history.back()"); // 뒤로가기
         script.println("</script>");
      
      } else { 
         
         BbsDAO bbsDAO = new BbsDAO();
         int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
         
         if(result == -1){
            
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글쓰기에 실패하였습니다.')");
            script.println("history.back()"); // 뒤로가기
            script.println("</script>");
            
         } else {

            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='bbs.jsp'");
            script.println("</script>");
         }

      }
   }
%>



</body>
</html>