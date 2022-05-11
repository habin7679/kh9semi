package semi2.beans;

public class OrderDto {
	private int orderNo;
	private int productNo;
	private int productPrice;
	private int orderCount;
	private int orderPrice;
	private String orderReview;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice() {
		this.orderPrice = this.orderCount*this.productPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderReview() {
		return orderReview;
	}
	public void setOrderReview(String orderReview) {
		this.orderReview = orderReview;
	}
}