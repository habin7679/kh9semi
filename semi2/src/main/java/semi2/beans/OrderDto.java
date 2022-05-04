package semi2.beans;

public class OrderDto {
	private int orderNo;
	private String memberId;
	private int productNo;
	private int productPrice;
	private int orderCount;
	private String orderReview;
	
	
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public String getOrderReview() {
		return orderReview;
	}
	public void setOrderReview(String orderReview) {
		this.orderReview = orderReview;
	}
	
	
}