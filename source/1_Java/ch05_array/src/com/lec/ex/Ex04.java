package com.lec.ex;

public class Ex04 {
	public static void main(String[] args) {
		int[][] test = { { 10, 20, 30 }, { 40, 50, 60 } };
		test[0][2] = 300;
		System.out.println(test[0][2]); // 0행2열
		for (int i = 0; i < test.length; i++) { // test.length=2
			for (int j = 0; j < test[i].length; j++) { // test[i].length=3
				System.out.printf("test[%d][%d] =%d\n", i, j, test[i][j]);
			}
		}

	}
}
