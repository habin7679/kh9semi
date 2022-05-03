package semi2.beans;

public class OrderDto {
	private int orderNo;
	private String memberId;
	private int productNo;
	private int orderCount;
	private boolean orderReview;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getmemberId() {
		return memberId;
	}
	public void setmemberId(String memberId) {
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
	public boolean isOrderReview() {
		return orderReview;
	}
	public void setOrderReview(boolean orderReview) {
		this.orderReview = orderReview;
	}
	
	
}