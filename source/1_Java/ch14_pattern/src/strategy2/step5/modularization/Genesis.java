package strategy2.step5.modularization;

import strategy2.step5.component.*;

//모든 자동차는 기본적으로 drive할 수 있어야 합니다.
//자동차 모양은 door, sheet, handle로 이루어져 있습니다.

//Genesis 차 : 최고급엔진(EngineHigh).  연비 10Km/l(Km10). 휘발유(FuelGasoline)
public class Genesis extends Car_same_part { // 삭제후 extends Car_same_part
	public Genesis() {
//		engine = new EngineHigh();
		setEngine(new EngineHigh()); // i=10; == setI(10);
		setKm(new Km10());
		setFuel(new FuelGasoline());
	}

	@Override
	public void shape() {
		System.out.println("Genesis의 차모양은 door, sheet, handle로 이루어져 있습니다.");
	}

}
