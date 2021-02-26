package strategy2.step5.modularization;

import strategy2.step5.component.*;

//모든 자동차는 기본적으로 drive할 수 있어야 합니다.
//자동차 모양은 door, sheet, handle로 이루어져 있습니다.

//Genesis 차 : 최고급엔진(EngineHigh).  연비 10Km/l(Km10). 휘발유(FuelGasoline)
public class Genesis_old {
	private IEngine engine;
	private IKm km;
	private IFuel fuel;

	public Genesis_old() {
//		engine = new EngineHigh();
		setEngine(new EngineHigh()); // i=10; == setI(10);
		setKm(new Km10());
		setFuel(new FuelGasoline());
	}

	// 메소드
	public void shape() {
		System.out.println("Genesis 모양은 door, sheet, handle로 이루어져 있습니다.");

	}

	public void drive() {
		System.out.println("모든 자동차는 기본적으로 drive할 수 있어야 합니다.");
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
