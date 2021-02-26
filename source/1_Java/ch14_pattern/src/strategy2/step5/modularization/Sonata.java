package strategy2.step5.modularization;

//Sonata차   : 중급엔진(EngineMid).     연비 15Km/l(Km15). 휘발유(FuelGasoline)
import strategy2.step5.component.*;

public class Sonata extends Car_same_part {
	public Sonata() {
//		engine = new EngineHigh();
		setEngine(new EngineMid()); // i=10; == setI(10);
		setKm(new Km15());
		setFuel(new FuelGasoline());
	}

	@Override
	public void shape() {
		System.out.println("Sonata의 차모양은 door, sheet, handle로 이루어져 있습니다.");
	}
}
