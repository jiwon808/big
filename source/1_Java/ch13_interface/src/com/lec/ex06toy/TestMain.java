package com.lec.ex06toy;

public class TestMain {

	public static void main(String[] args) {
		IToy[] toy = { new Pooh(), // IToy로 형 일치.object말고는 실행안되고 있음. 왜 형을 일치하는지
				new MazingerToy(), new AirplaneToy() };
		for (IToy t : toy) {
			// t객체의 클래스 이름출력
			System.out.println(t.getClass().getName());
			// t.toSTRING()호출
			System.out.println(t); // toString 호출됨
			System.out.println("~~~~~~");
		}
	}
}
