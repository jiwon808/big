package com.lec.ex1_list;

import java.util.LinkedList;

public class Ex02_LinkedList {
	public static void main(String[] args) {
		LinkedList<String> linkedList = new LinkedList<String>();
		linkedList.add("str0"); // 0번 index
		linkedList.add("str1"); // 1번 index 0번뒤에 주소가 link/참조되어있다
		linkedList.add("str2"); // 2번 index
		linkedList.add(1, "1111"); // 1번 index //arraylist처럼 진짜이동이 아니고, 링크만 바꿔주면됨 (시간 덜 걸림) !! LinkedList의 장점
		System.out.println(linkedList);
		for (int i = 0; i < linkedList.size(); i++) // for문사용
			System.out.println(linkedList.get(i));
		linkedList.remove("1111"); // 지워짐
		System.out.println(linkedList);
		linkedList.clear(); // 다지워져서 linkedList.isEmpty물어보고 출력했을때 console에 "비워졌다" 나옴
		System.out.println(linkedList.isEmpty() ? "비워졌다" : "안 비워졌다");
	}
}