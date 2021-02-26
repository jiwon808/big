package com.lec.loop;

//1+2+3+4+5+6+7+8+9+10+.........+20 = 210
public class Ex02_1 {
	public static void main(String[] args) {
		int tot = 0; // 누적할 변수
		for (int i = 1; i < 21; i++) {
			// tot 변수에 i값을 계속 누적
			tot = tot + i;
			if (i != 20) {
				System.out.print(i + "+"); //20이 아니면 계속 1씩 증가하면서 합
				
			} else {
				System.out.print(i + "=");
			} // if
		} // for
		System.out.println(tot);
	}
}
