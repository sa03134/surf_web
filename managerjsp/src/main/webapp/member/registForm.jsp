<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���</title>
</head>
<body>
<h3>ȸ�� ��� �ϱ�</h3>
<form method ="post" action ="<%= request.getContextPath() %>/member/regist.jsp">

	<input type="text" name="memberId" value="" placeholder="���̵�"><br>
	<input type="password" name="memberPw" value="" placeholder="��й�ȣ"><br>
	<input type="text" name="nickName" value="" placeholder="�г���"><br>
	<input type="submit" value="���">
	
</form>

</body>
</html>  