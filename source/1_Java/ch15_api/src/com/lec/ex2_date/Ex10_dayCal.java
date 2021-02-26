package com.lec.ex2_date;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Ex10_dayCal {
	public static void main(String[] args) {
		Date checkOutDate = new Date(new GregorianCalendar(2020, 10, 15).getTimeInMillis()); // Date는1900년도가 기준
																								// (110,11,15) = new
																								// Date();
		// 실제 2020년11월15일
		Date now = new Date();
		// now.getTime() : now시점의 millisec
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff / (1000 * 60 * 60 * 24); // checkOutDate부터 몇일 지났는지 // /1000 몇초 지난는지 *60 몇분 *60몇시간 *24 몇일
		if (day > 14) { // 14일보다 크다 연체로직, 보다 작으면 반납로직
			day = day - 14;
			System.out.println("연체료" + (day * 100) + "원을 받으셨나요(Y/N)?");
			Scanner scanner = new Scanner(System.in);
			String ok = scanner.next(); // ok에 Y 가 들어와야
			if (!ok.equalsIgnoreCase("y")) { // y를 안누를 경우 앞에! ==반대
				System.out.println("연체료를 내셔야 반납처리 가능합니다");
				return; // main void이어서 return까지
			} // if
			System.out.println("반납합니다");
		} // if
	}// main
}// class