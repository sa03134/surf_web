<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "manager.*"%>
<%

String n = request.getParameter("num");
int num  = 0;
if (n == null ){
	response.sendRedirect("list.jsp");
}else{
	num = Integer.parseInt(n);

	MemberService memberService = MemberService.getInstance();
	MemberVo vo = memberService.read(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��</title>
</head>


<body>
	<%if(vo == null){ %>
		ȸ�������� �������� �ʽ��ϴ�. 
	<%}else{ %>
		��ȣ: <%=vo.getNum() %><br>
		���̵�: <%=vo.getMemberId() %><br>
		�г���: <%=vo.getNickName() %><br>
		�����: <%=vo.getRegdate() %><br>
		<a href="modifyForm.jsp?num=<%=vo.getNum()%>"><button>����</button></a>
		<a href="delete.jsp?num=<%=vo.getNum()%>"><button>����</button></a>
		
	<%} %>
</body>
</html>

<%} //else %>