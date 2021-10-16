package dto;

import java.util.Date;

public class Dclare {

	private int boardNo;
	private int userNo;
	private String userId;
	private String boardTitle;
	private Date boardDate;
	private String boardContent;
	private String fileupLoad;
	
	@Override
	public String toString() {
		return "Dclare [boardNo=" + boardNo + ", userNo=" + userNo + ", userId=" + userId + ", boardTitle=" + boardTitle
				+ ", boardDate=" + boardDate + ", boardContent=" + boardContent + ", fileupLoad=" + fileupLoad + "]";
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getFileupLoad() {
		return fileupLoad;
	}
	public void setFileupLoad(String fileupLoad) {
		this.fileupLoad = fileupLoad;
	}

	
	
	
}
