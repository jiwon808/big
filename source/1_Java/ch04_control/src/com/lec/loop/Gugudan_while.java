package com.lec.loop;

public class Gugudan_while {
	public static void main(String[] args) {
		int i=1;
		int j=1;
		while(i<4) {
			j=1;
			System.out.print(i+"단 시작: ");
		while(j<4) {
			System.out.print(i+"*"+j+"="+(i*j)+"\t");
			j++;
		}
		System.out.println();
		i++;
		}
	}
}
