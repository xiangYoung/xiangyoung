<%@ page language="java" import="beans.*" contentType="text/html; charset=gb2312" %>
<html>
	<head>
		<title>��¼����ҳ��</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("gb2312");
		String userName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		Userinfo ui = new Userinfo();
		ui.setUserName(userName);
		ui.setPwd(pwd);
		UserDaoimp userdaoimp=new UserDaoimp();
		int flag=userdaoimp.findUser(ui);
		if(flag==0)
		{
			//�����û���¼��Ϣ
			session.setAttribute("LOGIN", userName);
			//����session����ʱ��
			//session.setMaxInactiveInterval(10*60);
			response.sendRedirect("welcome.jsp");
		}
		else if(flag == 1)	//�û�������ȷ
		{
			
			response.sendRedirect("login.jsp");
		}
		else// if(flag == 2)	���벻��ȷ
		{
	
			response.sendRedirect("login.jsp");
		}
	%>
	</body>
</html>