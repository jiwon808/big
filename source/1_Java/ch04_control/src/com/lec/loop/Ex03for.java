package com.lec.loop;

public class Ex03for {
	public static void main(String[] args) {
		for (int i=1; i<=5; i++) {      //i가1개일때  j2개,i가 2개일때j3개 ..i가4개일때j5개 멈
			for(int j=1; j<=i; j++) {
				System.out.print('*');
			}
			System.out.println(); //개행
		}
//		for (int i=1; i<=5; i++) {
//			System.out.print('*');
//		}
	}
}
