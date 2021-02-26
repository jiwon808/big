package com.lec.ex3_set;

import java.util.HashSet;
import java.util.Iterator;

public class Ex01_HashSet {
	public static void main(String[] args) {
		HashSet<String> hashset = new HashSet<String>();
		// "str0","str1", "str2","str3","str2" //마지막에 있는 str2안들어가 중복되었기 때문에
		hashset.add("str0");
		hashset.add("str1");
		hashset.add("str2");
		hashset.add("str3");
		System.out.println(hashset);
		System.out.println("hashset사이즈: " + hashset.size());
		hashset.add("str2"); // "str2".equals("str2") 결과가 true면 / "str2".hashcode()가지고 주소를 봐/ 같으면 안들어가
		System.out.println(hashset);
		System.out.println("hashset사이즈: " + hashset.size());

		Iterator<String> iterator = hashset.iterator(); // 알아서 반복자를 만든다
		while (iterator.hasNext()) { // point가리킬게 있니 있으면 print
			System.out.println(iterator.next());
		}

	}
}
