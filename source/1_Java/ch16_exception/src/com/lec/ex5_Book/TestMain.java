package com.lec.ex5_Book;

import java.util.Date;
import java.util.GregorianCalendar;

public class TestMain {

	public static void main(String[] args) {
		BookLib book = new BookLib("890ㄱ-100","Psychology","아들러");
		BookLib book1 = new BookLib("890ㄱ-200","Economics","맨큐");
		try {
			book.checkOut("kim");
			book1.checkOut("lee");
			book.setCheckOutDate(new Date(
					new GregorianCalendar(2020, 10, 30).getTimeInMillis()));//대출일조작
			book.checkIn();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}//try
		System.out.println(book);
		System.out.println(book1);
	}//main
}//class
