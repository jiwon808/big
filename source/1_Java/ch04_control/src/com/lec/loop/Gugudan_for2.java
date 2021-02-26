package com.lec.loop;

public class Gugudan_for2 {
	public static void main(String[] args) {
		for(int i=1;i<4;i++){
			System.out.print(i+"단 시작 : ");
			for(int j=1;j<4;j++){
				System.out.print(i + "*" + j + "=" + (i*j) + "\t");
			}
			System.out.println();
		}
	}
}
