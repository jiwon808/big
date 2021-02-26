package com.lec.loop;
// i가 1일때 누적합은 X이다 (i가 1~10까지)
public class Ex08while {
	public static void main(String[] args) {
		int i=1;
		int sum=0;
		while(i<=10) {
			sum +=i; // sum=sum+i;
//			System.out.println("i가" +i+"일 때 누적합은" +sum+"이다");
			System.out.printf("i가%d일 때 누적합은 %d다 \n",i,sum);
			++i;
		}
		for(int j=1; j<=10; j++) {
			System.out.printf("i가%d일 때 누적합은 %d다 \n",i,sum);			
		}
	}
}
// while조건보고 실행,  do while 수행하고 조건봐 (가위바위보해보고 내가 이기면 계속 안이기면 그만)