package com.lec.ex5_Book;

public interface Ilendable {
	public byte STATE_BORROWED =1; //대출중
	public byte STATE_NORMAL =0; //대출 가능
	public void checkOut(String borrower) throws Exception; //대출   예외발생
	public void checkIn() throws Exception; //반납   예외발생
}
