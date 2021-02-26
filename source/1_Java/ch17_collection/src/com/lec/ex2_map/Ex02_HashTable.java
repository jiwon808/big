package com.lec.ex2_map;

import java.util.Hashtable;
import java.util.Iterator;

public class Ex02_HashTable {
	public static void main(String[] args) {
		Hashtable<String, String> hashtable = new Hashtable<String, String>();
		hashtable.put("010-9999-9999", "홍길동");
		hashtable.put("010-8888-8888", "김길동");
		hashtable.put("010-7777-7777", "신길동");
		hashtable.put("010-6666-6666", "윤길동"); // key는 유일해야 한다. 만약에 신과 윤 둘다 6666이면 신길동 이사라진다
		System.out.println(hashtable);
		Iterator<String> iterator = hashtable.keySet().iterator();
		while (iterator.hasNext()) { // 전화번호, 이름 다 뿌려
			String key = iterator.next();
			System.out.println(key + ":" + hashtable.get(key));
		}
	}
}
