<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>  <!-- ��� �����ִ� ��ü -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body class="text-con">
	<% 
	
	 // ���� �α����� �Ǿ��ִµ� �� �α����� ��� �̹� �α��� �Ǿ������� �˷��ֱ�
	   String userID = null;
	   if(session.getAttribute("userID") != null){ // ������ userID�� �����ϸ� ��������
	      
	      userID = (String) session.getAttribute("userID");
	   
	   }
	   if(userID != null){

	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('�̹� �α��εǾ����ϴ�.')");
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
								placeholder="�� ����" id="bbsTitle" name="bbsTitle" maxlength="50" />
							</td>
							<td>
								<textarea class="form-control" placeholder="Content"
									id="bbsContent" name="bbsContent" maxlength="2048">
								</textarea>
							</td>
						</tr>

					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="�۾���"/>
			</form>
		</div>

	</div>



</body>
</html>