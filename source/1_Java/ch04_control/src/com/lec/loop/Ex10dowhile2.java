package com.lec.loop;

import java.util.Scanner;

public class Ex10dowhile2 {
	public static void main(String[] args) {
//		//0이상 1미만의 난수 실수 
//		System.out.println(Math.random()); 
//		//0이상45미만의 난수 
//		System.out.println(Math.random()*45); 
//		//0~44사이의 난수 정수 
//		System.out.println((int)(Math.random()*45));
//		//1~45사이의 난수 정수 
//		System.out.println((int)(Math.random()*45)+1);
		Scanner scanner = new Scanner (System.in); 
		int lotto=(int)(Math.random()*45)+1;// 컴퓨터 로또 난수 
		int su;// 사용자에게 입력받은 수를 저장하는 변수
		int min = 1;
		int max = 45;
		do {
			System.out.printf("%d부터%d까지 번호 한개를 알아맞춰 보세요",min ,max);
			su = scanner.nextInt();
			if(su>lotto) {
				System.out.println(su+"보다 작은 수를 도전하세요");
				max = su-1;
			}else if (su<lotto) {
				System.out.println(su+"보다 큰수를 도전하세요");
				min = su+1;
			}
		}while(su!=lotto);
		System.out.println("축하드립니다.맞추셨습니다");
	}
}
