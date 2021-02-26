package com.lec.ex1_string;

import java.util.StringTokenizer;

public class Ex12_tokenArray {
	public static void main(String[] args) {
		// str를 tokenizer하여 names배열로
		String str = "강동원 유준상 하정우 차태현 권상우";
		String[] names;
		// space, \t, \n --> WhiteSpace
		StringTokenizer tokenizer = new StringTokenizer(str);
		names = new String[tokenizer.countTokens()];
		int idx = 0;
		while (tokenizer.hasMoreElements()) {
			names[idx++] = tokenizer.nextToken();
		}
		System.out.println("제대로 배열에 들어갔는지 확인");
		for (String name : names) {
			System.out.println(name);
		}

	}
}
