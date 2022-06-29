<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>  <!-- 출력 도와주는 객체 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body class="text-con">
	<% 
	
	 // 현재 로그인이 되어있는데 또 로그인할 경우 이미 로그인 되어있음을 알려주기
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
	
		%>
	<div class="container">
		<div class="row">
			<form action="writeAction.jsp" method="post">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" id="bbsTitle" name="bbsTitle" maxlength="50" />
							</td>
							<td>
								<textarea class="form-control" placeholder="Content"
									id="bbsContent" name="bbsContent" maxlength="2048">
								</textarea>
							</td>
						</tr>

					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
			</form>
		</div>

	</div>



</body>
</html>