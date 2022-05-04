package semi2.beans;

import java.sql.Date;

public class MemberDto {
	private String memberId; 
	private String memberPw;
	private String memberNick;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberBirth;
	private String memberPost;
	private String memberBasicAddress;
	private String memberDetailAddress;
	private int memberPoint;
	private String memberGrade;
	private Date memberJoindate;
	public MemberDto() {
		super();
		
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPost() {
		return memberPost;
	}

	public void setMemberPost(String memberPost) {
		this.memberPost = memberPost;
	}

	public String getMemberBasicAddress() {
		return memberBasicAddress;
	}

	public void setMemberBasicAddress(String memberBasicAddress) {
		this.memberBasicAddress = memberBasicAddress;
	}

	public String getMemberDetailAddress() {
		return memberDetailAddress;
	}

	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public Date getMemberJoindate() {
		return memberJoindate;
	}

	public void setMemberJoindate(String string) {
		this.memberJoindate = string;
	}

	@Override
	public String toString() {
		return "MemberDto [memberId=" + memberId + ", memberPw=" + memberPw + ", memberNick=" + memberNick
				+ ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail
				+ ", memberBirth=" + memberBirth + ", memberPost=" + memberPost + ", memberBasicAddress="
				+ memberBasicAddress + ", memberDetailAddress=" + memberDetailAddress + ", memberPoint=" + memberPoint
				+ ", memberGrade=" + memberGrade + ", memberJoindate=" + memberJoindate + "]";
	}
	
}