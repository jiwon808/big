package com.lec.ex3_set;

import java.util.HashSet;
import java.util.Random;
import java.util.TreeSet;

//로또번호 6자리를 중복되지 않게  hashset이용
public class Ex02_Lotto {
	public static void main(String[] args) {
		TreeSet<Integer> lotto = new TreeSet<Integer>();
		Random random = new Random();
		// for(int i=0; i<6; i++) {
		// lotto.add((int)(Math.random()*45)+1); //이거는 static
		while (lotto.size() < 6) {
			lotto.add(random.nextInt(45) + 1); // static아니여서 random을 선언해야
		}
		System.out.println(lotto);
	}
}
