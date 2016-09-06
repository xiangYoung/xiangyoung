<%@ page language="java" import="java.util.*,beans.*" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	int pageSize = 20;
	String keyword = request.getParameter("keyword");
	UserDaoimp udi = new UserDaoimp();
	int totalpages = udi.getTotalPages(udi.getCount(keyword), pageSize);
	
	String currentPage = request.getParameter("pageIndex");//获得当前页数
	if(currentPage == null)
		currentPage = "1";
	int pageIndex = Integer.parseInt(currentPage);
	//对首页与末页进行控制
	if(pageIndex < 1)
		pageIndex = 1;
	else if(pageIndex > totalpages)
		pageIndex = totalpages;
	if(keyword!=null)
         session.setAttribute("storeAddr",keyword);
	keyword=(String)session.getAttribute("storeAddr");
	List uarr;
	uarr = udi.queryStoreByAddress(keyword, pageSize, pageIndex);
%>


<html>
  <head>
    <title>store_list</title>
    
  </head>
  
  <body>
  <%@ include file="../header.html"%>
  
  	
    <a href="storelist.jsp?pageIndex=1">首页</a>
	<a href="storelist.jsp?pageIndex=<%= pageIndex - 1%>">上一页</a>
	<a href="storelist.jsp?pageIndex=<%= pageIndex + 1%>">下一页</a>
	<a href="storelist.jsp?pageIndex=<%= totalpages%>">末页</a>
<div style="width:100%;height:100px;margin:75px auto 75px auto;position:absolute;">
      <%@ include file="../blackfooter.html"%>
   </div>
  </body>
</html>
