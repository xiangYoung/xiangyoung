<%@ page language="java" contentType="text/html; charset=gb2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
   <link rel="stylesheet" href="CSS/login.css" type="text/css" />
   <title>登录</title>
   <script type="text/javascript">
	    function checkAccount()
		{
	        var mobile=document.getElementById("log_account").value;
			var mobileId=document.getElementById("divAccount");
		    var regMobile=/^1\d{10}$/;
			if(mobile==""){mobileId.innerHTML="登录账号不能为空，请重新输入";return false;}
			if(regMobile.test(mobile)==false){
		       mobileId.innerHTML="账号格式不正确，请重新输入";
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
			if(pwd==""){pwdId.innerHTML="密码不能为空，请重新输入";return false;}
	        return true;
	    }
	</script>
</head>
  
<body>
	<div class="continer">	
		<div class="main">
		<form method="post" action="util/do_login_check.jsp" >
          <table class="log_table">
			
                 <tr><td colspan="2"><p>登录</p></td></tr>
                 <tr><td>账号</td><td ><input type="text" size="20" id="log_account" class="account_text" placeholder="手机号"  onblur="checkAccount();" /></td></tr>
                 <tr><td></td><td colspan="2"><div id="divAccount" class="hint"></div></td></tr>
                 
	       	     <tr><td>密码</td><td ><input type="password" size="20" id="log_pwd" class="account_text" placeholder="密码" onblur="checkPwd();"/></td></tr>
                 <tr><td></td><td colspan="2"><div id="divPwd" class="hint"></div></td></tr>
                 
				 <tr><td colspan="2" style="text-align:center"><input type="submit" value="登录" size="20" class="log_sub"/></td></tr>
			
			     <tr><td><a href="register.jsp">新用户注册</a></td>
			         <td class="forget_pwd"><a href="">忘记密码</a></td>
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
