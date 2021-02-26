package com.lec.ex;

// Car myPorsche = new Car();
// myPorsche.color = "red";
// Scanner sc = new Scanner (~);
public class Car { // 데이터(private)
	private String color;
	private int cc;
	private int speed;
	public String setColor;

	public Car() { // 생성자 = 리턴타입이 없고, 클라스명과 같은 이름의 메소드
		// 디폴트생성자함수는 생성자함수가 없을 때 JVM에 자동생성
		// 객체변수가 생성될 때 자동호출
		cc = 1000;
	}

	public void drive() { // 메소드 (public)
		speed = 60;
		System.out.println("운전한다 지금 속도:" + speed);
	}

	public void park() {
		speed = 0;
		System.out.println("주차한다 지금 속도:" + speed);
	}

	public void race() {
		speed = 120;
		System.out.println("레이싱한다. 지금 속도: " + speed);
	}

	// ~setColor("red")
	public void setColor(String color) {
		this.color = color; // 내 개체의 color에 color를 넣어라
	}

	// ~getColor()
	public String getColor() {
		return color;
	}

	// ~get.Cc()
	public int getCc() {
		return cc;
	}
}
