<%@ page language="java" contentType="text/html; charset=gb2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
   <link rel="stylesheet" href="CSS/login.css" type="text/css" />
   <title>��¼</title>
   <script type="text/javascript">
	    function checkAccount()
		{
	        var mobile=document.getElementById("log_account").value;
			var mobileId=document.getElementById("divAccount");
		    var regMobile=/^1\d{10}$/;
			if(mobile==""){mobileId.innerHTML="��¼�˺Ų���Ϊ�գ�����������";return false;}
			if(regMobile.test(mobile)==false){
		       mobileId.innerHTML="�˺Ÿ�ʽ����ȷ������������";
		       return false;
		}
		mobileId.innerHTML="";
		return true;
		}
		function checkPwd()
		{
		    var pwd=document.getElementById("log_pwd").value;
			var pwdId=document.getElementById("divPwd");
			pwdId.innerHTML="";	
			var reg=/^[a-zA-Z0-9]{6,20}$/;	
			if(pwd==""){pwdId.innerHTML="���벻��Ϊ�գ�����������";return false;}
	        return true;
	    }
	</script>
</head>
  
<body>
	<div class="continer">	
		<div class="main">
		<form method="post" action="util/do_login_check.jsp" >
          <table class="log_table">
			
                 <tr><td colspan="2"><p>��¼</p></td></tr>
                 <tr><td>�˺�</td><td ><input type="text" size="20" id="log_account" class="account_text" placeholder="�ֻ���"  onblur="checkAccount();" /></td></tr>
                 <tr><td></td><td colspan="2"><div id="divAccount" class="hint"></div></td></tr>
                 
	       	     <tr><td>����</td><td ><input type="password" size="20" id="log_pwd" class="account_text" placeholder="����" onblur="checkPwd();"/></td></tr>
                 <tr><td></td><td colspan="2"><div id="divPwd" class="hint"></div></td></tr>
                 
				 <tr><td colspan="2" style="text-align:center"><input type="submit" value="��¼" size="20" class="log_sub"/></td></tr>
			
			     <tr><td><a href="register.jsp">���û�ע��</a></td>
			         <td class="forget_pwd"><a href="">��������</a></td>
                 </tr>
          </table> 
          </form>
		</div>
     </div>
     <div style="width:100%;height:100px;margin:100px auto 75px auto;position:absolute;">
        <%@ include file="whitefooter.html"%>
     </div>
</body>
</html>
