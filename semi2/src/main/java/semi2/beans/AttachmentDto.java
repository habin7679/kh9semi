package semi2.beans;

public class AttachmentDto {
	private int attachmentNo;
	private String attachmentSavename;
	private String attachmentUploadname;
	private String attachmentType;
	private long attachmentSize;
	
	public AttachmentDto() {
		super();
	}
	public int getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}
	public String getAttachmentSavename() {
		return attachmentSavename;
	}
	public void setAttachmentSavename(String attachmentSavename) {
		this.attachmentSavename = attachmentSavename;
	}
	public String getAttachmentUploadname() {
		return attachmentUploadname;
	}
	public void setAttachmentUploadname(String attachmentUploadname) {
		this.attachmentUploadname = attachmentUploadname;
	}
	public String getAttachmentType() {
		return attachmentType;
	}
	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}
	public long getAttachmentSize() {
		return attachmentSize;
	}
	public void setAttachmentSize(long attachmentSize) {
		this.attachmentSize = attachmentSize;
	}
}