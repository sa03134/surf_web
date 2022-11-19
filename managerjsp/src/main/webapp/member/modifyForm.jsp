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
<title>정보변경</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath() %>/member/modify.jsp">
<h3>회원 정보 수정하기</h3>
<input type="hidden" name ="num" value=<%=vo.getNum() %>>
	<input type="text" name="memberId" placeholder=<%=vo.getMemberId() %> disabled><br>
	<input type="text" name="memberPwOld" placeholder="기존 비밀번호" ><br>
	<input type="text" name="memberPwNew"  placeholder="새로운 비밀번호" ><br>
	<input type="text" value=<%=vo.getNickName() %> name="nickName" ><br>
	<input type="submit" value="수정">
</form>

</body>
</html>
<%} //else %>