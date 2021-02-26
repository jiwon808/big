package com.lec.question;

// (연습문제 3) 두수를 입력받아 
// 두 수가 같은지 결과를 O나 X로 출력
// 첫번째 수가 더 큰지 결과를 O나 X로 출력한다
public class Q3 {
	public static void main(String[] args) {
		int n1 = 3, n2 = 7;
		System.out.println(n1 == n2 ? "O" : "X");
		System.out.println(n1 > n2 ? "O" : "X");
	}
}
