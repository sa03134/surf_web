<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "manager.*"%>

<%

String n = request.getParameter("num");
int num  = 0;
if (n == null ){
	response.sendRedirect("list.jsp");
}else{
	num = Integer.parseInt(n);

	MemberService memberService = MemberService.getInstance();;
	MemberVo vo = memberService.read(num);

%>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath() %>/member/modify.jsp">
<h3>ȸ�� ���� �����ϱ�</h3>
<input type="hidden" name ="num" value=<%=vo.getNum() %>>
	<input type="text" name="memberId" placeholder=<%=vo.getMemberId() %> disabled><br>
	<input type="text" name="memberPwOld" placeholder="���� ��й�ȣ" ><br>
	<input type="text" name="memberPwNew"  placeholder="���ο� ��й�ȣ" ><br>
	<input type="text" value=<%=vo.getNickName() %> name="nickName" ><br>
	<input type="submit" value="����">
</form>

</body>
</html>
<%} //else %>