package com.lec.loop;
// 1부터20까지 누적합을 출력

public class Ex02for {
	public static void main(String[] args) {
		int tot = 0; // 누적할 변수
		for(int i=1 ; i<21; i++) {
			// tot 변수에 i값을 계속 누적 
			tot = tot + i;
		}
		System.out.println("1~20까지의 누적합은 " + tot);
	}
}
