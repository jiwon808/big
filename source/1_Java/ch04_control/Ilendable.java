package com.lec.ex10Test;

public interface Ilendable {
	public byte STATE_BORROWED = 1; // 대출중
	public byte STATE_NORMAL = 0;   // 대출가능
	public void checkOut(String borrower, String checkOutDate); //대출
	public void checkIn(); //반납
	public void printState(); // "Physics" 김지원저 대출가능
						      // "Physics" 김지원저 대출중
}