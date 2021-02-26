package com.lec.ex6_account;

public class ATM_cardTestMain {
	public static void main(String[] args) {
		Account account = new Account(2000); // 숫자를 넣읗 수 있는 이유:  public Account(int balance)
		Runnable target = new ATM_card(account);
		Thread mom = new Thread(target,"mom");
		Thread dad = new Thread(target,"dad");
		mom.start();
		dad.start();
		
	}
}
