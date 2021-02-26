package com.lec.ex07Car;

//LowGradeCar : tax, color(블루), tire(일반타이어), displacement(2000), handle(파워핸들), getSpec()
public class LowGradeCar extends Car {
	private int tax = 50000;

	public LowGradeCar(String color, String tire, int displacement, String handle) {
		super(color, tire, displacement, handle);

	}

	@Override
	public void getSpec() { // spec들 출력(tax포함)
		System.out.println("********************");
		System.out.println("색상: " + getColor());
		System.out.println("타이어: " + getTire());
		System.out.println("배기량: " + getDisplacement());
		System.out.println("핸들: " + getHandle());
		if (getDisplacement() > 1000) {
//			tax = tax +(getDisplacement()-1000)*100;
			tax += (getDisplacement() - 1000) * 100;
		}
		System.out.println("세금: " + tax);
		System.out.println("********************");
	}

}
