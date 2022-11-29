package membership;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private ArrayList<Product> cart = new ArrayList<Product>();

	public ProductRepository() {
		
		Product phone = new Product("P1", "iPhone 6s", 800000);
		phone.setCategory("Smart Phone");
		phone.setCondition("New");
		phone.setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixel iSight Camera");
		phone.setMenufacturer("Apple");
		phone.setUnitInStock(1000);
		phone.setImage("아이폰.png");
		phone.setCount(0);
		
		Product notebook = new Product("P2", "LG PC 그램", 1500000);
		notebook.setCategory("Notebook");
		notebook.setCondition("New");
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setMenufacturer("LG");
		notebook.setUnitInStock(1000);
		notebook.setImage("그램.png");
		notebook.setCount(0);
		
		Product tablet = new Product("P3", "Galaxy Tab S", 900000);
		tablet.setCategory("Tablet");
		tablet.setCondition("New");
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setMenufacturer("Samsung");
		tablet.setUnitInStock(1000);
		tablet.setImage("갤럭시탭.png");
		tablet.setCount(0);
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String ProductId) {
		Product product = null;
		
		for (int i = 0; i < listOfProducts.size(); i++) {
			if (listOfProducts.get(i).getProductID().equals(ProductId)) {
				product = listOfProducts.get(i);
			}
		}
		return product;
	}
	
	public void Count(Product product) {
		product.setCount(0);
	}
	
	public void setCart(String ProductID, String Pname, Integer UnitPrice, Integer Count) {
		
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getPname().equals(Pname)) {
				cart.get(i).setCount(cart.get(i).getCount()+1);
				return;
			}
		}
		Product pd = new Product(ProductID, Pname, UnitPrice, Count);
		cart.add(pd);
	}
	
	public ArrayList<Product> getCart() {
		return cart;
	}
	
	public void cartDelete(String Pname) {
		
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getPname().equals(Pname)) {
				cart.remove(i);
				return;
			}
		}
	}
	
	public void cartDeleteAll() {
		cart.clear();
	}
	
	public void countPM(int count, String pm) {
		if (pm.equals("minus")) {
			cart.get(count).setCount(cart.get(count).getCount()-1);
		}
		else {
			cart.get(count).setCount(cart.get(count).getCount()+1);
		}
	}
	
	
	public void setAllProducts(String productID, String pname, Integer unitPrice,
			String description, String menufacturer, String category, long unitInStock, String condition, String image) {
		Product product = new Product(productID, pname, unitPrice, description, menufacturer, category, unitInStock, condition, image);
		listOfProducts.add(product);
	}
	
	public String getRandomStr(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required."; 
	}
	
}