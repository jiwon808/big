package com.lec.ex1_string;

import java.util.StringTokenizer;

public class Ex11_StringToken {
	public static void main(String[] args) {
		String str1 = "강동원 유준상 하정우 차태현 권상우";
		String str2 = "2020/12/14";
		// space, \t, \n단위로 token나눔
		StringTokenizer tokenizer1 = new StringTokenizer(str1);
		StringTokenizer tokenizer2 = new StringTokenizer(str2, "/");
		System.out.println("token1의 갯수:" + tokenizer1.countTokens());
		while (tokenizer1.hasMoreTokens()) {
			System.out.println(tokenizer1.nextToken());
		}
		System.out.println("token2의 갯수:" + tokenizer2.countTokens());
		while (tokenizer2.hasMoreElements()) {
			System.out.println(tokenizer2.nextToken());
		}
	}
}
