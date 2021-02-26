package com.lec.ex1;

import com.lec.ex.Arithmetic; //다른 클라스를 이 파일에 가져옴

public class Ex {
	public static void main(String[] args) {
		Arithmetic ar = new Arithmetic();
		System.out.println("합은 " + ar.sum(20));

	}
}
