package com.lec.ex;

public class Ex01_1 {
	public static void main(String[] args) {
		int i = 10; // 변수의 선언과 초기화 공간4byte가 보장되면서 값10과 함께
		int[] iArr = { 10, 20, 30, 40, 50 }; // 배열 변수 선언과 초기화
		iArr[1] = 200; // 배열은 index로 접근 )index:0~4)
		for (int idx = 0; idx < 5; idx++) { // 일반for문
			System.out.println(iArr[idx]);
		}
		int[] iArr2 = new int[5]; // 2.배열 변수 선언과 배열메모리 공간확보
		for (int idx = 0; idx < iArr2.length; idx++) { // 일반for문
			System.out.println(idx + "번째값:" + iArr2[idx]);
		} // 더블배열은 0.0으로 청소
		System.out.println("************");
		int[] iArr3; // 3. 배열 변수 선언 (배열이 들어갈 수 있게 4byte공간확보해야하구나)
		iArr3 = new int[5]; // 0 0 0 0 0
		for (int temp : iArr3) { // 확장for문으로 값변경
			temp = 10;
		}
		for (int temp : iArr3) {// 확장 for문
			System.out.println(temp);
		}
		for (int idx = 0; idx < iArr3.length; idx++) {
			iArr3[idx] = 10; // 일반for문으로 값 변경(o)
		}
		for (int temp : iArr3) { // 확장for문
			System.out.println(temp);
		}
	} 
}
