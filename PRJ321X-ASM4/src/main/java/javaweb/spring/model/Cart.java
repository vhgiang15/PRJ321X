package javaweb.spring.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<ProductOrders> items;

	public void setItems(List<ProductOrders> items) {
		this.items = items;
	}

	public Cart() {
		items = new ArrayList<>();
	}

	public void add(ProductOrders ci) {
		for (ProductOrders x : items) {
			if (ci.getProductId() == x.getProductId()) {
				x.setQuantity(x.getQuantity() + 1);
				x.setAmountProduct(x.getQuantity()*x.getPriceProduct());
				return;
			}
		}
		items.add(ci);
	}

	public void remove(int id) {
		for (ProductOrders x: items) {
			if (x.getProductId() == id) {
				items.remove(x);
				return;
			}

		}

	}
	public float getAmount() {
		float s=0;
		for(ProductOrders x: items) {
			s=s+x.getQuantity()* x.getPriceProduct();	
			
		}
		return s;
		
	}
	public List<ProductOrders> getItems(){
		
		return items;
		
	}
	
	public void increaseProduct(int idProduct)
	{
		for (ProductOrders x : items) {
			if (idProduct == x.getProductId()) {
				x.setQuantity(x.getQuantity() + 1);
				x.setAmountProduct(x.getQuantity()*x.getPriceProduct());
			}
		}
		
		
	}
	
	public void decreaseProduct(int idProduct)
	{
		for (ProductOrders x : items) {
			if ((idProduct == x.getProductId())&&(x.getQuantity()>1)) {
				x.setQuantity(x.getQuantity() - 1);
				x.setAmountProduct(x.getQuantity()*x.getPriceProduct());
			}
		}
		
		
	}

}
