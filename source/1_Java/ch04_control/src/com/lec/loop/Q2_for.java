package com.lec.loop;
// 1~10까지 숫자 중 홀수의 합을 구해보자
public class Q2_for {
	public static void main(String[] args) {
		int sum = 0;
//		for (int i=1; i<11; i+=2)
		for(int i=1; i<11; i++) {
			if(i%2 == 1) {    //홀수일때만 합
				sum += i; // sum = sum+ i
			}
		}
		System.out.println("1~10까지의 홀수의 합은"+ sum);
	}
}
