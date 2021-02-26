package com.lec.loop;

public class Q4_for {
	public static void main(String[] args) {
		for(int i=1; i<10; i++) {
			for(int j=2; j<10; j++) {
				System.out.printf("%d*%d=%2d  ",j,i,j*i); //%d == digits
			}
			System.out.println();// 개행
		}
	}
}
