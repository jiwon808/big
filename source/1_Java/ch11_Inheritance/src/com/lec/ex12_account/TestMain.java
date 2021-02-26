package com.lec.ex12_account;

public class TestMain {
	public static void main(String[] args) {
		Account a1 = new Account("111-1111","홍길동");
		CheckingAccount a2 = new CheckingAccount("222-2222","성춘향",2000,"1234-1234-1234-1323");
		CheckingAccount a3 = new CreditLineAccount("222-2222","성춘향",2000,"1234-1234-1234-9999",2200); //객체새김 //2200000000(22억)이상이면 long써, int쓰면 error' 그리고 long쓰게되면 숫자뒤에L적어야 
		a1.deposit(3000);
		a2.withdraw(200);
		a3.deposit(3000);
		a1.printAccount();
		a2.pay("1234-1234-1323",200);
		a3.pay("1234-1234-1234-1234",5000);
	}
}
//checkingAccount 한도 0. 잔액에서 빠지지만
//신용카드는 잔액과 상관없이. 긁어지긴한다. 


//생성자1,2,3,4
//생성자 호출
