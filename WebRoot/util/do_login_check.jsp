<%@ page language="java" import="beans.*" contentType="text/html; charset=gb2312" %>
<html>
	<head>
		<title>登录处理页面</title>
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
			//设置用户登录信息
			session.setAttribute("LOGIN", userName);
			//设置session过期时间
			//session.setMaxInactiveInterval(10*60);
			response.sendRedirect("welcome.jsp");
		}
		else if(flag == 1)	//用户名不正确
		{
			
			response.sendRedirect("login.jsp");
		}
		else// if(flag == 2)	密码不正确
		{
	
			response.sendRedirect("login.jsp");
		}
	%>
	</body>
</html>