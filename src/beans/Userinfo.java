package beans;

public class Userinfo {
	private String userName; //用户名
	private String pwd; //登录密码
	private String storeName;		//店铺名称
	private String storeType;	//店铺类型
	private String storeIcon;	//店铺图标
	private String storeAddr;	//店铺地址
	private String bankAcc;	//银行账号
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public String getStoreType() {
		return storeType;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}
	public String getBankAcc() {
		return bankAcc;
	}
	public void setBankAcc(String bankAcc) {
		this.bankAcc = bankAcc;
	}
	public String getStoreIcon() {
		return storeIcon;
	}
	public void setStoreIcon(String storeIcon) {
		this.storeIcon = storeIcon;
	}
	
}
