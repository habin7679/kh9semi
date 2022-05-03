package semi2.beans;

import java.sql.Date;

public class PayingDto {
	private int orderNo;
	private String memberId;
	private int payingTotal;
	private Date payingDate;
	private String payingName;
	private long payingPhone;
	private int payingPost;
	private String payingBasicAddress;
	private String payingDetailAddress;
	private int payingDeliveryFee;
	private Date payingDeliveryDate;
	private String payingPayway;
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
	public int getPayingTotal() {
		return payingTotal;
	}
	public void setPayingTotal(int payingTotal) {
		this.payingTotal = payingTotal;
	}
	public Date getPayingDate() {
		return payingDate;
	}
	public void setPayingDate(Date payingDate) {
		this.payingDate = payingDate;
	}
	public String getPayingName() {
		return payingName;
	}
	public void setPayingName(String payingName) {
		this.payingName = payingName;
	}
	public long getPayingPhone() {
		return payingPhone;
	}
	public void setPayingPhone(long payingPhone) {
		this.payingPhone = payingPhone;
	}
	public int getPayingPost() {
		return payingPost;
	}
	public void setPayingPost(int payingPost) {
		this.payingPost = payingPost;
	}
	public String getPayingBasicAddress() {
		return payingBasicAddress;
	}
	public void setPayingBasicAddress(String payingBasicAddress) {
		this.payingBasicAddress = payingBasicAddress;
	}
	public String getPayingDetailAddress() {
		return payingDetailAddress;
	}
	public void setPayingDetailAddress(String payingDetailAddress) {
		this.payingDetailAddress = payingDetailAddress;
	}
	public int getPayingDeliveryFee() {
		return payingDeliveryFee;
	}
	public void setPayingDeliveryFee(int payingDeliveryFee) {
		this.payingDeliveryFee = payingDeliveryFee;
	}
	public Date getPayingDeliveryDate() {
		return payingDeliveryDate;
	}
	public void setPayingDeliveryDate(Date payingDeliveryDate) {
		this.payingDeliveryDate = payingDeliveryDate;
	}
	public String getPayingPayway() {
		return payingPayway;
	}
	public void setPayingPayway(String payingPayway) {
		this.payingPayway = payingPayway;
	}
	
	
	
}