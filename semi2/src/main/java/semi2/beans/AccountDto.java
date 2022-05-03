package semi2.beans;

public class AccountDto {
	private int orderNo;
	private String memberId;
	private String AccountBank;
	private long AccountNo;
	private String AccountName;
	private int AccountPrice;
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
		memberId = memberId;
	}
	public String getAccountBank() {
		return AccountBank;
	}
	public void setAccountBank(String accountBank) {
		AccountBank = accountBank;
	}
	public long getAccountNo() {
		return AccountNo;
	}
	public void setAccountNo(long accountNo) {
		AccountNo = accountNo;
	}
	public String getAccountName() {
		return AccountName;
	}
	public void setAccountName(String accountName) {
		AccountName = accountName;
	}
	public int getAccountPrice() {
		return AccountPrice;
	}
	public void setAccountPrice(int accountPrice) {
		AccountPrice = accountPrice;
	}
	
	
}