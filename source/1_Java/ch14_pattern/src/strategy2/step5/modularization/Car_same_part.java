package strategy2.step5.modularization;

import strategy2.step5.component.IEngine;
import strategy2.step5.component.IFuel;
import strategy2.step5.component.IKm;

public class Car_same_part {
	private IEngine engine;
	private IKm km;
	private IFuel fuel;

	public void shape() {
		System.out.println(" door, sheet, handle로 이루어져 있습니다.");
	}

	public void drive() {
		System.out.println(" drive할 수 있어야 합니다.");
	}

	public void isEngine() {
		engine.engine(); // engine변수에 있는 engine호출
	}

	public void isKm() {
		km.km();
	}

	public void isFuel() {
		fuel.fuel();
	}

	// setter
	public void setEngine(IEngine engine) {
		this.engine = engine;
	}

	public void setKm(IKm km) {
		this.km = km;
	}

	public void setFuel(IFuel fuel) {
		this.fuel = fuel;
	}
}