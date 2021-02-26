package com.lec.ex3_math;

import java.util.Random;

//6개 숫자. 6번 난수. 첫번째 0방,1방, 2방
//이렇게 하면 로도 넘버 중 중복 숫자 발생
//배열 단점: 중복허용, 방들 숫자 정해져있어
public class Ex04_lotto {
	public static void main(String[] args) {
		Random random = new Random();
		int[] lotto = new int[6];
		for (int i = 0; i < lotto.length; i++) {
//			lotto[i] = random.nextInt(45)+1;
			int temp = random.nextInt(45) + 1; // 1-45중 한 숫자
			boolean ok = true;
			for (int j = 0; j < i; j++) {
				if (temp == lotto[j]) { // 중복된 것 뽑힌 경우 만약에1번방에 들어갈 숫자가, 0번방에 있는 숫자와 같다. 그럼 break
					i--;
					ok = false;
					break; // for -j 반복문 빠져나감
				}
			} // for - 중복확인
			if (ok) {
				lotto[i] = temp;
			}
		}
		for (int l : lotto) {
			System.out.print(l + "\t");
		} // for

	}// main
}// class