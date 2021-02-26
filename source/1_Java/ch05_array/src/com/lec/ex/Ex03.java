package com.lec.ex;

public class Ex03 {
	public static void main(String[] args) {
		int[] score = { 10, 20, 30, 40, 50 };
		int[] s = new int[score.length];
//		for(int i=0; i<score.length; i++) {
//			s[i] = score[i];
//		}
		System.arraycopy(score, 0, s, 0, score.length); 
		s[0] = 999;
		for (int i = 0; i < s.length; i++) {
			System.out.printf("s[%d]=%d,score[%d]=%d\n", i, s[i], i, score[i]);
		}
	}
}
