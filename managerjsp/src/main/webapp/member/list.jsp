<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "manager.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>멤버 목록</title>
</head>
<body>
<h3>회원 목록</h3>

<%

	List<MemberVo> res = new ArrayList<>();
	MemberService memberService = MemberService.getInstance();
	res = memberService.listAll();
	System.out.print(res);

%>

</body>
<% if (!res.isEmpty()){ %>
<table  border="1" width="250">
	<tr>
		<th>번호</th>	<th>아이디</th><th>닉네임</th></tr>
	<%	for (MemberVo line : res ){
			int num = line.getNum();
			String memberId = line.getMemberId();
			String memberNickName = line.getNickName();	
	 %>
	<tr>
		<td><%=num%></td>
		<td><a href= "detail.jsp?num=<%=num%>"> <%=memberId%></a></td>
		<td><%=memberNickName%></td>
	</tr>
	<%} //for %>
	
</table>
<%}else { 
%>
<table border="1" width="250">
<tr>

	<td>목록이 없습니다.</td>
</tr>
</table>
<%} //else %>

</html>