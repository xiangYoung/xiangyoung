package beans;

import java.util.List;

public interface UserDao
{
   public int findUser(Userinfo user);
   public boolean validate(String user);
   public int getCount(String keyword);//获取数据库中含关键字的记录总数量
   public int getTotalPages(int count, int pageSize);//总页数
   //pageSize每页个数, pageIndex当前页数
   public List queryStoreByAddress(String keyword, int pageSize, int pageIndex);
   public List queryStoreByAddressAndStoretype(String keyword, int Storetype, int pageSize, int pageIndex);
   public boolean dropStoreByUsername(String Username);
   public boolean updateStoreinfo(Userinfo ui);
}