package com.lec.loop;
// 컴퓨터와 가위바위보 게임을 -1을 입력할때까지 무한반복하는 게임을 작성하시오.(단, 가위대신 0, 바위대신 1, 보대신 2, 종료를 원하면 –1을 입력합니다)     [while]- 몇 번이 안정해진경우
import java.util.Scanner;

public class Hw3 {
	public static void main(String[] args) {
		int computer, you;
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("가위(0),바위(1),보(2)중 하나를 선택하시고, 종료를 원하면 (-1)을 입력하십시오: ");
			you = sc.nextInt();
			if (you == -1) {
				break;
			}//if       //-1이면 수행할 필요없기때문에 위에다 넣었다
			
			
			computer = (int)(Math.random()*3);
			if (you >2 || you<-1) {
				System.out.println("가위(0),바위(1),보(2)를 제대로 내세요.");
			} else if((you+2)%3==computer) {
				System.out.println("당신은" + (you==0? "가위":you==1?"바위":"보"));
				System.out.println("컴퓨터는"+(computer==0? "가위":computer==1? "바위":"보"));
				System.out.println("당신이 이겼어요");
			}else if (you == computer) {
				System.out.println("당신은" + (you==0? "가위":you==1?"바위":"보"));
				System.out.println("컴퓨터는"+(computer==0? "가위":computer==1? "바위":"보"));
				System.out.println("비겼어요");
			}else {
				System.out.println("당신은" + (you==0? "가위":you==1?"바위":"보"));
				System.out.println("컴퓨터는"+(computer==0? "가위":computer==1? "바위":"보"));
				System.out.println("당신이 졌어요");
			} //if	
		}//while
		sc.close();
		System.out.println("bye");
	}//main
}