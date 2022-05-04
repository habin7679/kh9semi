package semi2.beans;

import java.util.Date;

public class ProductDto {
	private int productNo;
	private String productName;
	private String productSort;
	private int productPrice;
	private int productStock;
	private String productCompany;
	private String productMadeString;
	private Date productMade;
	private String productExpireString;
	private Date productExpire;
	private String productEvent;
	private int productKcal;
	private int productProtein;
	private int productCarbohydrate;
	private int productFat;
	private String productInfo;
	private String productImg;
	
	
	@Override
	public String toString() {
		return "ProductDto [productNo=" + productNo + ", productName=" + productName + ", productSort=" + productSort
				+ ", productPrice=" + productPrice + ", productStock=" + productStock + ", productCompany="
				+ productCompany + ", productMadeString=" + productMadeString + ", productMade=" + productMade
				+ ", productExpireString=" + productExpireString + ", productExpire=" + productExpire
				+ ", productEvent=" + productEvent + ", productKcal=" + productKcal + ", productProtein="
				+ productProtein + ", productCarbohydrate=" + productCarbohydrate + ", productFat=" + productFat
				+ ", productInfo=" + productInfo + ", productImg=" + productImg + "]";
	}
	public ProductDto() {
		super();
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductSort() {
		return productSort;
	}
	public void setProductSort(String productSort) {
		this.productSort = productSort;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public String getProductCompany() {
		return productCompany;
	}
	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}
	public String getProductMadeString() {
		return productMadeString;
	}
	public void setProductMadeString(String productMadeString) {
		this.productMadeString = productMadeString;
	}
	public Date getProductMade() {
		return productMade;
	}
	public void setProductMade(Date productMade) {
		this.productMade = productMade;
	}
	public String getProductExpireString() {
		return productExpireString;
	}
	public void setProductExpireString(String productExpireString) {
		this.productExpireString = productExpireString;
	}
	public Date getProductExpire() {
		return productExpire;
	}
	public void setProductExpire(Date productExpire) {
		this.productExpire = productExpire;
	}
	public String getProductEvent() {
		return productEvent;
	}
	public void setProductEvent(String productEvent) {
		this.productEvent = productEvent;
	}
	public int getProductKcal() {
		return productKcal;
	}
	public void setProductKcal(int productKcal) {
		this.productKcal = productKcal;
	}
	public int getProductProtein() {
		return productProtein;
	}
	public void setProductProtein(int productProtein) {
		this.productProtein = productProtein;
	}
	public int getProductCarbohydrate() {
		return productCarbohydrate;
	}
	public void setProductCarbohydrate(int productCarbohydrate) {
		this.productCarbohydrate = productCarbohydrate;
	}
	public int getProductFat() {
		return productFat;
	}
	public void setProductFat(int productFat) {
		this.productFat = productFat;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductMadeStringNotNull() {
		if(this.productMadeString == null) {
			return "";
		}
		else { 
			return this.productMadeString.toString();
		}
	}
	public String getExpireStringNotNull() {
		if(this.productExpireString == null) return "";
		else return this.productExpireString.toString();
	}
	
	
}
