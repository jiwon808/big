package com.lec.ex;

public class Ex04 {
	public static void main(String[] args) { 
//		Ex04 ex= new Ex04();        ex변수    Ex04 ex를 불러 
//		ex.printCh();
		Ex04 ex = new Ex04();
		printCh();
		System.out.println("Hello,World!");
		printCh('=');
		System.out.println("Hello,Java");
		printCh('-', 30);
	}

	private static void printCh(char ch, int count) {
		for (int cnt = 1; cnt <= count; cnt++) { // ch가 count개 있는 라인
			System.out.print(ch);
		}
		System.out.println();
	}

	private static void printCh(char ch) {
		for (int cnt = 1; cnt <= 20; cnt++) { // ch가 20개 있는 라인
			System.out.print(ch);
		}
		System.out.println(); // 개행
	}

	private static void printCh() { // static은 메모리에 잡혀. 따라서 호출 할 수 있다
		for (int cnt = 1; cnt <= 20; cnt++) {
			System.out.println('*');
		}
		System.out.println();
	}
}
