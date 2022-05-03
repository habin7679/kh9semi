package semi2.beans;

public class CartDto {
	private String MemberId;
	private int productNo;
	private int cartAmount;
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String MemberId) {
		this.MemberId = MemberId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCartAmount() {
		return cartAmount;
	}
	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}
	
	
}