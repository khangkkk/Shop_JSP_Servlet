package my.com.model;

public class Order {
	private int id_order;
	private int id_user;
	private int id_pro;
	private String dateBuy;
	private int quantity;
	private double total;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public int getId_order() {
		return id_order;
	}

	public void setId_order(int id_order) {
		this.id_order = id_order;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getId_pro() {
		return id_pro;
	}

	public void setId_pro(int id_pro) {
		this.id_pro = id_pro;
	}

	public String getDateBuy() {
		return dateBuy;
	}

	public void setDateBuy(String dateBuy) {
		this.dateBuy = dateBuy;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Order [id_order=" + id_order + ", id_user=" + id_user + ", id_pro=" + id_pro + ", dateBuy=" + dateBuy
				+ ", quantity=" + quantity + ", total=" + total + "]";
	}

}
