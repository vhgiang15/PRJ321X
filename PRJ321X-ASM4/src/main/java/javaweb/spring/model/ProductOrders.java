package javaweb.spring.model;

public class ProductOrders {
	private String srcProduct;
	private int productId;
	private int quantity;
	private float amountProduct;
	private String nameProduct;
	private float priceProduct;
	public ProductOrders(String srcProduct, int productId,int quantity, String nameProduct, float priceProduct) {
		super();
		this.srcProduct = srcProduct;
		this.productId = productId;
		this.quantity=quantity;
		this.amountProduct = quantity*priceProduct;
		this.nameProduct = nameProduct;
		this.priceProduct = priceProduct;
	}
	public String getSrcProduct() {
		return srcProduct;
	}
	public void setSrcProduct(String srcProduct) {
		this.srcProduct = srcProduct;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public float getAmountProduct() {
		return amountProduct;
	}
	public void setAmountProduct(float amountProduct) {
		this.amountProduct = amountProduct;
	}
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	public float getPriceProduct() {
		return priceProduct;
	}
	public void setPriceProduct(float priceProduct) {
		this.priceProduct = priceProduct;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	

}
