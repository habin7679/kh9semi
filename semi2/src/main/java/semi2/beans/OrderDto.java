package semi2.beans;

public class OrderDto {
	private int orderNo;
	private String customerId;
	private int productNo;
	private int orderCount;
	private boolean orderReview;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public boolean isOrderReview() {
		return orderReview;
	}
	public void setOrderReview(boolean orderReview) {
		this.orderReview = orderReview;
	}
	
	
}
