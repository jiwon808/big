package com.lec.ex09lib;

public class Test {
	public static void main(String[] args) {
		Book book1 = new Book("890ㅁ", "자바", "홍길동");
		Book book2 = new Book("890ㅂ", "하둡", "홍끼리");
		book1.checkIn(); // 뭐라한다
		book1.checkOut("신길동", "201209"); // 대출처리
		book1.checkOut("김길동", "201209"); // 뭐라한다
		book1.printState();
		book2.printState();
	}
}