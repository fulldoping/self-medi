package com.fulldoping.free.dto;

import java.util.Date;

public class FreeComments {

	private int commentNo;
	private int boardNo;
	private String userId;
	private String commentContent;
	private Date commentDate;
	
	@Override
	public String toString() {
		return "FreeComments [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userId=" + userId
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
	
	
}
