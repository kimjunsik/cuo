package cuo.web.board.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int postNum;
	private String boardTitle;
	private String postTitle;
	private String postContent;
	private int postReadcount;
	private String postWriter;
	private Timestamp postRegistTime;
	private int ref;
	private int re_step;
	private int re_level;
	private String ip; 
	private String id;
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getPostReadcount() {
		return postReadcount;
	}
	public void setPostReadcount(int postReadcount) {
		this.postReadcount = postReadcount;
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public Timestamp getPostRegistTime() {
		return postRegistTime;
	}
	public void setPostRegistTime(Timestamp postRegistTime) {
		this.postRegistTime = postRegistTime;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	} 
}
