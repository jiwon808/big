package com.lec.ex5_Book;

import java.util.InputMismatchException;
import java.util.Scanner;

public class BookMain {

	public static void main(String[] args) {
		BookLib[] books = { new BookLib("890ㄱ-100", "Psychology", "아들러"), 
				new BookLib("890ㄱ-200", "Economics", "맨큐"),
				new BookLib("890ㄱ-102", "oracle", "이길동"), 
				new BookLib("890ㄱ-103", "python", "김길동") };
		Scanner scanner = new Scanner(System.in);
//		int fn, idx=0; 
		int fn;
		int idx;
		String bTitle, borrower, checkOutDate;
		do {
			System.out.println("0:전체 대출여부 상태 열람 | 1:대출 | 2:반납 | 그 외(문자포함):종료"); // a를 입력하면 그냥 종료//숫자면 안빠져, 문자치면 빠져
			try {
				fn = scanner.nextInt();
			} catch (InputMismatchException e) {
				System.out.println("0,1,2 그 외 문자를 입력하시면 종료됩니다.");
				break;
			} // ****************************!!중요
			switch (fn) {
			case 0:
				for (BookLib book : books) {
					System.out.println(book);
				}
				break; // !!중요
			case 1:
				// 대출처리 1.책이름입력 2.책검색 3.책상태확인 4.대출자입력 5.대출처리
				System.out.print("대출할 책 이름은?"); // (1)단계. 책이름입력
				scanner.nextLine(); //// 버퍼가 깨끗할까 생각하고 써 .버퍼의 상태를 고려 . \n을지우는역할
				bTitle = scanner.next();
				for (idx = 0; idx < books.length; idx++) { // 0번방,1번방,2번방,3번방 // (2)단계. 책검색
					if (bTitle.equals(books[idx].getBookTitle())) {
						break;
					} // if
				} // for
				if (idx == books.length) {
					System.out.println("본 도서관에는 해당 도서가 없습니다");
				} else if (books[idx].getState() == BookLib.STATE_BORROWED) { // (3) 단계. 책상태확인
					System.out.println(bTitle + "도서는 대출중입니다");
				} else {
					System.out.print("대출인은?"); // (4)단계. 대출인입력
					borrower = scanner.next();
					System.out.print("대출일은?");
//					checkOutDate = scanner.next();    
					try {
						books[idx].checkOut(borrower); // (5)대출처리
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
//					books[idx].checkOut(checkOutDate);
				}
				break;
			case 2:
				// 반납처리 1.책이름 2.책검색 3.반납처리
				System.out.print("반납할 책 이름은?"); // (1)단계. 책이름
				scanner.nextLine();
				bTitle = scanner.next(); // 책이름에 space까지 받음.
				for (idx = 0; idx < books.length; idx++) { // (2)단계. 책검색
					if (bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if (idx == books.length) {
					System.out.println("해당 도서는 본 도서관의 책이 아닙니다");
				} else {
					try {
						books[idx].checkIn(); // (3)단계. 반납처리
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
				break;
			default:
				System.out.println("0,1,2 그 외 문자를 입력하시면 종료됩니다.");
			}
		} while (fn == 0 || fn == 1 || fn == 2);

		System.out.println("시스템 종료");
	}

}
