<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>饱了么!</title>
	
   <style type="text/css">
      body{
	        margin-left:0;
		    margin-right:0;
			margin-top:0;
			background-color:#008de1;
	  }
	  .container{
			height:550px;
			width:100%;
			background-color:#008de1;
		}
      .map-header{
		    width:950px;
	        height:100px;
			margin-left:auto;
			margin-right:auto;
	  }
	  .logo{height:100px;
	        width:40%;
			background: url(images/logo2.png) no-repeat 0 0px;
			}
	  .logo a{display: block;
            width: 100%;
            height: 100px;
            overflow: hidden;
            line-height: 100em;
	  }
      .reg{height:100px;
	       width:30%;
		   float:right;
		   text-align:right;
		   margin-top:65px;
		   }
      .reg a{color:white;
	       font-size:14px;
	       text-decoration: none;
		   font-family: Avenir, 'Microsoft Yahei', 'Hiragino Sans GB', 'Microsoft Sans Serif', 'WenQuanYi Micro Hei', sans-serif;
		  
	   }
	  .map-mode{
		  top:0px;
		  width:100%;
		  height:100%;
		  background:url(images/map.png) no-repeat;
		  background-size: cover;
		  z-index:-1;
		  }
	  .map-mode h2{
		  font-family: PingFang SC;
		  width:400px;
          font-weight: 400px;
		  margin-top:0px;
		  margin-bottom: 53px;
		  margin-left:auto;
		  margin-right:auto;
		  padding-top:5%;
          color: #fff;
          font-size: 35px;
          max-height: 100px;
          text-align: center;
          
		  z-index:1;
	  }
	  .map-navbar{
		 line-height: 56px;
         margin: 0 auto 0 auto;
         width: 798px;
         
		  }  
      .map-address{width:620px;
	           height:56px;
			   color:#999999;
			   font-size:18px;
			   border-width:0px;
			   line-height: 56px;
			   float:left;
			   padding-left:10px;
			   }
      .map-serach{height:56px;
	      width:157px;
		  background-color:#FF3737;
		  border-width:0px;
		  font-size:22px;
		  font-family:"宋体";
		  color:#FFFFFF;
		  float:right;
		  }
		.footer{
			width:100%;
			height:100px;
			margin:0px auto auto auto;
			position:absolute;
		}
   </style>
</head>

<body>
	<div class="container">
	    <div class="map-header">
	     <div class="reg">
	       <a href="login.jsp">商家登录</a> <a href="register.jsp">商家注册</a>
	     </div>
	     <div class="logo">
	      <a href="#">饱了么</a>
	     </div>
		</div>
		<div class="map-mode">
		    <h2><i>没吃饱？上饱了么！</i></h2>
			
			<div class="map-navbar">
				<form name="form" method="post" action="store_dish\storelist.jsp">
			   <input class="map-address" type="text" size="20" placeholder="    请输入你的收货地址(写字楼、小区、街道或者学校)" />
			   <input class="map-serach" type="submit"  value="搜 索" />
			   </form>
			</div>
		</div>
	</div>
	<div class="footer">
        <%@ include file="whitefooter.html"%>
    </div>
</body>
</html>
