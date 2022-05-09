package semi2.beans;

public class BuyDto {
	private int buyNo;
	private String MemberId;
	private int orderNo;
	private long buyInvoice;
	private String buyStatus;
	
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String MemberId) {
		this.MemberId = MemberId;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public long getBuyInvoice() {
		return buyInvoice;
	}
	public void setBuyInvoice(long buyInvoice) {
		this.buyInvoice = buyInvoice;
	}
	public String getBuyStatus() {
		return buyStatus;
	}
	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}
	
	
}