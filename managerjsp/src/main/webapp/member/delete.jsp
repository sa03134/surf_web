<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="manager.*"%>
    
    <%

    
	request.setCharacterEncoding("utf-8");
    
	String n = request.getParameter("num");
	System.out.print(n);
	
	int num  = 0;
	if (n == null ){
		response.sendRedirect("list.jsp");
	}else{
		num = Integer.parseInt(n);
	
		MemberService memberService = MemberService.getInstance();
		MemberVo vo = memberService.read(num);

		memberService.remove(num);
		response.sendRedirect("/managerjsp/member/list.jsp");
} //else %>

