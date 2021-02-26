package com.lec.ex07Car;

//HighGradeCar : tax, color(레드), tire(광폭타이어), displacement(2200), handle(파워핸들), getSpec()
public class HighGradeCar extends Car {
	private int tax = 100000;

	public HighGradeCar(String color, String tire, int displacement, String handle) {
		super(color, tire, displacement, handle);

	}

	@Override
	public void getSpec() {
		System.out.println("********************");
		System.out.println("색상: " + getColor());
		System.out.println("타이어: " + getTire());
		System.out.println("배기량: " + getDisplacement());
		System.out.println("핸들: " + getHandle());
		if (getDisplacement() > 1600) {
//			tax = tax +(getDisplacement()-1500)*200;
			tax += (getDisplacement() - 1500) * 200;
		}
		System.out.println("세금: " + tax);
		System.out.println("********************");
	}
}
