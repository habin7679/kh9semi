package semi2.beans;

import java.sql.Date;

public class BoardDto {
	private int boardNo;
	private String boardHead;
	private String boardTitle;
	private String boardContent;
	private Date boardTime;
	private String boardWriter;
	private int boardReadcount;
	private int boardProductNo;
	private int boardReplycount;
	private int groupNo;
	private int superNo;
	private int depth;
	
	
	
	public int getBoardReadcount() {
		return boardReadcount;
	}



	public void setBoardReadcount(int boardReadcount) {
		this.boardReadcount = boardReadcount;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public String getBoardHead() {
		return boardHead;
	}



	public void setBoardHead(String boardHead) {
		this.boardHead = boardHead;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getBoardContent() {
		return boardContent;
	}



	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}



	public Date getBoardTime() {
		return boardTime;
	}



	public void setBoardTime(Date boardTime) {
		this.boardTime = boardTime;
	}



	public String getBoardWriter() {
		return boardWriter;
	}



	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}



	public int getBoardProductNo() {
		return boardProductNo;
	}



	public void setBoardProductNo(int boardProductNo) {
		this.boardProductNo = boardProductNo;
	}



	public int getBoardReplycount() {
		return boardReplycount;
	}



	public void setBoardReplycount(int boardReplycount) {
		this.boardReplycount = boardReplycount;
	}



	public int getGroupNo() {
		return groupNo;
	}



	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}



	public int getSuperNo() {
		return superNo;
	}



	public void setSuperNo(int superNo) {
		this.superNo = superNo;
	}



	public int getDepth() {
		return depth;
	}



	public void setDepth(int depth) {
		this.depth = depth;
	}



	public BoardDto() {
		super();
	}
	
	
}
