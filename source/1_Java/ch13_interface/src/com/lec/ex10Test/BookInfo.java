package com.lec.ex10Test;

public class BookInfo {
	private String bookNo; // 책청구번호 ex. 300 ㄱ-100
	private String bookTitle; //책제목 ex.Physics
	private String writer;   //저자
	public BookInfo() {}
	public BookInfo(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	public String getBookNo() {
		return bookNo;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public String getWriter() {
		return writer;
	}

}
	//getter필요. 다른파일에서 책제목,넘버 비교시 필요

