package semi2.beans;

import java.util.Date;

public class ProductDto {
	private int product_no;
	private String product_name;
	private String product_sort;
	private int product_price;
	private int product_stock;
	private String product_company;
	private String product_madeString;
	private Date product_made;
	private String product_expireString;
	private Date product_expire;
	private String product_event;
	private int product_kcal;
	private int product_protein;
	private int product_carbohydrate;
	private int product_fat;
	private String product_info;
	private String product_img;
	@Override
	public String toString() {
		return "ProductDto [product_no=" + product_no + ", product_name=" + product_name + ", product_sort="
				+ product_sort + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_company=" + product_company + ", product_made=" + product_madeString + ", product_expire="
				+ product_expireString + ", product_event=" + product_event + ", product_kcal=" + product_kcal
				+ ", product_protein=" + product_protein + ", product_carbohydrate=" + product_carbohydrate
				+ ", product_fat=" + product_fat + ", product_info=" + product_info + ", product_img=" + product_img
				+ "]";
	}
	public int getProductno() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_sort() {
		return product_sort;
	}
	public void setProduct_sort(String product_sort) {
		this.product_sort = product_sort;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_company() {
		return product_company;
	}
	public void setProduct_company(String product_company) {
		this.product_company = product_company;
	}
	
	public String getProduct_madeString() {
		return product_madeString;
	}
	public void setProduct_madeString(String product_madeString) {
		this.product_madeString = product_madeString;
	}
	public Date getProduct_made() {
		return product_made;
	}
	public void setProduct_made(Date product_made) {
		this.product_made = product_made;
	}
	public String getProduct_expireString() {
		return product_expireString;
	}
	public void setProduct_expireString(String product_expireString) {
		this.product_expireString = product_expireString;
	}
	public Date getProduct_expire() {
		return product_expire;
	}
	public void setProduct_expire(Date product_expire) {
		this.product_expire = product_expire;
	}
	public String getProduct_event() {
		return product_event;
	}
	public void setProduct_event(String product_event) {
		this.product_event = product_event;
	}
	public int getProduct_kcal() {
		return product_kcal;
	}
	public void setProduct_kcal(int product_kcal) {
		this.product_kcal = product_kcal;
	}
	public int getProduct_protein() {
		return product_protein;
	}
	public void setProduct_protein(int product_protein) {
		this.product_protein = product_protein;
	}
	public int getProduct_carbohydrate() {
		return product_carbohydrate;
	}
	public void setProduct_carbohydrate(int product_carbohydrate) {
		this.product_carbohydrate = product_carbohydrate;
	}
	public int getProduct_fat() {
		return product_fat;
	}
	public void setProduct_fat(int product_fat) {
		this.product_fat = product_fat;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_MadeStringNotNull() {
		if(this.product_madeString == null) {
			return "";
		}
		else { 
			return this.product_madeString.toString();
		}
	}
	public String getExpireStringNotNull() {
		if(this.product_expireString == null) return "";
		else return this.product_expireString.toString();
	}
	
	
}
