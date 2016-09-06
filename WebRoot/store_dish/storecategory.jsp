<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'storecategory.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table>
	        <%
		    int len=uarr.size();
			for(int i=0;i<len/4+1;i++)
			{
			   out.print("<tr>");
			   for(int j=0;j<4;j++)
			   {
			      if(i*4+j+1>len)
				     break;
				  out.print("<td id='name"+i*4+j+"' onmouseover=\"hov(0,"+"'name"+i*4+j+"');\" onmouseout=\"hov(1,"+"'name"+i*4+j+"');\">");
				  out.print("<a href='#'><img src='"+((Userinfo)uarr.get(i*4+j)).getStoreIcon()+"'>");
				  out.print(((Userinfo)uarr.get(i*4+j)).getStoreName());
				  out.print("</a></td>");
			   }
			   out.println("</tr>");
			}
		 %>
	  </table>
  </body>
</html>
