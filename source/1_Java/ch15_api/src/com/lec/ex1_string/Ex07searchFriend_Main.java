package com.lec.ex1_string;

import java.util.Scanner;

//전화번호 뒷자리로 친구 찾기
public class Ex07searchFriend_Main {
	public static void main(String[] args) {
		Friend[] friends = { new Friend("홍길동", "010-9999-9999", "12-14"),
				new Friend("신길동", "010-8888-8888", "08-14"),
				new Friend("김길동", "010-8888-7777", "01-14") };
		// 찾을 친구의 전화번호 뒷자리를 입력받음
		// friends배열에서 해당 전화번호 뒷자리와 같은 친구가 있으면 그 친구를 출력
		// 없으면 없다고 출력
		Scanner scanner = new Scanner(System.in);
		boolean searchok = false;
		System.out.println("찾을 친구의 전화번호 뒷자리를 입력해주세요");
		String searchTel = scanner.next(); // 괄호안에 있는거 출력하라
		for (int idx = 0; idx < friends.length; idx++) {
			String temp = friends[idx].getTel(); // ?
			String post = temp.substring(temp.lastIndexOf("-") + 1);
			if (post.equals(searchTel)) {
				System.out.println(friends[idx].toString()); // Object의 toString() //toString()내용 맘에 안들면, 내가 재정의
				friends[idx].print();
//				break; //중복된 뒷번호가 없을 경우 
				searchok = true; // 중복된 뒷번호가 있을 경우

			} // if
		} // for
		if (!searchok) {
			System.out.println("해당번호의 친구가 없습니다.");
		}
	}// main
}// class
