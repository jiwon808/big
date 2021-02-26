package com.lec.ex2_date;

public class Ex09_Sawon_TestMain {
	public static void main(String[] args) {
		Sawon s1 = new Sawon("a01", "홍길동", PartType.COMPUTER); // 실수로 데이터가 어긋나게 하지 않게 //PartType이라는 새로운 타입
		Sawon s2 = new Sawon("a01", "홍길동", PartType.COMPUTER, 2020, 12, 10);
		System.out.println(s1.toString());
		System.out.println(s2.toString());
	}
}
