package javaweb.spring.model;

import java.sql.Date;
import java.util.List;

public class Order {
	private int orderId;
	private float price;
	private int status;
	private Date orderDate;
	private String fullname;
	private String address;
	private String phoneNumber;
	private List<ProductOrders> lProduct;
	private String userMail;
	private Date receivedDate;
	private String discount;
	public Order() {
		super();
	}
	
	
	public Order(int orderId, float price, int status, Date orderDate, String fullname, String address,
			String phoneNumber, List<ProductOrders> lProduct, String userMail, Date receivedDate, String discount) {
		super();
		this.orderId = orderId;
		this.price = price;
		this.status = status;
		this.orderDate = orderDate;
		this.fullname = fullname;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.lProduct = lProduct;
		this.userMail = userMail;
		this.receivedDate = receivedDate;
		this.discount = discount;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public List<ProductOrders> getlProduct() {
		return lProduct;
	}
	public void setlProduct(List<ProductOrders> lProduct) {
		this.lProduct = lProduct;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public Date getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	

}
