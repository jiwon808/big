package com.lec.ex5_Book;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class BookLib implements Ilendable {
	private String bookNo;
	private String bookTitle;
	private String writer;
	private String borrower;
	private Date checkOutDate;
	private byte state;

	public BookLib() {
	}

	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
		state = STATE_NORMAL;
	}

	@Override
	public void checkOut(String borrower) throws Exception {
		if (state != STATE_NORMAL) {
			throw new Exception(bookTitle + "은대출중인 도서입니다");
		}
		this.borrower = borrower;
//		this.checkOutDate=checkOutDate;
		checkOutDate = new Date();
		state = STATE_BORROWED;
		System.out.println(" \" " + bookTitle + "도서가 대출되었습니다");
		System.out.println("대출인" + borrower); // **************복습
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일(E)"); // simpleDateFormat
		System.out.println("[대출일]" + sdf.format(checkOutDate));
	}

	@Override
	public void checkIn() throws Exception {
		if (state != STATE_BORROWED) {
			throw new Exception(bookTitle + "대출 중인 도서가 아닙니다. 이상합니다.");
		}
		Date now = new Date();
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff / (24 * 60 * 60 * 1000); // !!!!!
		if (day > 14) {
			System.out.println("연체료 일일 100원 부가합니다.");
			day = day - 14;
			System.out.println("내셔야할 연체료는" + (day * 100) + "원");
			Scanner scanner = new Scanner(System.in);
			System.out.print("연체료를 내셨나요(Y/N)?");
			if (!scanner.next().equalsIgnoreCase("y")) { // !!!!!
				System.out.println("연체료를 내셔야 반납쳐리가 됩니다.");
				return;
			}
		}
		this.borrower = null;// ****************************반납을했때 빌린사람이 없어서 null값
		checkOutDate = null;
		state = STATE_NORMAL;
		System.out.println("\"" + bookTitle + "\"이(가)★반납★되었습니다."); // !!!state
	}

	@Override
	public String toString() {
		String temp = "\" " + bookTitle + "(" + bookNo + ")\" " + writer + " 저";
		if (state == STATE_NORMAL) {
			temp += "대출가능";
		} else if (state == STATE_BORROWED) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) HH:mm");
			temp += "대출(" + sdf.format(checkOutDate) + ")중";
		} else {
			temp += "유령상태";
		}
		return temp;
	}

	// 0를 안누르고 a 누르면 exception처리 --> 프로그램 종료 try catch break
	// fn받은 후 . try catch감싸고.

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	/*
	 * public String getWriter() { return writer; }
	 * 
	 * public String getBorrower() { return borrower; }
	 */ // 검색시 책 제목만 필요하고, 이 둘은 쓰이지 않는다

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) { // Date조작을 해서 set필요
		this.checkOutDate = checkOutDate;
	}

	public byte getState() {
		return state;
	}

}
