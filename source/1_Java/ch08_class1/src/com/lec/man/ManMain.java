package com.lec.man;

public class ManMain {
	public static void main(String[] args) {
		Man kim = new Man(20, 170, 60, "010-1234-9999");
		Man yi = new Man(20, 170, 60); // Man이라는 클라스를 보고, 데이터&메소드 잡혀
		Man kang = new Man(20, "010-1234-9999");
		Man[] students = { kim, yi, kang };
		Man[] student = { new Man(20, 170, 60, "010-1234-9999"), new Man(20, 170, 60), new Man(20, "010-1234-9999") };

		yi.setTel("010-8888-8888");
		kang.setHeight(180);
		kang.setWeight(65);
		double biman = kim.calculateBMI();
		if (biman > 24) {
			System.out.println("kim은 비만이니 건강 조심");
		} else {
			System.out.println("kim은 다이어트 금지"); //
		} // if
		biman = yi.calculateBMI();
		System.out.println(biman > 24 ? "건강조심다이어트" : "다이어트 금지"); //
		biman = kang.calculateBMI();
		System.out.println(biman > 24 ? "건강조심다이어트" : "다이어트 금지"); //
	}// main
}
