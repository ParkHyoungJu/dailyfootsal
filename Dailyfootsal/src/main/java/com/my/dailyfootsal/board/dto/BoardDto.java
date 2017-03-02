package com.my.dailyfootsal.board.dto;

public class BoardDto {
	private int num;
	private String title;
	private String name;
	private String contents;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	
	public BoardDto(){}

	public BoardDto(int num, String title, String name, String contents, String regdate, int startRowNum,
			int endRowNum) {
		super();
		this.num = num;
		this.title = title;
		this.name = name;
		this.contents = contents;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

}
