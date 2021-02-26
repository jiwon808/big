package com.lec.ex6_account;
// 두 사람 카드
//Account acc = new Account();
//Runnable target1 = new ATM_card(acc);
//Runnable target2 = new ATM_card(acc);
public class ATM_card implements Runnable {
	private boolean flag=false;
	private Account obj; //카드를 공유
	public ATM_card(Account obj) {
		this.obj = obj;
	}
	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			if(flag) {
				obj.withdraw(1000, Thread.currentThread().getName()); //mom이 찾을지 dad이 찾을지 모름
				flag = false;
			}else {
				obj.deposit(1000, Thread.currentThread().getName());
				flag = true;
			} 
		}
		
	}

}
