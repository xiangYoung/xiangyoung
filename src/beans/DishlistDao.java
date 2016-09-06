package beans;

import java.util.List;

public interface DishlistDao 
{
	public Userinfo queryStorenameAndIconByUsername(String Username);
	public List queryDishlistByUsername(String Username);
	public boolean updateDishinfo(Dishlist dl);
	public boolean addDish(Dishlist dl);
	public boolean dropDish(Dishlist dl);
	//���ڲ˵�����ɾ���ġ���
}
