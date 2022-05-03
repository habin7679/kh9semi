package semi2.beans;

public class AccountDto {
	private int orderNo;
	private String MemberId;
	private String AccountBank;
	private long AccountNo;
	private String AccountName;
	private int AccountPrice;
	private String AccountCheck;
	
	
	public String getAccountCheck() {
		return AccountCheck;
	}
	public void setAccountCheck(String accountCheck) {
		AccountCheck = accountCheck;
	}
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