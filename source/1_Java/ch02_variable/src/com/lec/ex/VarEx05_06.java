package com.lec.ex;

public class VarEx05_06 {
	public static void main(String[] args) {
		float f;
		double d; // double d가 정확성이 좀 더 높다
		f = 3.14159265359f; // 0.101*10의2승 : 0.101E2 //f로하면 4byte로 짤라서 넣는다
		d = 3.14159265359;
		System.out.println(f);
		System.out.println(d);
		f = 10.001f;
		d = 10.001;
		System.out.println("f=" + f);
		System.out.println("d=" + d);
		if (f == d) // == 같은 주소를 가리키고 있는지
			System.out.println("둘이 같다");
		else
			System.out.println("둘이 다르네");
	}
}