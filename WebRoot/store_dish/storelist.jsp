<%@ page language="java" import="java.util.*,beans.*" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	int pageSize = 20;
	String keyword = request.getParameter("keyword");
	UserDaoimp udi = new UserDaoimp();
	int totalpages = udi.getTotalPages(udi.getCount(keyword), pageSize);
	
	String currentPage = request.getParameter("pageIndex");//��õ�ǰҳ��
	if(currentPage == null)
		currentPage = "1";
	int pageIndex = Integer.parseInt(currentPage);
	//����ҳ��ĩҳ���п���
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
  
  	
    <a href="storelist.jsp?pageIndex=1">��ҳ</a>
	<a href="storelist.jsp?pageIndex=<%= pageIndex - 1%>">��һҳ</a>
	<a href="storelist.jsp?pageIndex=<%= pageIndex + 1%>">��һҳ</a>
	<a href="storelist.jsp?pageIndex=<%= totalpages%>">ĩҳ</a>
<div style="width:100%;height:100px;margin:75px auto 75px auto;position:absolute;">
      <%@ include file="../blackfooter.html"%>
   </div>
  </body>
</html>
