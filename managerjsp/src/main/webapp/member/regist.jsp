<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "manager.*"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id = "vo" class="manager.MemberVo"/>
<jsp:setProperty name = "vo" property="*"/>
	

<%


// 	String memberId = request.getParameter("memberId");
// 	String memberPw = request.getParameter("memberPw");
// 	String nickName = request.getParameter("nickName");
	
	
// 	MemberVo vo = new MemberVo(-1,memberId,memberPw,nickName);
	MemberService memberService = MemberService.getInstance();
	
	if(memberService.regist(vo)){
		response.sendRedirect(request.getContextPath()+"/member/index.jsp");
	}else{
		response.sendRedirect(request.getContextPath()+"/member/registForm.jsp");
	}
	 



%>