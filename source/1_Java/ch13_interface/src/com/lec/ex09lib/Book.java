package com.lec.ex09lib;

//new Book("890ㄱ-102나","자바","홍길동")
public class Book implements ILendable {
	private String bookNo; // 책청구번호ex. 890 ㄱ-102나
	private String bookTitle; // 책제목 ex.자바
	private String writer; // 저자
	private String borrower; // 대출인 (입력)
	private String checkOutDate; // 대출일(입력)
	private byte state;

	public Book() {
	} // 디폴트 생성자

	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
//		borrower = null; checkOutDate = null;
		state = STATE_NORMAL; // ILendable2꺼 (implements ILendable2에서가져온것)
	}
	// Book b = new Book("890ㄱ-102나","자바","홍길동")
	// b.checkOut("신길동","201209");

	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if (state != STATE_NORMAL) {
			System.out.println("대출중인 도서입니다");
			return; // 아무값없이 그냥 나를 호출한 곳으로 감; return 0은 안됨 왜냐하면 지금은 void //!throw
		}
		// 대출처리 로직
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		// "자바" 도서가 대출되었습니다
		System.out.println(" \" " + bookTitle + "도서가 대출되었습니다"); // \"는 쌍따움표를 string으로 인식
	}

	// b.checkIn()
	@Override
	public void checkIn() { // !throw 추가
		if (state != STATE_BORROWED) {
			System.out.println("대출 중인 도서가 아닙니다.이상합니다."); // !throw 예외발생
			return;
		}
		// 반납 처리 로직
		borrower = null;
		checkOutDate = null; // !날짜 비교 14일 지나면 연체료 (어제 예제), 1일 100씩 연체료 , Y를 눌러야 연체료 됨//Y를 눌러야 반납처리됨.
								// scanner변수 필요
		state = STATE_NORMAL;
		// "자바"도서가 반납처리 되었습니다.
		System.out.println("\"" + bookTitle + "\"도서가 반납되었습니다");
	}

	// b.printState() -> 자바 , 홍길동저 - 대출가능(대출중)
	@Override
	public void printState() {
		if (state == STATE_NORMAL) {
			System.out.printf("%s, %s저 - 대출가능\n", bookTitle, writer);
		} else if (state == STATE_BORROWED) {
			System.out.printf("%s,%s저 - 대출중 \n", bookTitle, writer);
		} else {
			System.out.printf("%s,%s - 유령상태입니다\n", bookTitle, writer);
		}
//		String msg = bookTitle + ","+writer+ "-";
//		msg += state == STATE_NORMAL? "대출가능":"대출중";
//		System.out.println(msg);

	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getWriter() {
		return writer;
	}

	public String getBorrower() {
		return borrower;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public byte getState() {
		return state;
	}

	public String getBookNo() {
		return bookNo;
	}

	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}

}
