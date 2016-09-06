package beans;

public interface BankinfoDao 
{
	public int checkAcc(Bankinfo bi);	//0正常1账号不存在2密码不正确3钱不够
	public boolean addmoney(Bankinfo bi, double money);//向该账号转入钱
	//对于银行账户的增、删、改、查
	
}
