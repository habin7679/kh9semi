package semi2.beans;

import java.sql.Date;

public class AccountDto {
	private int orderNo;
	private String memberId;
	private String accountBank;
	private long accountNo;
	private String accountName;
	private int accountPrice;
	private String accountCheck;
	private Date accountDate;
	
	
	public String getAccountCheck() {
		return accountCheck;
	}
	public void setAccountCheck(String accountCheck) {
		this.accountCheck = accountCheck;
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
	public String getAccountBank() {
		return accountBank;
	}
	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}
	public long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public int getAccountPrice() {
		return accountPrice;
	}
	public void setAccountPrice(int accountPrice) {
		this.accountPrice = accountPrice;
	}
	
	
}