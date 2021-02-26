package com.lec.ex4_account;

public class Account {
	private String accountNo;
	private String ownerName;
	private int balance;

	// [생성자]
	public Account() {
	} // 매개변수가 없는 생성자

	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
	}

	public Account(String accountNo, String ownerName, int balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}

	// [메소드]
	// 예금:계좌정보출력 -> 예금 -> 예금후계좌정보출력
	public void deposit(int amount) {
		System.out.println("예금전: " + this); // 이 class안에 //여기서 this는 계좌,예금주, 잔액
		balance += amount;
		System.out.println("예금후: " + this);
	}

	// 출금: 계좌정보출력 -> 출금 ->예금후 계좌정보출력
	public void withdraw(int amount) throws Exception {
		if (balance < amount) { // 잔액부족으로 강제 예외발생 !! 중요
			throw new Exception(amount + "원 출금하기에는 잔액(" + balance + ")이 부족합니다"); // !!중요 //!!선언을 요가꺼자햐여 interface맞춰져
		}
		System.out.println("출금전: " + this);
		balance -= amount; // balance = balance - amount;
		System.out.println(amount + "원 출금후: " + this);
	}

	// [출력형식]
	@Override
	public String toString() {
		String result = "계좌번호: " + accountNo + "\t 예금주:" + ownerName;
		result += "\t잔액:" + balance;
		return result;
	}
	// 출금하다

}// class