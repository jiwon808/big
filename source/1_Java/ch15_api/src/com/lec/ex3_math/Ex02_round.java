package com.lec.ex3_math;

//69.56반올림 
public class Ex02_round {
	public static void main(String[] args) {
		System.out.println("소수점에서 반올림, 올림, 버림");
		System.out.println("9.12을 올림: " + (int) Math.ceil(9.12));
		System.out.println("9.12을 반올림: " + Math.round(9.12));
		System.out.println("9.12을 버림: " + (int) Math.floor(9.12));
		System.out.println("소수점 한자리에서 반올림, 올림, 버림");

		System.out.println("소수점에서 반올림, 올림, 버림");
		System.out.println("9.15을 올림: " + Math.ceil(9.15 * 10) / 10);// 소수 반올림 하려면, x10의 그 수의 결과를 얻고 다시 /10 (곱하고, 나누고)
		System.out.println("9.15을 반올림: " + Math.round(9.15 * 10) / 10.0); // round의 return type은 정수이기 때문에 소수를 원하면 10.0으로
																			// 써
		System.out.println("9.15을 내림: " + Math.floor(9.15 * 10) / 10);

		System.out.println("일의 자리에서 반올림, 올림, 버림");
		System.out.println("85을 올림(90) : " + Math.ceil(85 / 10.0) * 10); // (나누고, 곱하고)
		System.out.println("85을 올림:(90) : " + Math.round(85 / 10.0) * 10); // 8.5반올림해서 9 나오고 *10 =90
		System.out.println("85을 올림:(90) : " + Math.floor(85 / 10.0) * 10); // 8.5반올림해서 8나오고 *10 =80
	}
}
