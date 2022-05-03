package semi2.beans;

public class CreditDto {
	private int orderNo;
	private String MemberId;
	private String cardName;
	private int cardNum;
	private String cardPw;
	private int cardPrice;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String MemberId) {
		this.MemberId = MemberId;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public int getCardNum() {
		return cardNum;
	}
	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardPw() {
		return cardPw;
	}
	public void setCardPw(String cardPw) {
		this.cardPw = cardPw;
	}
	public int getCardPrice() {
		return cardPrice;
	}
	public void setCardPrice(int cardPrice) {
		this.cardPrice = cardPrice;
	}
	
	
}