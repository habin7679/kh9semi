package semi2.beans;

import java.sql.Date;

public class ReplyDto {
	private int replyNo;
	private String replyWriter;
	private int replyBoardNo;
	private String replyContent;
	private Date replyTime;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public int getReplyBoardNo() {
		return replyBoardNo;
	}
	public void setReplyBoardNo(int replyBoardNo) {
		this.replyBoardNo = replyBoardNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	public ReplyDto() {
		super();
	}
}
