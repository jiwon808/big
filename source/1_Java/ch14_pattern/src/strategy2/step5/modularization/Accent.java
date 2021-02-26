package strategy2.step5.modularization;

import strategy2.step5.component.EngineLow;
import strategy2.step5.component.FuelDiesel;
import strategy2.step5.component.Km20;

//Accent 차  : 저급엔진(EngineLow).     연비 20Km/l(Km20). 경유(FuelDiesel).
public class Accent extends Car_same_part {
	public Accent() {
		setEngine(new EngineLow());
		setKm(new Km20());
		setFuel(new FuelDiesel());

	}

	@Override
	public void shape() {
		System.out.print("Accent ");
		super.shape();
	}
}
