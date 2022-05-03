package semi2.beans;

public class BuyDto {
	private int buyNo;
	private String memberId;
	private int orderNo;
	private long buyDelivery;
	private String buyStatus;
	
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getmemberId() {
		return memberId;
	}
	public void setmemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public long getBuyDelivery() {
		return buyDelivery;
	}
	public void setBuyDelivery(long buyDelivery) {
		this.buyDelivery = buyDelivery;
	}
	public String getBuyStatus() {
		return buyStatus;
	}
	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}
	
	
}