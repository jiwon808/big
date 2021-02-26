package com.lec.loop;

import java.util.Scanner;

// 컴퓨터와 가위바위보 게임을 당신이 이길 때까지 무한반복하는 게임을 작성하시오.(단, 가위대신 0, 바위대신 1, 보대신 2)
public class Hw4 {
	public static void main(String[] args) {
		int computer,you;
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("가위(0),바위(1),보(2)중 하나선택(당신이 이길때까지): ");
			you = sc.nextInt();
			computer = (int)(Math.random()*3);
			if(you>2 || you <-1) {
				System.out.println("가위(0),바위(1),보(2)중 하나선택(당신이 이길때까지):");
			}else if((you+2)%3==computer) {
				System.out.println("당신은 "+(you==0? "가위":you==1? "바위":"보"));
				System.out.println("컴퓨터는 "+(computer==0? "가위":computer==1? "바위":"보"));
				System.out.println("당신이 이겼어요");
			}else if(you == computer) {
				System.out.println("당신은 "+(you==0? "가위":you==1? "바위":"보"));
				System.out.println("컴퓨터는 "+(computer==0? "가위":computer==1? "바위":"보"));
				System.out.println("비겼어요");
			}else {
				System.out.println("당신은 "+(you==0? "가위":you==1? "바위":"보"));
				System.out.println("컴퓨터는 "+(computer==0? "가위":computer==1? "바위":"보"));
				System.out.println("당신이 졌어요");
			} //if
		} while ((you+1)%3==computer || you==computer); //do-while
			sc.close();
			System.out.println("bye");
	}//main
}
