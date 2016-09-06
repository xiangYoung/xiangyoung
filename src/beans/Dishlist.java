package beans;

public class Dishlist 
{
	private String userName;
	private String dishName;
	private double price;
	private String dishIcon;
	private int quantity;
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDishIcon() {
		return dishIcon;
	}
	public void setDishIcon(String dishIcon) {
		this.dishIcon = dishIcon;
	}
	

}
