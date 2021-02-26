package com.tj.Account;

public class AccountMain {
	public static void main(String[] args) {
		Account hong = new Account("110-1", "홍길동", 10000);
		Account hong1 = new Account("110-2", "홍일");
		Account hong2 = new Account();
		hong2.setAccountNo("110-9");
		hong2.setOwnerName("신길동");
		hong.deposit(10000);
		hong.info();
		hong1.withdraw(1);
		hong1.info();
		hong2.deposit(10000);
		hong2.withdraw(20000);
		hong2.info();
	}

}
