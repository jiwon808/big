package com.lec.ex2_map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.lec.ex1_list.Customer;

public class Ex01_HashMap {
	public static void main(String[] args) {
		String[] strArr = new String[5];
		ArrayList<String> strlist = new ArrayList<String>(); // '객체 데이터 타입'만 들어간 //int같은 기초데이터 타입은 안들거감
		strlist.add("str11");
		HashMap<Integer, String> hashmap = new HashMap<Integer, String>();
		hashmap.put(9, "str11"); // 키값11으로 str11값을 넣겠다
		hashmap.put(22, "str22"); // new Integer(22)
		hashmap.put(23, "str39"); // key,value
		System.out.println(hashmap.get(23));
		System.out.println("remove전:" + hashmap);
		hashmap.remove(9);
		System.out.println("remove후: " + hashmap); // index 없는set형,map형은 for i는 몇부터 몇 안통함. // 그것을 지원해주는api를써야 iterator
		hashmap.clear(); // hashmap에 있는 데이터 모두 제거

		hashmap.put(0, "Hong gildong");
		hashmap.put(1, "Kim gildong");
		hashmap.put(2, "Lee soonshin");
		hashmap.put(3, "Yu ain"); // 컴퓨터가 실행할때 알아서 순서짜고 반복 돌려. point하는데 있니 다음.
		Iterator<Integer> iterator = hashmap.keySet().iterator(); // key값을 가져오려고 //map형,set형 다 사용가능 //for문 보다 iterator가
																	// 편함
		while (iterator.hasNext()) {
			Integer key = iterator.next();
			System.out.println(key + "의 데이터는" + hashmap.get(key));
		} // while
	}
}
