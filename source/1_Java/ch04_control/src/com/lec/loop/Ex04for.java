package com.lec.loop;

public class Ex04for {
	public static void main(String[] args) {
		for (int i=15 ; i<51; i++) {
			System.out.print(i + "\t");
			if(i%5 ==4) {
				System.out.println(); //개행추가 
			} //if문
		} //for문 .  for문 괄호한에 있는 전체 수행 
	}
}
