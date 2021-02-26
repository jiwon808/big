package com.lec.ex1_string;

import java.util.Scanner;

public class Ex06searchTel_repeat {
	public static void main(String[] args) {
		String[] tels = { "010-9999-9999", "010-8888-8888", "010-7777-7777" };
		Scanner scanner = new Scanner(System.in); // 화면내용 스캔
		boolean searchok = false;// 1.전화번호 한번도 안뿌릴 경우 가 중복이 있을경우 //!
		System.out.println("찾고자하는 전화번호 뒷자리:");
		String searchTel = scanner.next(); // 8888
		for (int idx = 0; idx < tels.length; idx++) { // tels.length 는 3 (번호가 3개)
			String temp = tels[idx]; // 보기편하게
			String post = temp.substring(temp.lastIndexOf("-") + 1); // -있는index부터 +1하면 --> -있는index있는 다음부터
			if (searchTel.equals(post)) {
				System.out.println(tels[idx]);
				searchok = true; // 2.한번은 뿌렸다 //!
			} // if
		} // for
		if (!searchok) { // for문끝까지 돌았다 //!
			System.out.println("입력하신 전화번호는 없는 번호입니다.");
		} // if
	}// main
}// class
