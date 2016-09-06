package beans;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;
public class UserDaoimp implements UserDao {

	public  int findUser(Userinfo user) {
		Connection con=null;
		PreparedStatement pStatement=null;
		ResultSet res=null;
		int valid = 0;
		try
		{
			//初始化上下文
		   Context ctx=new InitialContext();
		   //获取与逻辑名相关联的数据源对象
		   DataSource ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/dataRes");
		   con=ds.getConnection();
		   //这个查询应该查询部分属性
		   String sql="select * from userinfo where userName = ? ";
		   pStatement=con.prepareStatement(sql);
		   pStatement.setString(1, user.getUserName());
		   res=pStatement.executeQuery();
		   
		   if(!res.next())
			   valid = 1;	//用户名不存在
		   else if(res.next() && !res.getString("pwd").equals(user.getPwd()))
			   valid = 2;	//密码不正确
		   else
			   valid = 0;	//验证通过
		   res.close();
		   pStatement.close();
		   con.close();
		}
		catch(Exception ex)
		{
		   ex.printStackTrace();
		}
		return valid;
	}

	public boolean validate(String user) {
		boolean valid = false;
		Userinfo ui = new Userinfo();
		ui.setUserName(user.trim());
		if(findUser(ui) != 1)
				valid = true;
		return valid;
	}
	//获取数据库中含关键字的记录总数量
	public int getCount(String keyword) 
	{
		int count = 0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try
		{ 
			Context ctx=new InitialContext();
		    //获取与逻辑名相关联的数据源对象
			DataSource ds = (DataSource)ctx.lookup("java:/comp/envbc/dataRes");
			con=ds.getConnection();
            String nsql = "select count(*) from userinfo where storeAddr like '%"+keyword+"%'";
  	        
  	        //执行代码
            st=con.createStatement();
            rs=st.executeQuery(nsql);
            if(rs.next())
            	count = rs.getInt(1);
            rs.close();
			st.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	//总页数
	public int getTotalPages(int count, int pageSize) 
	{
		int totalpages = 0;
		totalpages = (count % pageSize == 0) ? (count / pageSize) : (count / pageSize + 1);
		return totalpages;
	}
	
	//keyword地址关键字 pageSize每页个数, pageIndex当前页数
	public List queryStoreByAddress(String keyword, int pageSize, int pageIndex) 
	{
		//String sql = "select * from (select rownum as r, t.* from (" 
			//+ "select news.* from news order by ncreatedate desc) t" 
			//+ " where rownum<=" 
			//+ pageSize * pageIndex
			//+") where r >"
			//+pageSize * (pageIndex - 1);
		
		
			  List list = new ArrayList();
			  try
			  {
				  Class.forName("oracle.jdbc.OracleDriver").newInstance();//实例化驱动 
				  String url="jdbc:oracle:thin:@localhost:1521:orcl";//数据库地址 
				  Connection conn=DriverManager.getConnection(url,"sys as sysdba","admin");//建立连接 
				  String sql="select storeicon,storename from(select rownum r,t1.* from(select * from userinfo where storeaddr like '"
					                +keyword+"' order by username) t1 where rownum<="
					                +pageSize * pageIndex+") where r>="+(pageIndex - 1) * pageSize;
				  PreparedStatement pst=conn.prepareCall(sql);
				  ResultSet res=pst.executeQuery(sql);
				  while(res.next())
				  {
					 Userinfo user=new Userinfo();
			         user.setStoreIcon(res.getString(1));
			         user.setStoreName(res.getString(2));
			         list.add(user);
				  }
				  res.close();
				  pst.close();
				  conn.close();
			  }
			  catch(Exception ex)
			  {
		         ex.printStackTrace();
			  }
			  return list;
	}

	public boolean dropStoreByUsername(String Username) {
		// TODO Auto-generated method stub
		return false;
	}

	public List queryStoreByAddressAndStoretype(String keyword, int Storetype,
			int pageSize, int pageIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateStoreinfo(Userinfo ui) {
		// TODO Auto-generated method stub
		return false;
	}
}