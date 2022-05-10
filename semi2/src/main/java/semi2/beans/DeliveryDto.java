package semi2.beans;

public class DeliveryDto {
	private String memberId;
	private	String deliveryName;
	private	String deliveryPost;
	private String deliveryBasicAddress;
	private String deliveryDetailAddress;
	private String deliveryMenu;
	private String deliveryPhone;
	public DeliveryDto() {
		super();
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getDeliveryPost() {
		return deliveryPost;
	}
	public void setDeliveryPost(String deliveryPost) {
		this.deliveryPost = deliveryPost;
	}
	public String getDeliveryBasicAddress() {
		return deliveryBasicAddress;
	}
	public void setDeliveryBasicAddress(String deliveryBasicAddress) {
		this.deliveryBasicAddress = deliveryBasicAddress;
	}
	public String getDeliveryDetailAddress() {
		return deliveryDetailAddress;
	}
	public void setDeliveryDetailAddress(String deliveryDetailAddress) {
		this.deliveryDetailAddress = deliveryDetailAddress;
	}
	public String getDeliveryMenu() {
		return deliveryMenu;
	}
	public void setDeliveryMenu(String deliveryMenu) {
		this.deliveryMenu = deliveryMenu;
	}
	public String getDeliveryPhone() {
		return deliveryPhone;
	}
	public void setDeliveryPhone(String deliveryPhone) {
		this.deliveryPhone = deliveryPhone;
	}
	@Override
	public String toString() {
		return "DeliveryDto [memberId=" + memberId + ", deliveryName=" + deliveryName + ", deliveryPost=" + deliveryPost
				+ ", deliveryBasicAddress=" + deliveryBasicAddress + ", deliveryDetailAddress=" + deliveryDetailAddress
				+ ", deliveryMenu=" + deliveryMenu + ", deliveryPhone=" + deliveryPhone + "]";
	}
	
	
}
