package beans;

import java.util.List;

public interface UserDao
{
   public int findUser(Userinfo user);
   public boolean validate(String user);
   public int getCount(String keyword);//��ȡ���ݿ��к��ؼ��ֵļ�¼������
   public int getTotalPages(int count, int pageSize);//��ҳ��
   //pageSizeÿҳ����, pageIndex��ǰҳ��
   public List queryStoreByAddress(String keyword, int pageSize, int pageIndex);
   public List queryStoreByAddressAndStoretype(String keyword, int Storetype, int pageSize, int pageIndex);
   public boolean dropStoreByUsername(String Username);
   public boolean updateStoreinfo(Userinfo ui);
}