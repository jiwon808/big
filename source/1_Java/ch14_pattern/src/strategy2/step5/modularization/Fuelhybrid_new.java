package strategy2.step5.modularization;

import strategy2.step5.component.IFuel;

public class Fuelhybrid_new implements IFuel {

	@Override
	public void fuel() {
		System.out.println("하이브리드 차량입니다");
	}

}// class
