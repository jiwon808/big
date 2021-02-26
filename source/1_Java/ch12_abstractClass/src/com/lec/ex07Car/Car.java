package com.lec.ex07Car;
//LowGradeCar : tax, color(블루), tire(일반타이어), displacement(2000), handle(파워핸들), getSpec()
public abstract class Car {   //밑에  abstract void getSpec이기에 class car도 abstract
	private String color;     // 차색상
	private String tire;      // 타이어                //TIRE 대문자는  final변수==상수 만 
	private int displacement; // 배기량
	private String handle;    //핸들
	//[생성자]
	public Car(String color, String tire, int displacement, String handle) {
		super();
		this.color = color;
		this.tire = tire;
		this.displacement = displacement;
		this.handle = handle;
	}
	public abstract void getSpec();  //void == return하지 않는것    //왜 선언만
	public String getColor() {
		return color;
	}
	public String getTire() {
		return tire;
	}
	public int getDisplacement() {
		return displacement;
	}
	public String getHandle() {
		return handle;
	}

}
