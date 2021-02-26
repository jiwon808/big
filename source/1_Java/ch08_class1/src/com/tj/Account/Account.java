package com.tj.Account;
/* 은행계좌클래스
 * 데이터 : 계좌번호 (accountNo:String)
 * 		   예금주    (ownerName:String)
 * 		   잔액       (balance:int)
 * 메소드: 예금한다 (void deposit(int money)) new Account("110-352","홍",10)
 * 		  인출하다 (int withdraw(int money)) new Account("110-352","홍")
 */

public class Account {
	private String accountNo;
	private String ownerName;
	private int balance;

	public Account() {
	}

	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
	}

	public Account(String accountNo, String ownerName, int balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}

	public void deposit(int amount) { // method만들기 . deposit&withdraw
		balance += amount;
	}

	public void withdraw(int amount) { // 잔액 부족시 "주의" 출력 return
		if (balance >= amount) {
			balance -= amount; // balance = balance - money;
		} else {
			System.out.println("잔액부족. 주의");
		}
	}

	public void info() {
		System.out.println("계좌번호:" + accountNo + "," + ownerName + "님 잔액은" + balance);
	}

	// getter & setter
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getBalance() {
		return balance;
	}
}
