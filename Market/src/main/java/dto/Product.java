package dto;

import java.io.Serializable; // 인터페이스 쓰려고

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String productID;		// 상품 아이디
	private String pname;			// 상품명
	private Integer unitPrice;		// 상품 가격
	private String description;		// 상품 설명
	private String menufacturer;	// 제조사
	private String category;		// 분류
	private long unitInStock;		// 재고
	private String condition;		// 상품 상태(신상, 중고, 재생품)
	private String image;			// 이미지 이름
	private Integer count;			// 수량
	
	public Product() {
		super();
	}
	
	public Product(String productID, String pname, Integer unitPrice) {
		this.productID = productID;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	
	public Product(String productID, String pname, Integer unitPrice, Integer count) {
		this.productID = productID;
		this.pname = pname;
		this.unitPrice = unitPrice;
		this.count = count;
	}
	
	public Product(String productID, String pname, Integer unitPrice,
			String description, String menufacturer, String category, long unitInStock, String condition, String image) {
		this.productID = productID;
		this.pname = pname;
		this.unitPrice = unitPrice;
		this.description = description;
		this.menufacturer = menufacturer;
		this.category = category;
		this.unitInStock = unitInStock;
		this.condition = condition;
		this.image = image;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMenufacturer() {
		return menufacturer;
	}

	public void setMenufacturer(String menufacturer) {
		this.menufacturer = menufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(long unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}