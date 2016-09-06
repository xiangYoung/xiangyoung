<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
   <title>ע��</title>
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
				document.getElementById("divAccount").innerHTML="�û�������Ϊ��";
				return false;
			}
			var regMobile=/^1\d{10}$/;
			if(regMobile.test(userName) == false)
			{
		       document.getElementById("divAccount").innerHTML="�ֻ����벻��ȷ������������";
		       return false;
			}
			//�������󵽷��������ж��û����Ƿ����
			
			//...Ajax start here...
			
			//�����ַ���
			var url = "checkUserExistsServlet?userName="+userName;
			//����XMLHttpRequest���
			var xmlHttp = createXmlHttpRequest();
			//���ûص�����
			xmlHttp.onreadystatechange = processRequest;
			//�����������Ӧ��ַ������
			xmlHttp.open("GET",url,true);
			//��������
			xmlHttp.send(null);
		}
		String.prototype.trim = function()
		{
			var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);
			return (m == null) ? "" : m[1];
		}
		function processRequest()
		{
			if(xmlHttp.readyState==4)	//����4��ʾ�������
			{
				if(XMLHttp.status == 200)	//200�������������
				{
					//responseText��ʾ������ɺ󣬷��ص��ַ�����Ϣ
					if(xmlHttp.responseText.trim()=="true")
						document.getElementById("divAccount").innerHTML="�û�������ʹ��";
					else
					{
						document.getElementById("divAccount").innerHTML="�û����ѱ�ʹ��"��
					}
				}
				else
				{
					alert("��������Ӧ�쳣");
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
			if(pwd==""){pwdId.innerHTML="���벻��Ϊ�գ�����������";return false;}
            if(reg.test(pwd)==false)
			{
	            pwdId.innerHTML="���벻�ܺ��зǷ��ַ���������6-20֮��";
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
	            repwdId.innerHTML="������������벻һ��";
	            return false;
	        }
	        return true;
	    }
		function checkBankAccount()
		{
	        var bankAccount=document.getElementById("bank_account").value;
			var bankAccountId=document.getElementById("divBankAccount");
		    var regBankAccount=/^\d{19}$/;
			if(bankAccount==""){bankAccountId.innerHTML="�����˺Ų���Ϊ�գ�����������";return false;}
			if(regBankAccount.test(bankAccount)==false)
			{
		       bankAccountId.innerHTML="�����˺Ų���ȷ������������";
		       return false;
			}
			bankAccountId.innerHTML="";
			return true;
		}
		function checkAddress()
		{
	        var address=document.getElementById("address").value;
			var divAddressId=document.getElementById("divAddress");
			if(address==""){divAddressId.innerHTML="��ַ����Ϊ�գ�����������";return false;}
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
			   
				<tr><td colspan="2"><p>��ʹ���ֻ�ע��</p></td></tr>
				<tr><td>��¼�˺�</td><td><input type="text" id="log_account" size="20" placeholder="�ֻ�����" class="account_text" onblur="checkAccount();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divAccount" class="hint"></div></td></tr>
				
                <tr><td>��¼����</td><td><input type="password" id="log_pwd" size="20"  placeholder="���볤��6-20�ַ�" class="account_text" onblur="checkPwd();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divPwd" class="hint"></div></td></tr>
				
                <tr><td>����ȷ��</td><td><input type="password" id="repwd" size="20" class="account_text" onblur="checkRepwd();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divRepwd" class="hint"></div></td></tr>
				
                <tr><td>��������</td><td><input type="text" size="20" class="account_text"/></td></tr>
				<tr><td>���̵�ַ</td><td><input type="text" id="address" size="20" class="account_text" onblur="checkAddress();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divAddress" class="hint"></div></td></tr>
				
                <tr><td>�����˺�</td><td><input type="text" id="bank_account" size="20" class="account_text" onblur="checkBankAccount();"/></td></tr>
                <tr><td></td><td colspan="2"><div id="divBankAccount" class="hint"></div></td></tr>
				
                <tr><td colspan="2"><input type="submit" value="ͬ��Э�鲢ע��" size="20" class="register_sub"/></td></tr>
			    <tr><td colspan="2" class="protocle"><a href="ë��">��ʹ�������Э�顷</a></td></tr>
            </table>
            </form>
		</div>
	</div>
    <div style="width:100%;height:100px;margin:75px auto 75px auto;position:absolute;">
        <%@ include file="whitefooter.html"%>
    </div>
</body>
</html>
