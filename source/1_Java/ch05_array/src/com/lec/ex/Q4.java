package com.lec.ex;
//76,45,34,89,100,50,90,92  8개의 값을 1차원 배열로 초기화 하고 값에 합계와  평균 그리고 최대값과 최소값을 구하는 프로그램을 작성 하시요. 

public class Q4 {
	public static void main(String[] args) {
		int[] array = { 76, 45, 34, 89, 100, 50, 90, 92 };
		int sum = 0, avg = 0, max = 0, min = 999;
		for (int i = 0; i < array.length; i++) {
			sum += array[i];
			if (array[i] > max)
				max = array[i];
			if (array[i] < min)
				min = array[i];
		}
		avg = sum / array.length;
		System.out.printf("sum= %d\t AVG = %d\n", sum, avg);
		System.out.printf("MAX= %d\t MIN = %d\n", max, min);
	}
}
