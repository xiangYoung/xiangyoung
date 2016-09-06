<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
   <title>注册</title>
   <link rel="stylesheet" href="CSS/register.css" type="text/css" />
   <script type="text/javascript">
		function createXMLHttpRequest()
		{
			if(window.XMLHttpRequest)
				XMLHttp = new XMLHttpRequest();
			else if(window.ActiveObject)
				XMLHttp = new ActiveObject("Microsoft.XMLHttp");
		}
		function checkAccount()
		{
			var userName=document.getElementById("log_Account").value;
			if(userName=="")
			{
				document.getElementById("divAccount").innerHTML="用户名不能为空";
				return false;
			}
			var regMobile=/^1\d{10}$/;
			if(regMobile.test(userName) == false)
			{
		       document.getElementById("divAccount").innerHTML="手机号码不正确，请重新输入";
		       return false;
			}
			//发送请求到服务器，判断用户名是否存在
			
			//...Ajax start here...
			
			//请求字符串
			var url = "checkUserExistsServlet?userName="+userName;
			//创建XMLHttpRequest组件
			var xmlHttp = createXmlHttpRequest();
			//设置回调函数
			xmlHttp.onreadystatechange = processRequest;
			//打开与服务器响应地址的连接
			xmlHttp.open("GET",url,true);
			//发送请求
			xmlHttp.send(null);
		}
		String.prototype.trim = function()
		{
			var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);
			return (m == null) ? "" : m[1];
		}
		function processRequest()
		{
			if(xmlHttp.readyState==4)	//等于4表示请求完成
			{
				if(XMLHttp.status == 200)	//200代表服务器正常
				{
					//responseText表示请求完成后，返回的字符串信息
					if(xmlHttp.responseText.trim()=="true")
						document.getElementById("divAccount").innerHTML="用户名可以使用";
					else
					{
						document.getElementById("divAccount").innerHTML="用户名已被使用"；
					}
				}
				else
				{
					alert("服务器响应异常");
					alert(xmlHttp.status);
				}
			}
		}

	    
		function checkPwd()
		{
		    var pwd=document.getElementById("log_pwd").value;
			var pwdId=document.getElementById("divPwd");
			pwdId.innerHTML="";	
			var reg=/^[a-zA-Z0-9]{6,20}$/;	
			if(pwd==""){pwdId.innerHTML="密码不能为空，请重新输入";return false;}
            if(reg.test(pwd)==false)
			{
	            pwdId.innerHTML="密码不能含有非法字符，长度在6-20之间";
	            return false;
	        }
	        return true;
	    }
		function checkRepwd()
		{
            var repwd=document.getElementById("repwd").value;
            var pwd=document.getElementById("log_pwd").value;
            var repwdId=document.getElementById("divRepwd");
            repwdId.innerHTML="";
            if(pwd!=repwd)
			{
	            repwdId.innerHTML="两次输入的密码不一致";
	            return false;
	        }
	        return true;
	    }
		function checkBankAccount()
		{
	        var bankAccount=document.getElementById("bank_account").value;
			var bankAccountId=document.getElementById("divBankAccount");
		    var regBankAccount=/^\d{19}$/;
			if(bankAccount==""){bankAccountId.innerHTML="银行账号不能为空，请重新输入";return false;}
			if(regBankAccount.test(bankAccount)==false)
			{
		       bankAccountId.innerHTML="银行账号不正确，请重新输入";
		       return false;
			}
			bankAccountId.innerHTML="";
			return true;
		}
		function checkAddress()
		{
	        var address=document.getElementById("address").value;
			var divAddressId=document.getElementById("divAddress");
			if(address==""){divAddressId.innerHTML="地址不能为空，请重新输入";return false;}
		    divAddressId.innerHTML="";
		    return true;
		}
	</script>
</head>
<body>
	<div class="continer">
		<div class="main" >
			<form method="post" action="util/do_register.jsp">
            <table class="register_table">
			   
				<tr><td colspan="2"><p>请使用手机注册</p></td></tr>
				<tr><td>登录账号</td><td><input type="text" id="log_account" size="20" placeholder="手机号码" class="account_text" onblur="checkAccount();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divAccount" class="hint"></div></td></tr>
				
                <tr><td>登录密码</td><td><input type="password" id="log_pwd" size="20"  placeholder="密码长度6-20字符" class="account_text" onblur="checkPwd();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divPwd" class="hint"></div></td></tr>
				
                <tr><td>密码确认</td><td><input type="password" id="repwd" size="20" class="account_text" onblur="checkRepwd();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divRepwd" class="hint"></div></td></tr>
				
                <tr><td>店铺名称</td><td><input type="text" size="20" class="account_text"/></td></tr>
				<tr><td>店铺地址</td><td><input type="text" id="address" size="20" class="account_text" onblur="checkAddress();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divAddress" class="hint"></div></td></tr>
				
                <tr><td>银行账号</td><td><input type="text" id="bank_account" size="20" class="account_text" onblur="checkBankAccount();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divBankAccount" class="hint"></div></td></tr>
				
                <tr><td colspan="2"><input type="submit" value="同意协议并注册" size="20" class="register_sub"/></td></tr>
			    <tr><td colspan="2" class="protocle"><a href="毛线">《使用条款和协议》</a></td></tr>
            </table>
            </form>
		</div>
	</div>
    <div style="width:100%;height:100px;margin:75px auto 75px auto;position:absolute;">
        <%@ include file="whitefooter.html"%>
    </div>
</body>
</html>
