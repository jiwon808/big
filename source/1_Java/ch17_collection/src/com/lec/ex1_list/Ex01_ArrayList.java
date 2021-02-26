package com.lec.ex1_list;

//list타입에서 확장for문 많이 써
import java.util.ArrayList;

public class Ex01_ArrayList {
	public static void main(String[] args) {
		String[] array = new String[3];
		array[0] = "str0";
		array[1] = "str1";
		array[2] = "str2";
		for (int idx = 0; idx < array.length; idx++) {
			System.out.println("array[" + idx + "] =" + array[idx]);
		}
		for (String arr : array) {
			System.out.println(arr);
		}
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add("str0"); // 0번 index에 들어감 "str0"이라는 string주소가 들어감
		arrayList.add("str1"); // 1번 index
		arrayList.add("str2"); // 2번 index
		arrayList.add(1, "111111"); // 1번 index 뒤에꺼 한칸씩 밀림
		for (int idx = 0; idx < arrayList.size(); idx++) {
			System.out.println("arrayList의" + idx + "번째=" + arrayList.get(idx));
		}
		arrayList.remove(1); // 1번 index값 삭제 (2번 index가 1번으로, 3번 index가 2번으로)
		System.out.println(arrayList);
		arrayList.clear(); // arrayList의 모든 데이터 삭제
		// if(arrayList.size()==0) {
		if (arrayList.isEmpty()) { // 비어있니
			System.out.println("arrayList 비워짐");
		}
		System.out.println(arrayList);
		arrayList = null;
		if (arrayList.size() == 0) {
			System.out.println("arrayList 비워짐");
		}
//		iterator<String> iterator = arrayList.iterator(); //데이터만 나와 //index까지 나오려면for문 이용
	}
}
