<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="manager.*"%>
    
    <%
	request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="modifyRequest" class="manager.ModifyRequest"/>
	<jsp:setProperty name="modifyRequest" property="*"/>
	<%
    

	String n = request.getParameter("num");
	System.out.print(n);
	
	int num  = 0;
	if (n == null ){
		response.sendRedirect("list.jsp");
	}else{
		num = Integer.parseInt(n);
	
		MemberService memberService = MemberService.getInstance();
		MemberVo vo = memberService.read(num);
	
		
		if (!modifyRequest.getMemberPwOld().equals(vo.getMemberPw()) ){
			System.out.print("��й�ȣ ����ġ!!");
			response.sendRedirect("modifyForm.jsp?num="+ n);
		}else{ //���� ��й�ȣ�� ������ ���, ���� ����
			vo.setMemberPw(modifyRequest.getMemberPwNew());
			vo.setNickName(modifyRequest.getNickName());
			memberService.edit(vo);
			
			response.sendRedirect(request.getContextPath() + "/member/detail.jsp?num="+ n);
		} //else 
	} //else %>